class Trainer {
  final int coachId;
  final String nameDisplay;
  final String description;
  final String info;
  final String info2;
  final int rating;
  final int price;
  final int totalRating;
  final String follow;

  const Trainer({
    required this.coachId,
    required this.nameDisplay,
    required this.description,
    required this.info,
    required this.info2,
    required this.rating,
    required this.price,
    required this.totalRating,
    required this.follow,
  });

  // static Trainer fromJson(json) => Trainer(
  //       id: json['id'],
  //       name: json['name'],
  //       age: json['age'],
  //     );

  factory Trainer.fromJson(Map<String, dynamic> json) {
    return Trainer(
      coachId: json['coachId'] as int,
      nameDisplay: json['nameDisplay'] as String,
      description: json['description'] as String,
      info: json['info'] as String,
      info2: json['info2'] as String,
      rating: json['rating'] as int,
      price: json['price'] as int,
      totalRating: json['totalRating'] as int,
      follow: json['follow'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'coachId': coachId,
      'nameDisplay': nameDisplay,
      'description': description,
      'info': info,
      'info2': info2,
      'rating': rating,
      'price': price,
      'totalRating': totalRating,
      'follow': follow,
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
