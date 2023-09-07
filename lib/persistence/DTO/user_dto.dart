class UserDTO {
  final int id;
  final String username;
  final String firstname;
  final String lastname;
  final String about;
  final String email;
  final String remarks;
  final String avatar;
  final String title;

  UserDTO(
      {required this.id,
      required this.username,
      required this.firstname,
      required this.lastname,
      required this.email,
      required this.about,
      required this.remarks,
      required this.avatar,
      required this.title});
}
