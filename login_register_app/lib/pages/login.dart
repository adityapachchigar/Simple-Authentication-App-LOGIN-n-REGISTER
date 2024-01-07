import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_register_app/pages/home.dart';
import 'package:login_register_app/pages/reg.dart';

String tokenValue='';

void show(String text)=>Fluttertoast.showToast(msg: text,timeInSecForIosWeb:3);


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController uc = TextEditingController();
    TextEditingController pc = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
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
                onPressed: () async {
                  // print(uc.text);
                  // print(pc.text);
                  

                  String? storedValue = await storage.read(key: uc.text);
                  if(storedValue != null){
                    List<String> l = storedValue.split("_");
                    // print(l);
                    if (l.first == pc.text) {
                      // print("1st");
                      String? token = l.last;
                      // print(tokenValue);
                      tokenValue = token;
                      // print(tokenValue);
                    } else {
                      // print("2nd");
                      tokenValue = "Invalid Password";
                      show("Invalid Password");
                    }
                  }else{
                    // print("3rd");
                    tokenValue = "No account found. Sign up now to get started!";
                    show("No account found. Sign up now to get started!");
                  }


                  // print(tokenValue);
                  if(tokenValue.length == 9){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => const HomePage()));
                    show("Logged in");
                    // print("${tokenValue}");
                  }else{
                    // print("${tokenValue}");
                  }
                },
                child: Text("Login"),
              )
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account ?"),
                TextButton(onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => const RegPage()));
                }, child: Text("Sign Up",style: TextStyle(color: Colors.blueAccent),))
              ],
            )
          ],
        ),
      )
    );
  }
}