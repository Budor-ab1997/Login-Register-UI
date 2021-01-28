import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/RegisterPage.dart';
import 'HomePage.dart';

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
  fontSize: 18,
);

class LogIn extends StatefulWidget {
  static const id = 'LogIn';
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final formKey = GlobalKey<FormState>();
  String _email;
  String _password;

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 60.0,
          child: TextFormField(
            obscureText: false,
            validator: (value) => value.isEmpty ? 'الإيميل مطلوب' : null,
            onSaved: (value) => _email = value,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.email,
                color: Colors.deepPurpleAccent,
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelText: 'البريد الالكتروني',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 60.0,
          child: TextFormField(
            obscureText: true,
            validator: (value) => value.isEmpty ? 'ألرقم السري مطلوب' : null,
            onSaved: (value) => _password = value,
            decoration: InputDecoration(
              focusColor: Colors.deepPurple,
              hoverColor: Colors.deepPurpleAccent,
              prefixIcon: Icon(
                Icons.vpn_key,
                color: Colors.deepPurpleAccent,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              labelText: 'كلمة المرور',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: _isButtonDisabled
            ? null
            : () {
                if (formKey.currentState.validate() == true) {
                  setState(() {
                    _isButtonDisabled = true;
                  });
                }
                formKey.currentState.validate()
                    ? Timer(
                        Duration(seconds: 3),
                        () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (BuildContext context) => HomePage())),
                      )
                    : print('notValid');
              },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'دخول',
          style: TextStyle(
            color: Colors.deepPurple,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  bool valuefirst = false;
  bool _isButtonDisabled;
  @override
  void initState() {
    super.initState();
    _isButtonDisabled = false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent,
      ),
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: Form(
              key: formKey,
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.deepPurpleAccent,
                            Color(0xFFF7F9FB),
                            Color(0xFFFCF8E7),
                            Color(0xFFFAFAFA),
                          ],
                          stops: [0.1, 0.4, 0.7, 0.9],
                        ),
                      ),
                    ),
                    Container(
                      height: double.infinity,
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          horizontal: 40.0,
                          vertical: 120.0,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'تسجيل الدخول',
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontFamily: 'OpenSans',
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            _buildEmailTF(),
                            SizedBox(
                              height: 30.0,
                            ),
                            _buildPasswordTF(),
                            SizedBox(
                              height: 25,
                            ),
                            CheckboxListTile(
                              title: Text(
                                'تذكرني',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurpleAccent),
                              ),
                              value: this.valuefirst,
                              onChanged: (bool value) {
                                setState(() {
                                  this.valuefirst = value;
                                });
                              },
                            ),
                            _buildLoginBtn(),
                            SizedBox(
                              height: 30,
                            ),
                            GestureDetector(
                              child: Text(
                                'لايوجد لديك حساب؟ سجل الآن',
                                style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => RegisterPage()));
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
