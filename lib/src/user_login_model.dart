class User{

  int id;
  String name;
  String email;
  String password;

  User({
   required this.id,
   required this.name,
   required this.email,
   required this.password,
});

  factory User.fromJson(Map<String,Object?> json){
    return User(
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
     return (other is User) && other.id == id && other.name == name &&
         other.email == email && other.password == password;
   }
  @override
  int get hashCode => Object.hash(id,name,email,password);
}