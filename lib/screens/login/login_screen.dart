import 'package:flutter/material.dart';
import 'package:heroServiceApp/screens/component/passwordwidget.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //กำหนดตัวแปรอีเมลและรหัส
  String _email, _password;

  //สร้างคีย์เก็บสถานะของฟอร์ม
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: GestureDetector(
        onTap: () {
          //ยกเลิก focus ช่อง input
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Form(
              key: formKey,
              child: ListView(
                children: [
                  TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                    decoration: InputDecoration(
                        icon: Icon(Icons.email), labelText: 'email'),
                    // initialValue: 'sphoo.dev@gmail.com',
                    // validator: (value){
                    //   if(value.isEmpty){
                    //     return 'Please input email';
                    //   }
                    //   else{
                    //     return null;
                    //   }
                    // },
                    validator: (value) {
                      if (value.isNotEmpty) {
                        return null;
                      } else {
                        return 'Please input email';
                      }
                    },
                    onFieldSubmitted: (String value) {
                      setState(() {
                        this._email = value;
                      });
                    },
                  ),
                  PasswordField(
                    helperText: 'maximum 6 digits',
                    labelText: 'input password',
                    validator: (value) {
                      if (value.isNotEmpty) {
                        return null;
                      } else if (value.length != 6) {
                        return 'Please input password';
                      }
                    },
                    onFieldSubmitted: (String value) {
                      setState(() {
                        this._password = value;
                      });
                    },
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'เข้าสู่ระบบ',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                    color: Colors.green,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
