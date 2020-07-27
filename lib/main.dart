// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'scenes/CreateAccount.dart';
import 'scenes/SignIn.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mua Nation powered by Flutter',
      initialRoute: '/signin',
      routes: {
        '/signin': (context) => SignIn(),
        '/createAccount': (context) => CreateAccount(),
      },
    );
  }
}
