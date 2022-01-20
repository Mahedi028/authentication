import 'package:flutter/material.dart';
import 'package:myapp/screens/home_page.dart';
import 'package:myapp/screens/login_screen.dart';
import 'package:myapp/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          // margin: EdgeInsets.all(10.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                TextField(
                    obscureText: true,
                    onChanged: (value) => {},
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confrim password',
                      hintText: 'Enter Password',
                    )),
                SizedBox(
                  height: 5.0,
                ),
                loading
                    ? CircularProgressIndicator()
                    : Container(
                        // padding: EdgeInsets.all(10.0),
                        height: 45,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          child: Text(
                            'Submit',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () async {
                            setState(() {
                              loading = true;
                            });
                            if ((emailController.text == "") ||
                                (passwordController.text == "")) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('All fiels are required'),
                                backgroundColor: Colors.red,
                              ));
                            } else if ((passwordController.text) !=
                                (confirmPasswordController.text)) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Password donot match'),
                                backgroundColor: Colors.red,
                              ));
                            } else {
                              User? result = await AuthService().register(
                                  emailController.text,
                                  passwordController.text,
                                  context);
                              if (result != null) {
                                print('Success');
                                // print(result.email);
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
                SizedBox(
                  height: 5,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      'Aready have an account? login here',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
              ]),
        ),
      ),
    );
  }
}
