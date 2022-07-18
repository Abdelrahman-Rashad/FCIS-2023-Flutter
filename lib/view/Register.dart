import 'package:fcis2023/controller/authcontroller.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var firstnameController=TextEditingController();
    var lastnameController=TextEditingController();
    var emailController=TextEditingController();
    var passwordController=TextEditingController();

    return Scaffold(
      appBar: AppBar(title:Text("Login"),centerTitle: true,),
      body: Center(
        child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: firstnameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'enter your First name'
                  ),
                ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: lastnameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'enter your last name'
                  ),
                ),
            ),
            Padding(
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
              AuthController.instance.SignUp(firstnameController.text.trim(),lastnameController.text.trim(),emailController.text.trim(), passwordController.text.trim());
            }, child: Text("Register"))
          ],
        ),
      ),
    );
  }
}