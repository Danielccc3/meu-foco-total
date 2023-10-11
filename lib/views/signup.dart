import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foco_alternativo/common/My_snackbar.dart';
import 'package:foco_alternativo/services/authentication.dart';
import 'package:foco_alternativo/views/login.dart';
import '../widgets/my_text_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController nickController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    nickController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  final _formKey = GlobalKey<FormState>();

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
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(64),
                  )),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // BOTÃO EMAIL
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

                          const SizedBox(height: 20),

                          // BOTÃO NICKNAME
                          Container(
                            padding: const EdgeInsets.only(
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
                                Text('Nickname'),
                                TextFormField(
                                  controller: nickController,
                                  decoration: InputDecoration(
                                    hintText: 'Nickname',
                                    border: InputBorder.none,
                                  ),
                                  validator: (String? value) {
                                    if (value == null) {
                                      return 'The nickname cannot be empty';
                                    }
                                    if (value.length < 5) {
                                      return 'The nickname is too short';
                                    }
                                    return null;
                                  },
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),

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
                          const SizedBox(height: 20),
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
                                Text('Confirm Password'),
                                TextFormField(
                                  controller: confirmPasswordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: 'Confirm Password',
                                    border: InputBorder.none,
                                  ),
                                  validator: (String? value) {
                                    if (value == null) {
                                      return 'The confirm password cannot be empty';
                                    }
                                    if (value.length < 5) {
                                      return 'The confirm password is too short';
                                    }
                                    return null;
                                  },
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 40),
                          MyTextButton(
                            label: 'Sign Up',
                            onTap: () {
                              ButtonClicked();
                            },
                          ),
                        ],
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
                      ),
                      SizedBox(
                        height: 80,
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

  ButtonClicked() async {
    String nome = nickController.text;
    String email = emailController.text;
    String senha = passwordController.text;
    if (_formKey.currentState!.validate()) {
      await _authService
          .signUpUsers(nome: nome, senha: senha, email: email)
          .then((String? erro) {
            
            if(erro != null){
              // Voltou com erro
              showSnackBar(context: context, text: erro);
            }else {
              // Deu certo
              showSnackBar(context: context, text: 'Cadastro efetuado com sucesso', isError: false);
            }
          });

      await _authService.loginUsers(email: email, senha: senha).then((String? erro) {
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
