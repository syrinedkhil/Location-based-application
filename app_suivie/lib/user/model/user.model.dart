class User_app{
  String Id;
  String FullName;
  String email;
  String PassWord;
    bool isLoggedIn;
    String role;
  User_app({
    this.Id="",
     required this.FullName,
     required this.email,
     required this.PassWord,
     this.isLoggedIn=false,
     required this.role
     });
  
Map<String,dynamic> toJson(){
  return{
    'Id':Id,
    'FullName':FullName,
    'email':email,
    'Password':PassWord,
    'isLoggedIn':isLoggedIn,
    'role':role
  };

}

factory User_app.fromJson(Map<String,dynamic>json){
  return User_app(Id:json['Id'],FullName: json['FullName'],email: json['email'],PassWord: json['Password'],isLoggedIn:json['isLoggedIn'],role: json['role']);
}


}