import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  bool isSwitched = false;
  bool? isChecked = false;

  final _delearID = TextEditingController();
  final _delearPass = TextEditingController();
  final _userID = TextEditingController();
  final _userPass = TextEditingController();

  late AuthData _res;

  @override
  Widget build(BuildContext context) {
    final logoImage = Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/logo.png"),
          fit: BoxFit.contain,
          alignment: Alignment.centerLeft,
        ),
      ),
    );

    var descText = Center(
        child: Container(
            padding: EdgeInsets.fromLTRB(150, 0, 150, 0),
            child: Text(
              'A visionary design inspired by nature,'
              'art and human passion in the most'
              'creative and appealing form.',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Georgia',
                fontSize: 20,
              ),
            )));

    final mainImage = Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.jpg"),
          fit: BoxFit.fill,
        ),
      ),
    );

    const welcomeText = Padding(
      padding: EdgeInsets.fromLTRB(0, 50, 20, 0),
      child: Text(
        'Welcome Back!',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
          fontSize: 20,
        ),
      ),
    );

    const sscText = Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
      child: Text(
        'Smart Sales Care',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
          fontSize: 30,
        ),
      ),
    );

    var switchButton = Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 80, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Offline",
          ),
          Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              }),
          Text("Online")
        ],
      ),
    );

    var dealerIdInput = Padding(
      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 4),
      child: TextFormField(
        controller: _delearID,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter Dealer ID';
          }
          return null;
        },
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(),
          hintText: 'Dealer ID *',
        ),
      ),
    );

    var dealerPassInput = Padding(
      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 4),
      child: TextFormField(
        controller: _delearPass,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter Dealer Password';
          }
          return null;
        },
        obscureText: true,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(),
          hintText: 'Dealer Password *',
        ),
      ),
    );

    var userIdInput = Padding(
      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 4),
      child: TextFormField(
        controller: _userID,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter User ID';
          }
          return null;
        },
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(),
          hintText: 'User ID (id@email.com) *',
        ),
      ),
    );

    var userPassInput = Padding(
      padding: const EdgeInsets.fromLTRB(80, 4, 80, 0),
      child: TextFormField(
        controller: _userPass,
        obscureText: true,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(),
          hintText: 'User Password',
        ),
      ),
    );

    // var checkKeep = Center(
    //   child: Container(
    //     width: 14,
    //     height: 14,
    //     decoration: BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
    //     alignment: Alignment.center,
    //     child: Checkbox(
    //       checkColor: Colors.white,
    //       // fillColor: MaterialStateProperty.resolveWith(getColor),
    //       value: isChecked,
    //       shape: CircleBorder(),
    //       onChanged: (bool? value) {
    //         setState(() {
    //           isChecked = value!;
    //         });
    //       },
    //     ),
    //   ),
    // );

    var checkListTile = Padding(
      padding: EdgeInsets.symmetric(horizontal: 58, vertical: 0),
      child: CheckboxListTile(
        title: Text(
          'Keep me logged in',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            fontSize: 18,
          ),
        ),
        value: isChecked,
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;
          });
        },
      ),
    );

    var loginButton = Padding(
      padding: const EdgeInsets.fromLTRB(80, 4, 80, 100),
      child: new ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(255, 11, 82, 139),
          minimumSize: const Size.fromHeight(50), // NEW
        ),
        child: const Text('Login'),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            Map data = {
              "tenancyName": _delearID.text,
              "password": _delearPass.text,
              "usernameOrEmailAddress": _userID.text,
              "dmsPassword": _userPass.text,
            };
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Processing ....')),
            );
            _res = await postRequest(data);
            if (_res != null && _res.accessToken != "") {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text("Login Success"),
                  );
                },
              );
            } else {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text("Login Faiil"),
                  );
                },
              );
            }
          }
        },
      ),
    );

    final leftColumn = Container(
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: descText,
          ),
          Expanded(
            flex: 5,
            child: mainImage,
          ),
        ],
      ),
    );

    final rightColumn = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          welcomeText,
          sscText,
          switchButton,
          dealerIdInput,
          dealerPassInput,
          userIdInput,
          userPassInput,
          checkListTile,
          loginButton
        ],
      ),
    );

    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
            padding: const EdgeInsets.fromLTRB(100, 20, 100, 20),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: logoImage,
                ),
                Expanded(
                  flex: 9,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          color: Color.fromARGB(255, 232, 232, 232),
                          child: leftColumn,
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          color: Color.fromARGB(255, 243, 243, 243),
                          child: rightColumn,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

Future<AuthData> postRequest(data) async {
  var url = 'https://ssc-apitest2-hmid.hyundaisvc.com/api/AuthenticateV2';

  //encode Map to JSON
  var body = json.encode(data);

  var response = await http.post(Uri.parse(url),
      headers: {"Content-Type": "application/json"}, body: body);

  print("${response.statusCode}");
  print("${response.body}");
  if (response.statusCode == 200) {
    return AuthData.fromJson(jsonDecode(response.body));
  } else {
    return AuthData(accessToken: "");
  }
}

class AuthData {
  final String accessToken;
  final bool? shouldChangePasswordOnNextLogin;
  final String? passwordResetCode;
  final String? tenancyName;
  AuthData({
    required this.accessToken,
    this.shouldChangePasswordOnNextLogin,
    this.passwordResetCode,
    this.tenancyName,
  });

  factory AuthData.fromJson(Map<String, dynamic> json) {
    return AuthData(
      accessToken: json['result']['accessToken'],
      shouldChangePasswordOnNextLogin: json['result']
          ['shouldChangePasswordOnNextLogin'],
      passwordResetCode: json['result']['passwordResetCode'],
      tenancyName: json['result']['tenancyName'],
    );
  }
}
