class UserModel {
  final int id;
  final String username;
  final String firstname;
  final String lastname;
  final String about;
  final String email;
  final String remarks;
  final String avatar;
  final String title;

  const UserModel(
      {required this.id,
      required this.username,
      required this.firstname,
      required this.lastname,
      required this.email,
      required this.about,
      required this.remarks,
      required this.avatar,
      required this.title});

  UserModel copyWith(
          {int? id,
          String? username,
          String? firstname,
          String? lastname,
          String? email,
          String? about,
          String? remarks,
          String? avatar,
          String? title}) =>
      UserModel(
          id: id ?? this.id,
          username: username ?? this.username,
          firstname: firstname ?? this.firstname,
          lastname: lastname ?? this.lastname,
          email: email ?? this.email,
          about: about ?? this.about,
          remarks: remarks ?? this.remarks,
          avatar: avatar ?? this.avatar,
          title: title ?? this.title);
}
