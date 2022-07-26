import 'package:fcis2023/controller/authcontroller.dart';
import 'package:fcis2023/view/Register.dart';
import 'package:fcis2023/view/forgotpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formkey=GlobalKey<FormState>();
  var emailController = TextEditingController();
    var passwordController = TextEditingController();
    bool _isobscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('assets/animation.json', height: 200, width: 200),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("Welcome\nBack",
                        style: Theme.of(context).textTheme.headline1),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: emailController,
                      validator: (value){
                        if(value!.isEmpty)
                        return 'Enter your email';
                        else
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          labelText: 'Email'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _isobscure,
                      controller: passwordController,
                      validator: (value){
                        if(value!.isEmpty)
                        return 'Enter your password';
                        else
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          labelText: 'Password',
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isobscure = !_isobscure;
                                });
                              },
                              icon: Icon(_isobscure
                                  ? Icons.visibility
                                  : Icons.visibility_off))),
                    ),
                  ),
                  
                  Align(alignment: Alignment.centerRight,child: TextButton(onPressed: (){Get.to(()=>Resetpassword());}, child: Text("Forgot Password",style: Theme.of(context).textTheme.headline4))),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Login", style: Theme.of(context).textTheme.headline1),
                      CircleAvatar(
                        radius: 30,
                        
                        backgroundColor: Colors.teal,
                        child: IconButton(
                            onPressed: () {
                              if(formkey.currentState!.validate()){
                                 AuthController.instance.login(
                                  emailController.text.trim(),
                                  passwordController.text.trim());
                              }
                             
                            },
                            icon: Icon(Icons.arrow_forward)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(() => Register());
                      },
                      child: Text("Create a new account",
                          style: Theme.of(context).textTheme.headline4))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
/*Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'enter your email'
                  ),
                ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'enter your password'
                  ),
                ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){
              AuthController.instance.login(emailController.text.trim(), passwordController.text.trim());
            }, child: Text("Login")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){
              Get.to(()=>Register());
            }, child: Text("Create a new account")),*/