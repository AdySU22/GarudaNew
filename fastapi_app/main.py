import uuid
from datetime import datetime

from fastapi import FastAPI, HTTPException, Depends
from pydantic import BaseModel
from passlib.context import CryptContext
import uvicorn
import pytz

from umn import MySQL

app = FastAPI()

class AuthCheckRequest(BaseModel):
    token: str

class DeauthRequest(BaseModel):
    token: str

class LoginRequest(BaseModel):
    email: str
    password: str

class SignupRequest(BaseModel):
    name: str
    email: str
    telp: str
    password: str




class LoadSearchVenueRequest(BaseModel):
    location: str
    capacity: int
    date: str

class OrderVenueRequest(BaseModel):
    id: str
    amount: int
    date: str
    time: str 
    venue_id: str
    user_id: str

class RegisterVenueRequest(BaseModel):
    name: str
    description: str
    location: str
    capacity: int
    price: int
    open_day: str
    open_time: str
    close_time: str
    period: int


# Setup time
def get_indonesia_time() -> datetime:
    # Choose the appropriate time zone, e.g., 'Asia/Jakarta' for WIB
    indonesia_timezone = pytz.timezone('Asia/Jakarta')
    # Get the current time in UTC
    now_utc = datetime.now(pytz.utc)
    # Convert the current time to Indonesia time
    now_indonesia = now_utc.astimezone(indonesia_timezone)

    return now_indonesia


# Setup signup hashing
# Password hashing context
pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")
# Hash password
def hash_password(password: str):
    return pwd_context.hash(password)
# Verify password
def verify_password(plain_password, hashed_password):
    return pwd_context.verify(plain_password, hashed_password)



MYSQL_HOST = "127.0.0.1"
MYSQL_USER = "root"
MYSQL_PASSWORD = "password"
MYSQL_DATABASE = "umn"

mysql = MySQL(
    host=MYSQL_HOST,
    user=MYSQL_USER,
    password=MYSQL_PASSWORD,
    database=MYSQL_DATABASE
)






# util
def register_token(user_id: str, token: str):
    try:
        mysql.insert(
            table="token",
            columns=("user_id", "token"),
            values=[(user_id, token)]
        )

    except Exception as e:
        raise HTTPException(
            status_code=400,
            detail={
                "message": "Error registering token",
                "error": str(e)
            }
        )

def load_venue_data(id: str) -> dict:
    # Fetch venue information
    venue = mysql.fetch_one(f"SELECT * FROM venue WHERE id = '{id}'")

    if not venue:
        raise HTTPException(status_code=400, detail="Venue not found")

    # Get the column names from the cursor description
    column_names = [desc[0] for desc in mysql.cursor.description]

    # Convert the fetched data into a dictionary with column names as keys
    venue_dict = {column_names[i]: venue[i] for i in range(len(column_names))}

    return venue_dict

app = FastAPI()

@app.get("/")
def root():
    return "Hello, World! If you see this it mean it works."

@app.post("/auth")
def auth(request: AuthCheckRequest):
    # Fetch venue information
    auth = mysql.fetch_one(f"SELECT * FROM token WHERE token = '{request.token}'")
    
    if not auth:
        raise HTTPException(status_code=400, detail="Not authorized")
    
    # Convert the fetched data into a dictionary with column names as keys
    column_names = [desc[0] for desc in mysql.cursor.description]
    auth_dict = {column_names[i]: auth[i] for i in range(len(column_names))}
    
    auth_dict["message"] = "Authorized"
    return auth_dict

@app.post("/deauth")
def deauth(request: DeauthRequest):
    # Delete the token from the database
    try:
        mysql.delete(f"DELETE FROM token WHERE token = '{request.token}'")
    except Exception as e:
        raise HTTPException(
            status_code=400,
            detail={
                "message": "Error deauthorizing token",
                "error": str(e)
            }
        )
    
    return {
        "message": "Token deauthorized"
    }

@app.post("/login")
def login(request: LoginRequest) -> dict:
    # Check if account exists
    user = mysql.fetch_one(f"SELECT * FROM user WHERE email = '{request.email}'")
    if not user:
        raise HTTPException(status_code=400, detail="Invalid email or password")

    # Verify password
    input_password = request.password
    db_password = user[-2]
    if not verify_password(input_password, db_password):
        raise HTTPException(status_code=400, detail="Invalid email or password")

    # Successful login
    token = str(uuid.uuid4())

    # Insert the user ID and token into the database
    register_token(user[0], token)
    
    # Return
    return {
        "id": user[0],
        "name": user[1],
        "email": user[2],
        "telp": user[3],
        "message": "Login successful",
        "token": token
    }
    return request

@app.post("/signup")
def signup(request: SignupRequest) -> dict:
    """
        request: {
            "name": ...,
            "email": ...,
            "password": ...
        }
    """

    # Check if account exist
    if mysql.fetch_one(f"SELECT * FROM user WHERE email = '{request.email}'"):
        raise HTTPException(status_code=400, detail="Account already exist")
    
    # Insert new account
    id = str(uuid.uuid4())
    hashed_password = hash_password(request.password)
    try:
        mysql.insert(
            table="user",
            columns=("id", "name", "email", "password", "telp", "role"),
            values=[(id, request.name, request.email, hashed_password, request.telp, "client")]
        )
    except Exception as e:
        raise HTTPException(
            status_code=400, 
            detail={
                "message": "Error creating account",
                "error": str(e)
            }
        )

    # Generate token
    token = str(uuid.uuid4())
    # Register token
    register_token(id, token)
    
    # Return
    return {
        "id": id,
        "name": request.name,
        "email": request.email,
        "telp": request.telp,
        "message": "Account has been created",
        "token": token
    }


@app.post("/search/venue")
def search_venue(request: LoadSearchVenueRequest) -> dict:
    # Search for venues based on location, date, and capacity
    venues = mysql.fetch_all(f"SELECT * FROM venue WHERE location LIKE '%{request.location}%' and capacity >= {request.capacity}")
    
    result = []
    for venue in venues:
        open_day = [day.strip() for day in venue[5].split(",")]

        # Filter by date
        input_date = datetime.strptime(request.date, "%d-%m-%Y")
        # Get the day of the week (0=Monday, 6=Sunday)
        day_of_week = input_date.weekday()
        # Map the day of the week to its name
        days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
        day_name = days[day_of_week]

        if day_name in open_day:
            venue_dict = {}
            for i, column_name in enumerate(mysql.cursor.description):
                venue_dict[column_name[0]] = venue[i]
            result.append(venue_dict)
        
    return {
        "venues": result
    }

@app.get("/load/venue")
def load_venue_all() -> dict:
    venues = mysql.fetch_all("SELECT * FROM venue")
    result = []
    for venue in venues:
        venue_dict = {}
        for i, column_name in enumerate(mysql.cursor.description):
            venue_dict[column_name[0]] = venue[i]
        result.append(venue_dict)
    
    return {
        "venues": result
    }

@app.get("/load/venue/{id}")
def load_venue_id(id) -> dict:
    venue_dict = load_venue_data(id)
    return {
        "venue": venue_dict,
    }

@app.get("/load/venue/detail/{id}/{date}")
def load_venue_detail(id, date) -> dict:
    venue_dict = load_venue_data(id)
    open_time = int(venue_dict["open_time"].split(":")[0])
    close_time = int(venue_dict["close_time"].split(":")[0])
    period = int(venue_dict["period"])

    
    venue_hours = {}
    for hour in range(open_time, close_time, period):
        result = mysql.fetch_one(f"SELECT * FROM transaction WHERE venue_id = '{id}' AND date = '{date}' AND time = '{hour}:00'")
        if result:
            venue_hours[hour] = "occupied"
        else:
            venue_hours[hour] = "empty"

    return {
        "venue": venue_hours
    }
    

@app.get("/load/user/{id}")
def load_user(id):
    # Fetch venue information
    user = mysql.fetch_one(f"SELECT * FROM user WHERE id = '{id}'")

    if not user:
        raise HTTPException(status_code=400, detail="User not found")

    # Get the column names from the cursor description
    column_names = [desc[0] for desc in mysql.cursor.description]

    # Convert the fetched data into a dictionary with column names as keys
    user_dict = {column_names[i]: user[i] for i in range(len(column_names))}

    del user_dict["password"]
    return {
        "user": user_dict
    }



@app.post("/order/venue")
def order_venue(request: OrderVenueRequest) -> dict:
    # Insert order into the database
    try:
        id = str(uuid.uuid4())
        mysql.insert(
            table="transaction",
            columns=("id", "amount", "date", "time", "venue_id", "user_id"),
            values=[(id, request.amount, request.date, request.time, request.venue_id, request.user_id)]
        )
    except Exception as e:
        raise HTTPException(
            status_code=400, 
            detail={
                "message": "Error placing order",
                "error": str(e)
            }
        )

    # Return success message
    return {
        "message": "Order placed successfully"
    }

@app.post("/register/venue")
def register_venue(request: RegisterVenueRequest) -> dict:
    # Insert venue into the database
    try:
        mysql.insert(
            table="venue",
            columns=("name", "description", "location", "capacity", "price", "open_day", "open_time", "close_time", "period"),
            values=[(request.name, request.description, request.location, request.capacity, request.price, request.open_day, request.open_time, request.close_time, request.period)]
        )
    except Exception as e:
        raise HTTPException(
            status_code=400, 
            detail={
                "message": "Error registering venue",
                "error": str(e)
            }
        )

    # Return success message
    return {
        "message": "Venue registered successfully"
    }


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8888)

    # Close MySQL connection
    mysql.close()


