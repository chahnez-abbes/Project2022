class  Course {
  String id;
  String title;
  String description;
  String image;
  String last_update;
  String instructor;
  String language;
  num price;
  List goals;
  List requirements;

  Course({
     this.id,
     this.title,
     this.description,
     this.image,
     this.last_update,
     this.instructor,
     this.language,
     this.price,
     this.goals,
     this.requirements
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        image: json['image'],
        last_update: json['last_update'],
        instructor: json['instructor'],
        language: json['language'],
        price: json['price'],
        goals: json['goals'],
        requirements: json['requirements']
    );
  }
}