import 'package:flutter/material.dart';
import 'package:foco_alternativo/views/signup.dart';
import '../widgets/my_text_button.dart';
import 'package:foco_alternativo/services/authentication.dart';
import 'package:foco_alternativo/common/My_snackbar.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthService _authService = AuthService();
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  final _formKeyLogin = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .3,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                colors: [
                  Colors.blue.shade400,
                  Colors.blue.shade600,
                  Colors.blue.shade900
                ],
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 80),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 50),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Welcome Back",
                        style: TextStyle(color: Colors.white, fontSize: 28),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(64),
                  )),
              child: Form(
                key: _formKeyLogin,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                top: 20, left: 20, right: 20, bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  bottomLeft: Radius.circular(16),
                                  bottomRight: Radius.circular(16),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 12, color: Colors.black12),
                                ]),

                            // BOTÃO EMAIL
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('E-mail'),
                                TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    hintText: 'E-mail',
                                    border: InputBorder.none,
                                  ),
                                  validator: (String? value) {
                                    if (value == null) {
                                      return 'The e-mail cannot be empty';
                                    }
                                    if (value.length < 5) {
                                      return 'The e-mail is too short';
                                    }
                                    if (!value.contains('@')) {
                                      return 'The e-mail is not valid';
                                    }
                                    return null;
                                  },
                                )
                              ],
                            ),
                          ),

                          const SizedBox(height: 40),

                          // BOTÃO SENHA
                          Container(
                            padding: EdgeInsets.only(
                                top: 20, left: 20, right: 20, bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  bottomLeft: Radius.circular(16),
                                  bottomRight: Radius.circular(16),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 12, color: Colors.black12),
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Password'),
                                TextFormField(
                                  controller: passwordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: 'password',
                                    border: InputBorder.none,
                                  ),
                                  validator: (String? value) {
                                    if (value == null) {
                                      return 'The password cannot be empty';
                                    }
                                    if (value.length < 5) {
                                      return 'The password is too short';
                                    }
                                    return null;
                                  },
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                          MyTextButton(
                            label: "Login",
                            onTap: () {
                              ButtonClicked();
                            },
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 110,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have a account? ",
                            style: TextStyle(fontSize: 18),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const SignUp()));
                              },
                              child: const Text("Create",
                                  style: TextStyle(fontSize: 18)))
                        ],
                      ),
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

  // ignore: non_constant_identifier_names
  ButtonClicked() {
    String email = emailController.text;
    String senha = passwordController.text;

    if (_formKeyLogin.currentState!.validate()) {
      _authService.loginUsers(email: email, senha: senha).then((String? erro) {
        if (erro != null) {
          // Deu merda
          showSnackBar(context: context, text: erro);
        } else {}
      });
    } else {
      print('Form invalido');
    }
  }
}
