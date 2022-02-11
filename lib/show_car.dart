import 'package:flutter/material.dart';

class ShowCar extends StatefulWidget {
  const ShowCar({Key? key}) : super(key: key);

  @override
  _ShowCarState createState() => _ShowCarState();
}

class _ShowCarState extends State<ShowCar> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isShow = false;

  @override
  Widget build(BuildContext context) {
    double _screenH = MediaQuery.of(context).size.height;
    double _screenW = MediaQuery.of(context).size.width;

    final logoImage = Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/logo.png"),
          fit: BoxFit.contain,
          alignment: Alignment.centerLeft,
        ),
      ),
    );

    final cretaText = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '2022 CRETA',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            fontSize: 20,
          ),
        ),
        Container(
          width: 30,
          height: 30,
          color: Colors.grey,
          child: Icon(
            Icons.arrow_drop_down,
          ),
        ),
      ],
    );

    const spotText = Text(
      'Spotlight into the motion.',
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
        fontSize: 20,
      ),
    );

    final centerArea = Padding(
      padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          cretaText,
          spotText,
        ],
      ),
    );

    final topRightIcon = Container(
      width: 50,
      color: Color.fromARGB(255, 15, 15, 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
          Icon(
            Icons.people,
            color: Colors.white,
          ),
        ],
      ),
    );

    final firstRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        logoImage,
        centerArea,
        topRightIcon,
      ],
    );

    final leftIcons = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            color: Colors.black,
            child: Icon(
              Icons.access_alarm,
              color: Colors.white,
            ),
          ),
          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            color: Colors.black,
            child: Icon(
              Icons.motorcycle,
              color: Colors.white,
            ),
          ),
          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            color: Colors.black,
            child: Icon(
              Icons.car_rental,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );

    final secondRow = Row(
      children: [
        leftIcons,
      ],
    );

    final carCardImage = Container(
      width: 150,
      height: 75,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/car_1.webp"),
          fit: BoxFit.contain,
          alignment: Alignment.centerLeft,
        ),
      ),
    );

    final carCard = Container(
      child: Column(
        children: [
          Container(
            width: 200,
            color: Color.fromARGB(255, 219, 211, 211),
            child: Text(
              "Trim",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
                fontSize: 20,
              ),
            ),
          ),
          carCardImage,
          Text("CRETA Active 6-speed MT"),
          Text("From Rp.300.000.000"),
        ],
      ),
    );

    final quotationItem = Container(
      height: (_screenH * 0.25) / 2,
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(
          color: Colors.black,
        ),
      )),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              "Trim",
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              "CRETA Active 6-speed MT",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              "Rp.300.000.000",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );

    final quotation = Container(
      width: _screenW * 0.25,
      height: _screenH * 0.75 - (_screenH * 0.25) / 2,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: _screenW * 0.25,
            height: (_screenH * 0.25) / 2,
            color: Color.fromARGB(255, 11, 49, 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_up),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        if (_isShow == true) {
                          _isShow = false;
                        } else {
                          _isShow = true;
                        }
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Total",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Rp.300.000.000",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          quotationItem,
          quotationItem,
          quotationItem,
          quotationItem,
        ],
      ),
    );

    final quotationButton = Container(
      width: _screenW * 0.25,
      height: (_screenH * 0.25) / 2,
      color: Color.fromARGB(255, 11, 49, 80),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              minimumSize: const Size.fromHeight(50), // NEW
            ),
            child: const Text(
              'Quotation',
              style: TextStyle(
                color: Color.fromARGB(255, 4, 55, 97),
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
                fontSize: 20,
              ),
            ),
            onPressed: () {}),
      ),
    );

    final thirdRow = Row(
      children: [
        Container(
          width: _screenW * 0.75,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: carCard,
              ),
              Expanded(
                child: carCard,
              ),
              Expanded(
                child: carCard,
              ),
              Expanded(
                child: carCard,
              ),
              Expanded(
                child: carCard,
              ),
              Expanded(
                child: carCard,
              ),
            ],
          ),
        ),
      ],
    );

    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: _screenH * 0.75,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
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
                        child: firstRow,
                      ),
                      Expanded(
                        flex: 4,
                        child: secondRow,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: thirdRow,
              ),
            ],
          ),
          AnimatedPositioned(
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 200),
            left: _screenW * 0.75,
            top: (_isShow) ? _screenH * 0.25 : _screenH * 0.75,
            child: quotation,
          ),
          Positioned(
            left: _screenW * 0.75,
            top: _screenH * 0.75 + (_screenH * 0.25) / 2,
            child: quotationButton,
          ),
        ],
      ),
      endDrawer: Drawer(
        child: Container(),
      ),
    );
  }
}
