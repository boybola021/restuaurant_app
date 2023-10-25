class UserSRC{

  int id;
  String name;
  String email;
  String password;

  UserSRC({
   required this.id,
   required this.name,
   required this.email,
   required this.password,
});

  factory UserSRC.fromJson(Map<String,Object?> json){
    return UserSRC(
        id: json["id"] as int,
        name: json["name"] as String,
        email: json["email"] as String,
        password: json["password"] as String,
    );
  }

  Map<String,Object?> toJson() => {
    "id" : id,
    "name" : name,
    "email" : email,
    "password" : password,
  };

   @override
  bool operator == (Object other){
     return (other is UserSRC) && other.id == id && other.name == name &&
         other.email == email && other.password == password;
   }
  @override
  int get hashCode => Object.hash(id,name,email,password);
}