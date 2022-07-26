import 'package:fcis2023/controller/authcontroller.dart';
import 'package:fcis2023/view/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Resetpassword extends StatelessWidget {
   Resetpassword({Key? key}) : super(key: key);
final formkey=GlobalKey<FormState>();
  var emailController = TextEditingController();
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child:IconButton(onPressed: (){Get.to(()=>Login());}, icon: Icon(Icons.arrow_back)),
                      ),
                    Lottie.asset('assets/animation.json', height: 200, width: 200),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text("Forgot\nPassword",
                          style: Theme.of(context).textTheme.headline1),
                    ),
                    SizedBox(height: 25.0,),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text("To reset your password, you need to enter your registered email address we will send form to your email",
                          style: Theme.of(context).textTheme.bodyText1),
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
                    
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(flex:2,child: Text("Send Request", style: Theme.of(context).textTheme.headline1)),
                        Expanded(
                          flex: 1,
                          child: CircleAvatar(
                            radius: 30,
                            
                            backgroundColor: Colors.teal,
                            child: IconButton(
                                onPressed: () {
                                  if(formkey.currentState!.validate()){
                                     AuthController.instance.forgotpassword(emailController.text.trim(), context);
                                            
                                  }
                                 
                                },
                                icon: Icon(Icons.arrow_forward)),
                          ),
                        )
                      ],
                    ),
                    
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