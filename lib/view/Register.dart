import 'package:fcis2023/controller/authcontroller.dart';
import 'package:fcis2023/view/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';


class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var firstnameController = TextEditingController();

  var lastnameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  bool _isobscure = true;

    final formkey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child:IconButton(onPressed: (){Get.to(()=>Login());}, icon: Icon(Icons.arrow_back)),
                    ),
                    Lottie.asset('assets/animation.json', height: 200, width: 200),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text("Create\nAccount",
                          style: Theme.of(context).textTheme.headline1),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: firstnameController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            labelText: 'First Name'),
                            validator: (value){
                        if(value!.isEmpty)
                        return 'Enter your first name';
                        else
                        return null;
                      },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: lastnameController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            labelText: 'Last Name'),
                            validator: (value){
                        if(value!.isEmpty)
                        return 'Enter your last name';
                        else
                        return null;
                      },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            labelText: 'Email'),
                            validator: (value){
                        if(value!.isEmpty)
                        return 'Enter your email';
                        else
                        return null;
                      },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _isobscure,
                        controller: passwordController,
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
                                    validator: (value){
                        if(value!.isEmpty)
                        return 'Enter your password';
                        else
                        return null;
                      },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Sign Up",
                            style: Theme.of(context).textTheme.headline1),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.teal,
                          child: IconButton(
                              onPressed: () {
                                if(formkey.currentState!.validate()){
                                 AuthController.instance.SignUp(
                                    firstnameController.text.trim(),
                                    lastnameController.text.trim(),
                                    emailController.text.trim(),
                                    passwordController.text.trim());
                              }
                                
                              },
                              icon: Icon(Icons.arrow_forward)),
                        )
                      ],
                    ),SizedBox(height: 30.0,)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
/*Center(
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
      ),*/