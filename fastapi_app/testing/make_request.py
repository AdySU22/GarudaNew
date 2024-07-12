import pytz
import requests
from datetime import datetime

# Setup time
def get_indonesia_time() -> datetime:
    # Choose the appropriate time zone, e.g., 'Asia/Jakarta' for WIB
    indonesia_timezone = pytz.timezone('Asia/Jakarta')
    # Get the current time in UTC
    now_utc = datetime.now(pytz.utc)
    # Convert the current time to Indonesia time
    now_indonesia = now_utc.astimezone(indonesia_timezone)

    return now_indonesia

indonesia_time = get_indonesia_time()
indonesia_time_iso = get_indonesia_time().isoformat()
day = indonesia_time.day
month = indonesia_time.month
year = indonesia_time.year
hour = indonesia_time.hour
minute = indonesia_time.minute

print(f"Day: {day}")
print(f"Month: {month}")
print(f"Year: {year}")
print(f"Hour: {hour}")
print(f"Minute: {minute}")

print("Datetime")
print(type(indonesia_time))
print("ISO")
print(type(indonesia_time_iso))


def make_post_request(url: str, data: dict):
    headers = {
        "Content-Type": "application/json"
    }
    response = requests.post(url, headers=headers, json=data)
    return response

def search_venue(location: str, date: datetime, capacity: int):
    url = "http://127.0.0.1:8888/search/venue"
    data = {
        "location": location,
        "date": date,
        "capacity": capacity
    }

    return make_post_request(url, data)

def register_venue(name: str, description: str, location: str, capacity: int, open_day: str, open_time: str, close_time: str, interval: int):
    url = "http://127.0.0.1:8888/register/venue"
    data = {
        "name": name,
        "description": description,
        "location": location,
        "capacity": capacity,
        "open_day": open_day,
        "open_time": open_time,
        "close_time": close_time,   
        "interval": interval
    }
    return make_post_request(url, data)

if __name__ == "__main__":
    response = search_venue("Gelora", get_indonesia_time().isoformat(), 100)
    # response = register_venue(
    #     name="Lapangan Basket Outdoor 3", 
    #     description="Outdoor basketball field is an outdoor basketball field that located near TVRI tower and beside beach volleyball field. The size of this field is already using international standard which is 28 meters long and 15 meters wide.",
    #     location="Kota Kasablanka",
    #     capacity="100",
    #     open_day="Monday, Tuesday, Wednesday",
    #     open_time=get_indonesia_time().replace(hour=8, minute=0).isoformat(),
    #     close_time=get_indonesia_time().replace(hour=20, minute=0).isoformat(),
    #     interval="2"
    # )


    if response.status_code == 200:
        print("Request successful!")
        print(response.json())
    else:
        print("Request failed!")
        print(response.text)
