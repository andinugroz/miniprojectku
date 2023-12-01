import 'package:flutter/material.dart';
import 'package:miniproject/pages/article.dart';
import 'package:miniproject/pages/register.dart';
import 'package:miniproject/provider/authprovider.dart';
import 'package:miniproject/session.dart';
import 'package:miniproject/style.dart';
import 'package:miniproject/widget/customButton.dart';
import 'package:miniproject/widget/customtextfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _obscure = true;

  late AuthProvider authProvider;

  @override
  void initState() {
    // TODO: implement initState
    authProvider = AuthProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(60),
            width: 390,
            height: 250,
            decoration: ShapeDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/banner.jpg"),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                      Color.fromRGBO(113, 157, 233, 0.7), BlendMode.srcATop)),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFFD1D5DB)),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
              ),
            ),
            child: Center(
                child: Image.asset(
              "assets/metrodataacademy.png",
              width: 250,
              height: 180,
            )),
          ),
          Column(children: [
            Text(
              "Selamat Datang",
              style: Styles.text32,
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CustomTextField(
                    label: "Email",
                    controller: _email,
                    hint: "Masukan Email",
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    label: "Password",
                    controller: _password,
                    hint: "Masukan Password",
                    obscureText: _obscure,
                    sufficIcon: IconButton(
                      icon: Icon(
                        Icons.visibility,
                        color: Styles.lightgrey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscure = !_obscure;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomButton(
                      onPressed: () => onLogin(context),
                      minimumsize: Size.fromHeight(40),
                      label: 'Masuk',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Belum punya akun Metrodata Academy",
                      style: Styles.text10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterPage(),
                            ));
                      },
                      child: Text(
                        "Daftar Sekarang!",
                        style: Styles.linktext10,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ))
          ])
        ],
      ),
    );
  }

  onLogin(BuildContext context) async {
    dynamic result = await authProvider.login(_email.text, _password.text);
    if (result != null && result["message"] == "Success") {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ArticlePage()));
      print("${Session.tokenSessionKey}");
    } else if (result != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(result["message"]),
        duration: Duration(seconds: 3),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("error"),
        duration: Duration(seconds: 3),
      ));
    }
  }
}
