bool validateEmail(String email) {
  RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  return emailValid.hasMatch(email);
}


int nameLength=50;
int emailLength=50;
int passwordLength=12;