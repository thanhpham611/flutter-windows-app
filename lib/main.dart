import 'package:flutter/material.dart';

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
  bool isSwitched = false;
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
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
          fontSize: 30,
        ),
      ),
    );

    var switchButton = Padding(
      padding: EdgeInsets.fromLTRB(0, 40, 80, 0),
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
      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 8),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Dealer ID',
        ),
      ),
    );

    var dealerPassInput = Padding(
      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 8),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Dealer Password',
        ),
      ),
    );

    var userIdInput = Padding(
      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 8),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'User ID (id@email.com)',
        ),
      ),
    );

    var userPassInput = Padding(
      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 8),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'User Password',
        ),
      ),
    );

    var loginButton = Container(
        padding: const EdgeInsets.only(left: 150.0, top: 40.0),
        child: new ElevatedButton(
          child: const Text('Login'),
          onPressed: null,
        ));

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
          welcomeText,
          loginButton
        ],
      ),
    );

    return MaterialApp(
      title: "My app",
      home: Scaffold(
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
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          color: Color.fromARGB(255, 243, 237, 237),
                          child: leftColumn,
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          color: Color.fromARGB(255, 255, 252, 252),
                          child: rightColumn,
                        ),
                      ),
                    ],
                  ),
                ),

                // Row(
                //   // crossAxisAlignment: CrossAxisAlignment.start,
                //   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     Expanded(
                //       flex: 5,
                //       child: Container(
                //         color: Color.fromARGB(255, 243, 237, 237),
                //         child: leftColumn,
                //       ),
                //     ),
                //     Expanded(
                //       flex: 5,
                //       child: Container(
                //         color: Color.fromARGB(255, 255, 252, 252),
                //         child: rightColumn,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            )),
      ),
    );
  }
}
