import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  //database for the login
  

  //find the username and password
  void _login() {

  }

  //go to register if he/she dont have acc
  void _register() {

  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 20
                ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
                decoration: InputDecoration(
              labelText: 'Username',
              hintText: 'Enter your username',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(17))),
            )),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(17))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: null, child: Text('Login')),
            //SizedBox(height: 15,),
            TextButton(
              onPressed: null, 
              child: Text('Register if you new here', style: TextStyle(color: Colors.blue),))
          ],
        ),
      ),
    );
  }
}