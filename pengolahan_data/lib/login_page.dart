import 'package:flutter/material.dart';

import 'home_page.dart';

// class LoginPage extends StatelessWidget {
//   LoginPage({Key? key}) : super(key: key);
//
//   String username = "";
//   String password = "";
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//             title: Text("Login Page"),
//         ),
//         body: Column(
//             children: [
//               _usernameField(),
//               _passwordField(),
//               _loginButton(context),
//             ]
//         ),
//       ),
//     );
//   }
//
//   Widget _usernameField() {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: TextFormField(
//         enabled: true,
//         onChanged: (value){
//           username = value;
//         },
//         decoration: const InputDecoration(
//           hintText: 'Username',
//           contentPadding: const EdgeInsets.all(8.0),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(8.0)),
//             borderSide: BorderSide(color: Colors.blue),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _passwordField() {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: TextFormField(
//         enabled: true,
//         onChanged: (value){
//           password = value;
//         },
//         obscureText: true,
//         decoration: const InputDecoration(
//           hintText: 'Password',
//           contentPadding: const EdgeInsets.all(8.0),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(8.0)),
//             borderSide: BorderSide(color: Colors.blue),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _loginButton(BuildContext context) {
//     return Container(
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         width: MediaQuery.of(context).size.width,
//         child: ElevatedButton(
//           onPressed: () {
//             String text = "";
//             if (username == "flutterMobile" && password == "flutter123"){
//               text = "Login Success";
//             } else {
//               text = "Login Failed";
//             }
//             SnackBar snackBar = SnackBar(
//               content: Text(text),
//             );
//             ScaffoldMessenger.of(context).showSnackBar(snackBar);
//           },
//           child: const Text('Login'),
//         ),
//     );
//   }
// }

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLoginSuccess = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
        ),
        body: Column(
            children: [
              _usernameField(),
              _passwordField(),
              _loginButton(context),
            ]
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value){
          username = value;
        },
        decoration: InputDecoration(
          hintText: 'Username',
          contentPadding: EdgeInsets.all(8.0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: (isLoginSuccess) ? Colors.blue : Colors.green),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: (isLoginSuccess) ? Colors.blue : Colors.red),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value){
          password = value;
        },
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.all(8.0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: (isLoginSuccess) ? Colors.blue : Colors.green),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: (isLoginSuccess) ? Colors.blue : Colors.red),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: (isLoginSuccess) ? Colors.blue : Colors.red
        ),
        onPressed: () {
          String text = "";
          if (password == "flutter123"){
            setState(() {
              text = "Login Success";
              isLoginSuccess = true;
            });
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return HomePage(username: username);
            }));
          } else {
            setState(() {
              text = "Login Failed";
              isLoginSuccess = false;
            });
          }
          SnackBar snackBar = SnackBar(
            content: Text(text),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Login'),
      ),
    );
  }
}
