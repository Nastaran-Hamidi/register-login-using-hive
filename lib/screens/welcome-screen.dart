import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newproject/helpers/input.dart';
import 'package:newproject/helpers/validate.dart';
import 'package:newproject/controllers/signup_signin.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  var isLogin=false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(()=> Column(
                children: [
                  const SizedBox(height: 25),
                  const Text('Welcome',
                    style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25)),
                  const SizedBox(height: 15),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                            color: isLogin.value?Colors.white:Colors.yellow,
                            onPressed: (){
                              isLogin.value=false;
                            },
                            child: const Text('Register')
                        ),
                        MaterialButton(
                            color: isLogin.value?Colors.yellow:Colors.white,
                            onPressed: (){
                              isLogin.value=true;
                            },
                            child: const Text('Login')
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 400,
                    child: isLogin.value?login():register(),
                  )
                ],
              ),
            ))
          ),
    );
  }
}

Widget register(){

  final SignUpController signupIn = Get.put(SignUpController());

  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Column(
        children: [
          TextInput(
              maxLength: nameLength,
              hintText: 'name',
              controller: signupIn.name),
          const SizedBox(height: 25),
          TextInput(
              maxLength: emailLength,
              hintText: 'email',
              controller: signupIn.registerEmail),
          const SizedBox(height: 15),
          TextInput(
              maxLength: passwordLength,
              hintText: 'password',
              controller: signupIn.registerPassword),
          const SizedBox(height: 30),
          MaterialButton(
              color: Colors.blueAccent,
              child: const Text('Register'),
              onPressed: (){
                signupIn.callRegister();
                signupIn.registerEmail.clear();
                signupIn.name.clear();
                signupIn.registerPassword.clear();
              }
          )
        ],
      ),
  );
}

Widget login(){
  final SignUpController signupIn = Get.put(SignUpController());
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
    child: Column(
      children: [
        TextInput(
            maxLength: emailLength,
            hintText: 'email',
            controller: signupIn.loginEmail),
        const SizedBox(height: 15),
        TextInput(
            maxLength: passwordLength,
            hintText: 'password',
            controller: signupIn.loginPassword),
        const SizedBox(height: 30),
        MaterialButton(
            color: Colors.blueAccent,
            child: const Text('Login'),
            onPressed: (){
              signupIn.callLogin();
              signupIn.loginEmail.clear();
              signupIn.loginPassword.clear();
            }
        )
      ],
    ),
  );
}