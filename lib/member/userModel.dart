class User{
  final String email;
   String password;
  String firstName;
  String lastName;
 String gender;
  String weight;
 String height;
 String bmi;

 User({
  required  this.email,
  required this.password,
  required this.firstName,
  required this.lastName,
  required this.gender,
 required  this.weight,
  required this.height,
  required this.bmi});


toJson(){
 return {
  "email":email,
  "password":password,
  "firstName":firstName,
  "lastName":lastName,
  "gender":gender,
  "weight":weight,
  "height":height,
  "bmi":bmi

 };
}


}

