import 'dart:math';

import 'package:flutter/material.dart';
import 'package:login_register_app/pages/login.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = FlutterSecureStorage();

int getRandomNumberInRange() {
  final Random random = Random();
  return random.nextInt(900000000) + 100000000;
}

void register(String username, String password) async {
  // Store the user's credentials securely
  // await storage.write(key: 'username', value: username);
  // await storage.write(key: 'password', value: password);

  // Generate a "token" for the user (in this case, a random number)
  String token = getRandomNumberInRange().toString();

  String store = password+"_"+token;

  // Store the token
  await storage.write(key: username, value: store);
}



class RegPage extends StatelessWidget {
  const RegPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController uc = TextEditingController();
    TextEditingController pc = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
                controller: uc,
                decoration: InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                  
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: pc,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  
                ),
              ),
              SizedBox(height: 40,),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white
                  ),
                  onPressed: (){
                    register(uc.text, pc.text);
                    Navigator.push(context,MaterialPageRoute(builder: (context) => const LoginPage()));
                    show("Account Created");
                  },
                  child: Text("Register"),
                )
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account ?"),
                  TextButton(onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => const LoginPage()));
                  }, child: Text("Sign In",style: TextStyle(color: Colors.blueAccent),))
                ],
              )
          ],
        ),
      ),
    );
  }
}