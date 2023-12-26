import 'package:flutter/material.dart';
import 'package:todoapp/const/style.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback? show;
  const LoginScreen(this.show, {Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _focusNode1.addListener(() {
      setState(() {});
    });
    _focusNode2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            image(),
            SizedBox(
              height: 50,
            ),
            textField(_emailController, "Email", Icons.email, _focusNode1),
            SizedBox(
              height: 10,
            ),
            textField(
                _passwordController, "password", Icons.password, _focusNode2),
            SizedBox(
              height: 10,
            ),
            account(),
            SizedBox(
              height: 20,
            ),
            login()
          ],
        ),
      )),
    );
  }

  Widget image() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
            color: backgroundColor,
            image: DecorationImage(
                image: AssetImage("images/7.png"), fit: BoxFit.fitWidth)),
      ),
    );
  }

  Widget textField(TextEditingController _controller, String hintText,
      IconData icons, FocusNode _focusNode) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: TextField(
          controller: _controller,
          focusNode: _focusNode,
          style: TextStyle(color: Colors.black, fontSize: 18),
          decoration: InputDecoration(
              hintText: hintText,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              prefixIcon: Icon(
                icons,
                color: _focusNode.hasFocus ? custom_green : Colors.grey,
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color:
                          _focusNode.hasFocus ? custom_green : Colors.grey))),
        ),
      ),
    );
  }

  Widget account() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Don't have an account?",
            style: TextStyle(color: Colors.grey[700], fontSize: 14),
          ),
          SizedBox(
            width: 6,
          ),
          GestureDetector(
            onTap: widget.show,
            child: Text(
              "Sign Up",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget login() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          print("signup got pressed");
        },
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: custom_green),
          child: Text(
            "Login",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
