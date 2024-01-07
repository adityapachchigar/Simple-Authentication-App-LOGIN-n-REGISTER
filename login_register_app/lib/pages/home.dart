import 'package:flutter/material.dart';
import 'package:login_register_app/pages/login.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              child: Text("Sign Out"),
              onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => const LoginPage()));
              },
            ),
          )
        ],
      ),
    );
  }
}