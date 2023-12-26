import 'package:flutter/material.dart';
import 'package:todoapp/const/style.dart';
import 'package:todoapp/data/auth_data.dart';

class SignupScreen extends StatefulWidget {
  final VoidCallback? show;
  const SignupScreen(void Function() to, {Key? key,  this.show}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  FocusNode _focusNode = FocusNode();
  FocusNode _focusNode1 = FocusNode();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordCOntroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
    _focusNode1.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          image(),
          const SizedBox(
            height: 50,
          ),
          textField(_emailController, "email", Icons.email, _focusNode),
          const SizedBox(
            height: 10,
          ),
          textField(
              _passwordCOntroller, "Password", Icons.password, _focusNode1),
          SizedBox(
            height: 8,
          ),
          account(),
          SizedBox(
            height: 20,
          ),
          signUpButton()
        ]),
      )),
    );
  }

  Widget signUpButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
        AuthenticationRemote().register(_emailController.text, _passwordCOntroller.text);
        },
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: custom_green),
          child: Text(
            "Sign Up",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget textField(TextEditingController _controller, String hintText,
      IconData icons, FocusNode _focusNode) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: TextField(
            focusNode: _focusNode,
            controller: _controller,
            style: const TextStyle(fontSize: 18, color: Colors.black),
            decoration: InputDecoration(
                hintText: hintText,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                prefixIcon: Icon(
                  icons,
                  color: _focusNode.hasFocus
                      ? custom_green
                      : const Color(0xffc5c5c5),
                ),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(color: Color(0xffc5c5c5), width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: custom_green, width: 2.0))),
          )),
    );
  }

  Widget image() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
            color: backgroundColor,
            image: DecorationImage(
                fit: BoxFit.fitWidth, image: AssetImage("images/7.png"))),
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
            "Already have an account?",
            style: TextStyle(color: Colors.grey[700], fontSize: 14),
          ),
          SizedBox(
            width: 6,
          ),
          GestureDetector(
            onTap: widget.show,
            child: Text(
              "Login",
              style: TextStyle(
                  color: Colors.blue, fontSize: 15, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
