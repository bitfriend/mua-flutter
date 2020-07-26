import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tinycolor/tinycolor.dart';
import '../theme/light.dart';

class SignIn extends StatefulWidget {
  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 812);
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Welcome to', style: TextStyle(
                    color: LightTheme.black,
                    fontSize: ScreenUtil().setSp(24),
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none
                  )),
                  Text('Mua`s', style: TextStyle(
                    color: LightTheme.secondary,
                    fontSize: ScreenUtil().setSp(38),
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w800,
                    decoration: TextDecoration.none
                  )),
                ],
              ),
              Text('place for professionals', style: TextStyle(
                color: LightTheme.label,
                fontSize: ScreenUtil().setSp(14),
                fontFamily: 'Lato',
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none
              )),
              Container(
                width: ScreenUtil().setWidth(375),
                height: ScreenUtil().setHeight(350),
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    int n = index + 1;
                    return Container(
                      margin: EdgeInsets.only(
                        top: ScreenUtil().setHeight(44),
                        right: ScreenUtil().setWidth(48),
                        bottom: ScreenUtil().setHeight(72),
                        left: ScreenUtil().setWidth(48),
                      ),
                      child: Image(
                        image: AssetImage('images/splash$n.png'),
                      ),
                    );
                  },
                  itemCount: 3,
                  pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      color: LightTheme.grey2,
                      size: ScreenUtil().setWidth(7),
                      activeColor: LightTheme.grey0,
                      activeSize: ScreenUtil().setWidth(7),
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: ScreenUtil().setWidth(254),
                      height: ScreenUtil().setHeight(64),
                      child: RaisedButton(
                        onPressed: onFacebookSignIn,
                        color: LightTheme.secondary,
                        textColor: LightTheme.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12))
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(FontAwesomeIcons.facebookF, size: ScreenUtil().setSp(24)),
                            SizedBox(
                              width: ScreenUtil().setWidth(8),
                            ),
                            Text('Login with Facebook', style: TextStyle(
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
                        onPressed: onGoogleSignIn,
                        color: LightTheme.secondary,
                        textColor: LightTheme.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12))
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(FontAwesomeIcons.google, size: ScreenUtil().setSp(24)),
                            SizedBox(
                              width: ScreenUtil().setWidth(8),
                            ),
                            Text('Login with Google', style: TextStyle(
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
                        onPressed: onAppleSignIn,
                        color: LightTheme.secondary,
                        textColor: LightTheme.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12))
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(FontAwesomeIcons.apple, size: ScreenUtil().setSp(24)),
                            SizedBox(
                              width: ScreenUtil().setWidth(8),
                            ),
                            Text('Login with Apple', style: TextStyle(
                              fontSize: ScreenUtil().setSp(18),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                            )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(24),
                    ),
                    Text('New to this platform?', style: TextStyle(
                      color: LightTheme.label,
                      fontSize: ScreenUtil().setSp(14),
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                    )),
                    SizedBox(
                      height: ScreenUtil().setHeight(16),
                    ),
                    Container(
                      width: ScreenUtil().setWidth(254),
                      height: ScreenUtil().setHeight(64),
                      child: FlatButton(
                        onPressed: onSignUp,
                        color: TinyColor(LightTheme.secondary).lighten(40).color,
                        textColor: LightTheme.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(12))
                        ),
                        child: Text('Create an account', style: TextStyle(
                          fontSize: ScreenUtil().setSp(18),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(16),
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

  void onFacebookSignIn() {
    print('facebook');
  }

  void onGoogleSignIn() {
    print('google');
  }

  void onAppleSignIn() {
    print('apple');
  }

  void onSignUp() {
    print('apple');
  }
}
