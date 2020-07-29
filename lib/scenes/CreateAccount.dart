import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../theme/light.dart';

class CreateAccount extends StatefulWidget {
  @override
  CreateAccountState createState() => CreateAccountState();
}

class CreateAccountState extends State<CreateAccount> {
  int selectedIndex = 0;
  bool appleSignInAvailable = false;

  @override
  void initState() {
    super.initState();
    AppleSignIn.isAvailable().then((value) => {
      setState(() {
        print(value);
        appleSignInAvailable = value;
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 812);
    Widget appleGap, appleButton;
    if (appleSignInAvailable) {
      appleGap = SizedBox(
        height: ScreenUtil().setHeight(16),
      );
      appleButton = Container(
        width: ScreenUtil().setWidth(254),
        height: ScreenUtil().setHeight(64),
        child: RaisedButton(
          onPressed: onAppleSignUp,
          color: LightTheme.secondary,
          textColor: LightTheme.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12))
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(FontAwesomeIcons.apple, size: ScreenUtil().setSp(18)),
              SizedBox(
                width: ScreenUtil().setWidth(8),
              ),
              Text('Join with Apple', style: TextStyle(
                fontSize: ScreenUtil().setSp(18),
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              )),
            ],
          ),
        ),
      );
    } else {
      appleGap = Container();
      appleButton = Container();
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: LightTheme.title,
        ),
        brightness: useWhiteForeground(LightTheme.container) ? Brightness.dark : Brightness.light,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(
            left: ScreenUtil().setWidth(60),
            right: ScreenUtil().setWidth(61),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: ScreenUtil().setHeight(8),
              ),
              Text('Create an account', style: TextStyle(
                color: LightTheme.title,
                fontSize: ScreenUtil().setSp(24),
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              )),
              SizedBox(
                height: ScreenUtil().setHeight(16),
              ),
              Text('Please select how do you want to use the app', style: TextStyle(
                color: LightTheme.label,
                fontSize: ScreenUtil().setSp(14),
                fontFamily: 'Roboto',
                fontWeight: FontWeight.normal,
              )),
              SizedBox(
                height: ScreenUtil().setHeight(48),
              ),
              buildArtistOption(),
              SizedBox(
                height: ScreenUtil().setHeight(16),
              ),
              buildClientOption(),
              Spacer(),
              SizedBox(
                width: double.infinity,
                height: ScreenUtil().setHeight(64),
                child: RaisedButton(
                  onPressed: onFacebookSignUp,
                  color: LightTheme.secondary,
                  textColor: LightTheme.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12))
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.facebookF, size: ScreenUtil().setSp(18)),
                      SizedBox(
                        width: ScreenUtil().setWidth(8),
                      ),
                      Text('Join with Facebook', style: TextStyle(
                        fontSize: ScreenUtil().setSp(18),
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(16),
              ),
              Container(
                width: ScreenUtil().setWidth(254),
                height: ScreenUtil().setHeight(64),
                child: RaisedButton(
                  onPressed: onGoogleSignUp,
                  color: LightTheme.secondary,
                  textColor: LightTheme.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12))
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.google, size: ScreenUtil().setSp(18)),
                      SizedBox(
                        width: ScreenUtil().setWidth(8),
                      ),
                      Text('Join with Google', style: TextStyle(
                        fontSize: ScreenUtil().setSp(18),
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      )),
                    ],
                  ),
                ),
              ),
              appleGap,
              appleButton,
              SizedBox(
                height: ScreenUtil().setHeight(16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildArtistOption() {
    return RaisedButton(
      onPressed: onArtistPressed,
      color: LightTheme.container,
      colorBrightness: Brightness.light,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12)),
        side: BorderSide(color: selectedIndex == 0 ? LightTheme.secondary : LightTheme.label),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(24),
        vertical: ScreenUtil().setHeight(24),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text('As an Artist', style: TextStyle(
                  color: selectedIndex == 0 ? LightTheme.secondary : LightTheme.title,
                  fontSize: ScreenUtil().setSp(18),
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                )),
              ),
              Icon(
                selectedIndex == 0 ? FontAwesomeIcons.dotCircle : FontAwesomeIcons.circle,
                size: ScreenUtil().setSp(18),
                color: selectedIndex == 0 ? LightTheme.secondary : LightTheme.label,
              ),
            ],
          ),
          SizedBox(
            height: ScreenUtil().setHeight(8),
          ),
          Text('I’ll showcase and sell my services on the platform', style: TextStyle(
            color: LightTheme.label,
            fontSize: ScreenUtil().setSp(14),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.normal,
          )),
        ],
      ),
    );
  }

  Widget buildClientOption() {
    return RaisedButton(
      onPressed: onClientPressed,
      color: LightTheme.container,
      colorBrightness: Brightness.light,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12)),
        side: BorderSide(color: selectedIndex == 1 ? LightTheme.secondary : LightTheme.label),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(24),
        vertical: ScreenUtil().setHeight(24),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text('As a Client', style: TextStyle(
                  color: selectedIndex == 1 ? LightTheme.secondary : LightTheme.title,
                  fontSize: ScreenUtil().setSp(18),
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                )),
              ),
              Icon(
                selectedIndex == 1 ? FontAwesomeIcons.dotCircle : FontAwesomeIcons.circle,
                size: ScreenUtil().setSp(18),
                color: selectedIndex == 1 ? LightTheme.secondary : LightTheme.label,
              ),
            ],
          ),
          SizedBox(
            height: ScreenUtil().setHeight(8),
          ),
          Text('I’ll find and book services from the best artists around', style: TextStyle(
            color: LightTheme.label,
            fontSize: ScreenUtil().setSp(14),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.normal,
          )),
        ],
      ),
    );
  }

  void onArtistPressed() {
    setState(() {
      selectedIndex = 0;
    });
  }

  void onClientPressed() {
    setState(() {
      selectedIndex = 1;
    });
  }

  void onFacebookSignUp() {
    print('facebook');
  }

  void onGoogleSignUp() {
    print('google');
  }

  void onAppleSignUp() {
    print('apple');
  }
}