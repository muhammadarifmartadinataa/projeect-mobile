class User {
  String? idUser;
  String? name;
  String? userName;
  String? pass;
  String? role;

  User({
    this.idUser,
    this.name,
    this.userName,
    this.pass,
    this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    idUser: json['id_user'],
    name: json['name'],
    userName: json['username'],
    pass: json['pass'],
    role: json['role'],
  );

  Map<String, dynamic> toJson() => {
    'id_user': idUser,
    'name': name,
    'username': userName,
    'pass': pass,
    'role': role,
  };
}