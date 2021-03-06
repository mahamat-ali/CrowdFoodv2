import 'package:crowd_food/screens/signin_screen.dart';
import 'package:crowd_food/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  static final String id = 'WelcomeScreen';

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black, BlendMode.dstATop),
              fit: BoxFit.cover,
              image: AssetImage("assets/images/home_screen.jpg"),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: deviceHeight * 0.11,
                  ),
                  child: Text(
                    'Crowd Food',
                    style: TextStyle(
                      fontFamily: 'ViaodaLibre',
                      fontSize: deviceWidth * 0.2,
                      color: Color(0xffffe2ff),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: double.infinity,
                  child: FlatButton(
                    color: Colors.black.withAlpha(190),
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                        fontFamily: 'BellotaText',
                        fontSize: 30,
                        color: Color(0xffffe2ff),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, SignInScreen.id);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 2,
                child: Container(
                  color: Color(0xfffffdf9),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: double.infinity,
                  child: FlatButton(
                    color: Color(0xffe6739f).withAlpha(200),
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        fontFamily: 'BellotaText',
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, SignUpScreen.id);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
