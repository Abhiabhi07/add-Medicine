import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../provider/auth.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  GlobalKey<FormState> _formKey = GlobalKey();

  var signUp = false;
  var userName;
  var email;
  var password;
  String error = '';
  var _obscureText = true;
  bool _loading = false;
  bool _googleLoading = false;

  List<String> errors = [''];

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return null;
    }
    _formKey.currentState!.save();

    if (signUp) {
      Auth(loading: (bool loading) {
        setState(() {
          _loading = loading;
        });
      }).createAccount(
        email: email,
        password: password,
        userName: userName,
        context: context,
      );
    } else {
      Auth(loading: (bool loading) {
        setState(() {
          _loading = loading;
        });
      }).signIn(
        email: email,
        password: password,
        context: context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final text = signUp ? 'Sign Up' : 'Sign In';
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.cover,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    text,
                    style: GoogleFonts.openSans(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        if (signUp)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: TextFormField(
                              decoration: InputDecoration(
                                icon: Icon(
                                  CupertinoIcons.person,
                                  color: Colors.teal,
                                ),
                                hintText: 'Enter your full name',
                              ),
                              validator: (v) {
                                if (v!.isEmpty) {
                                  return 'Please enter username';
                                } else if (v.length < 4) {
                                  return 'Username must be at least 4 characters';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (v) {
                                userName = v;
                              },
                            ),
                          ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            icon: Icon(
                              CupertinoIcons.at,
                              color: Colors.teal,
                            ),
                            hintText: 'Enter your email',
                          ),
                          validator: (v) {
                            if (v!.isEmpty) {
                              return 'Please enter email';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (v) {
                            email = v;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: TextFormField(
                            obscureText: _obscureText,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              icon: Icon(
                                CupertinoIcons.lock,
                                color: Colors.teal,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off_outlined,
                                  color: Colors.teal,
                                ),
                              ),
                              hintText: 'Enter your password',
                            ),
                            validator: (v) {
                              RegExp regex = RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                              if (v!.isEmpty) {
                                return 'Please enter password';
                              } else if (!regex.hasMatch(v)) {
                                return 'Password must contain at least one upper case,\n one lower case, one digit and one special character';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (v) {
                              password = v;
                            },
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  color: Colors.blue,
                                  wordSpacing: -0.2,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlue, elevation: 0.0),
                        onPressed: () {
                          _submit();
                        },
                        child: _loading
                            ? CircularProgressIndicator(
                                color: Colors.yellow,
                              )
                            : Text(
                                text,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.teal,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'OR',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: _googleLoading
                      ? Column(
                        children: [
                          CircularProgressIndicator(
                              color: Colors.yellow,
                            ),
                        ],
                      )
                      : OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(width: 0.3),
                              padding: EdgeInsets.symmetric(vertical: 10)),
                          onPressed: () {

                            Auth(loading: (bool loading) {
                              setState(() {
                                _googleLoading = loading;
                              });
                            }).signInWithGoogle(context);
                          },
                          icon: Image.asset(
                            'assets/g.png',
                            height: 25,
                          ),
                          label: Text(
                            'Continue with Google',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                            text:
                                signUp ? 'Have an account?' : 'New to Adicine?',
                            style: TextStyle(color: Colors.black, fontSize: 17),
                            children: [
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      setState(() {
                                        signUp = !signUp;
                                      });
                                    },
                                  text: signUp ? ' Sign in' : ' Sign up',
                                  style: TextStyle(color: Colors.lightBlue))
                            ]),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
