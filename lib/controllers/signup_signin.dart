import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newproject/helpers/toasts.dart';
import 'package:newproject/helpers/validate.dart';
import 'package:newproject/controllers/Apis.dart';
import 'package:newproject/database/user.dart';

class SignUpController extends GetxController {

  TextEditingController name = TextEditingController();
  TextEditingController registerEmail = TextEditingController();
  TextEditingController registerPassword = TextEditingController();

  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPassword = TextEditingController();

  callRegister() async {
    if(name.text.isEmpty){
      Toast.error('check name field');
    }
    else if(validateEmail(registerEmail.text)==false || registerEmail.text.isEmpty){
      Toast.error('check email field');
    }
    else if(registerPassword.text.isEmpty){
      Toast.error('check password field');
    }
    else{
      var data = {
        "name": name.text,
        "password": registerPassword.text,
        "email": registerEmail.text
      };
      final res = await Sign().register(data);
      if (res.statusCode == 200) {
        print(res.data);
        if (res.data['code'] == 1) {
          Toast.error(res.data['message']);
        }
        if (res.data['code'] == 0) {
          Toast.success(res.data['message']);
          bool userAdded = await addUser(User(
            email: registerEmail.text,
            password: registerPassword.text
          ));
          if (userAdded) {
            print("yes added");
          }
        }
      }
    }
  }

  callLogin() async{
    if(validateEmail(loginEmail.text)==false || loginEmail.text.isEmpty){
      Toast.error('check email field');
    }
    else if(loginPassword.text.isEmpty){
      Toast.error('check password field');
    }
    else{
      var data={
        "email":loginEmail.text,
        "password":loginPassword.text
      };

      final res= await Login().login(data);
      if(res.statusCode==200){
        print(res.data);
        if(res.data['code']==1){
          Toast.error(res.data['message']);
        }
        if(res.data['code']==0){
          Toast.success(res.data['message']);
          Get.toNamed('/firstscreen');
        }
      }
    }
  }
}

