class AppStrings {
 static  RegExp  emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  static RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9._]{3,20}$');
  static RegExp phoneRegex = RegExp(r'^(?:\+20|0)?1[0-9]{9}$');
 static RegExp passwordRegex =
 RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

}
