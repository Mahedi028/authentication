import 'package:flutter/material.dart';
import 'package:myapp/screens/home_page.dart';
import 'package:myapp/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                  onChanged: (value) => {},
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter email',
                  )),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                  obscureText: true,
                  onChanged: (value) => {},
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'password',
                    hintText: 'Enter Password',
                  )),
              SizedBox(
                height: 10.0,
              ),
              loading
                  ? CircularProgressIndicator()
                  : Container(
                      // padding: EdgeInsets.all(10.0),
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          setState(() {
                            loading = true;
                          });

                          if ((emailController.text == "") ||
                              (passwordController.text == "")) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('All fiels are required'),
                              backgroundColor: Colors.red,
                            ));
                          } else {
                            User? result = await AuthService().login(
                                emailController.text,
                                passwordController.text,
                                context);
                            if (result != null) {
                              // print('Success');
                              // print(result.email);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => HomePage()));
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                  (route) => false);
                            }
                          }
                          setState(() {
                            loading = false;
                          });
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
