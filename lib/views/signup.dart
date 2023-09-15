import 'package:flutter/material.dart';
import 'package:foco_alternativo/views/login.dart';
import '../widgets/my_input_field.dart';
import '../widgets/my_text_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nickController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();
  void initState() {
    super.initState();
    nickController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue.shade500,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                colors: [
                  Colors.blue.shade500,
                  Colors.blue.shade600,
                  Colors.blue.shade900
                ],
              ),
            ),
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        size: 48,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 38),
                    ),
                    SizedBox(
                      width: 24,
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(64),
                  )),
              child: SafeArea(
                top: false,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MyInputField(
                        label: 'Nickname',
                        placeholder: 'Nickname',
                        onChange: (value) {
                          this.nickController.text = value;
                        },
                      ),
                      SizedBox(height: 40),
                      MyInputField(
                        label: 'Password',
                        placeholder: 'Password',
                        onChange: (value) {
                          this.passwordController.text = value;
                        },
                        isPasswordField: true,
                      ),
                      SizedBox(height: 40),
                      MyInputField(
                        label: 'Confirm Password',
                        placeholder: 'Password',
                        onChange: (value) {
                          this.confirmPasswordController.text = value;
                        },
                        isPasswordField: true,
                      ),
                      SizedBox(height: 40),
                      MyTextButton(
                        label: 'Sign Up',
                        onTap: () {
                          print(this.nickController.text +
                              " | " +
                              this.passwordController.text +
                              " | " +
                              this.confirmPasswordController.text);
                        },
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "You already have a account? ",
                            style: TextStyle(fontSize: 18),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LogIn()),
                                    (route) => false);
                              },
                              child: Text("Log In",
                                  style: TextStyle(fontSize: 18)))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
