class SubredditModel {
  final String name;
  final String image;

  const SubredditModel({required this.name, required this.image});

  SubredditModel copyWith(String? name, String? image) =>
      SubredditModel(name: name ?? this.name, image: image ?? this.image);
}
