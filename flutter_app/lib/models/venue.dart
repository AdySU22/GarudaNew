class Venue {
  final int id;
  final String name;
  final String description;
  final String location;
  final int capacity;
  final String openDay;
  final String openTime;
  final String closeTime;
  final int period;

  Venue({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.capacity,
    required this.openDay,
    required this.openTime,
    required this.closeTime,
    required this.period,
  });

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      location: json['location'] as String,
      capacity: json['capacity'] as int,
      openDay: json['open_day'] as String,
      openTime: json['open_time'] as String,
      closeTime: json['close_time'] as String,
      period: json['period'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'location': location,
      'capacity': capacity,
      'open_day': openDay,
      'open_time': openTime,
      'close_time': closeTime,
      'period': period,
    };
  }
}
