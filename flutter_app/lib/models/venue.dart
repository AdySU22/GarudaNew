class Venue {
  final int id; // Venue's unique identifier.
  final String name; // Venue's name.
  final String description; // Venue's description.
  final String location; // Venue's location.
  final int capacity; // Venue's capacity.
  final String openDay; // Day when the venue is open.
  final String openTime; // Opening time of the venue.
  final String closeTime; // Closing time of the venue.
  final int period; // Period for which the venue is available.

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

  // Factory method to create a Venue instance from JSON
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

  // Method to convert a Venue instance to JSON
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
