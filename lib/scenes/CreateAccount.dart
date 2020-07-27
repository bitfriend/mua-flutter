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
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 812);
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
              RaisedButton(
                onPressed: onArtistPressed,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12))
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(24),
                  vertical: ScreenUtil().setHeight(24),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('As an Artist'),
                        Icon(FontAwesomeIcons.dotCircle, size: ScreenUtil().setSp(18), color: LightTheme.secondary),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onArtistPressed() {}

  void onClientPressed() {}
}