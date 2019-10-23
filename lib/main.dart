import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title,this.email}) : super(key: key);
  final String title;
  final String email;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Roboto', fontSize: 20.0);
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    email.dispose();
    password.dispose();
    super.dispose();
  }
  void show_toast (String string) {
    Toast.show(string, context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
  }
  @override
  Widget build(BuildContext context) {

    final emailField = TextField(
      obscureText: true,
      style: style,
      controller: email,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextField(
      obscureText: true,
      style: style,
      controller: password,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {
          if(email.text.isEmpty){
            show_toast("Please enter email id");
          }else
          if(password.text.isEmpty){
            show_toast("Please enter password");
          }else{
            return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(email.text+"\n"+password.text),
                );
              },
            );
          }
/*
            return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(email.text+"\n"+password.text),
                );
              },
            );
*/

          },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              color: Colors.white,
              margin: const EdgeInsets.only(top: 40),
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 155.0,
                      width: 155,

                      child: Image.asset("images/logo.png"),
                    ),
                    /*CircleImage(

                    ),*/
                    SizedBox(height: 45.0),
                    emailField,
                    SizedBox(height: 25.0),
                    passwordField,
                    SizedBox(
                      height: 35.0,
                    ),
                    loginButon,
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }

}

class CircleImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double _size = 150.0;


    return Center(

      child: new Container(

          width: _size,

          height: _size,

          decoration: new BoxDecoration(

              shape: BoxShape.circle,

              image: new DecorationImage(

                  fit: BoxFit.cover,

                  image: new NetworkImage(

                      "https://www.woolha.com/media/2019/06/buneary.jpg")

              )

          )

      ),

    );
  }

}