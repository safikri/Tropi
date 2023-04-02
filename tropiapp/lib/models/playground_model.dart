class Playground {
  final int playgroundId;
  final String name;
  final String description;
  final String latitude;
  final String longitude;
  final int rating;
  final String address;
  final String imageLocation;

  const Playground({
    required this.playgroundId,
    required this.name,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.rating,
    required this.address,
    required this.imageLocation,
  });

  factory Playground.fromJson(Map<String, dynamic> json) {
    return Playground(
      playgroundId: json['playgroundId'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      rating: json['rating'] as int,
      address: json['address'] as String,
      imageLocation: json['imageLocation'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'playgroundId': playgroundId,
      'name': name,
      'description': description,
      'latitude': latitude,
      'longitude': longitude,
      'rating': rating,
      'address': address,
      'imageLocation': imageLocation,
    };
  }

  dynamic get(String propertyName) {
    var _mapRep = toMap();
    if (_mapRep.containsKey(propertyName)) {
      return _mapRep[propertyName];
    }
    throw ArgumentError('propery not found');
  }
}
