// ignore: file_names
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../models/http_exception.dart';

enum AuthMode { Signup, Login }

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    // final transformConfig = Matrix4.rotationZ(-8 * pi / 180);
    // transformConfig.translate(-10.0);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
                  const Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, 1],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 94.0),
                      transform: Matrix4.rotationZ(-8 * pi / 180)
                        ..translate(-10.0),
                      // ..translate(-10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.deepOrange.shade900,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 8,
                            color: Colors.black26,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: const Text(
                        'MyShop',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontFamily: 'Anton',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: deviceSize.width > 600 ? 2 : 1,
                    child: AuthCard(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();

  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 300,
        ));
    // _heighAnimation = Tween<Size>(
    //         begin: Size(double.infinity, 260), end: Size(double.infinity, 320))
    //     .animate(
    //         CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));

    // _heighAnimation.addListener(() {
    //   setState(() {});
    // });
    _opacityAnimation=Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn),  );

     
    _slideAnimation=Tween<Offset>(begin: Offset(0,-1.5),end: Offset(0,0)).animate(CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),  );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  void _showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: const Text('An Error Occured!'),
              content: Text(message),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Okay'))
              ],
            ));
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    try {
      if (_authMode == AuthMode.Login) {
        await Provider.of<Auth>(context, listen: false)
            .signin(_authData['email']!, _authData['password']!);
        // Log user in
      } else {
        await Provider.of<Auth>(context, listen: false)
            .signup(_authData['email']!, _authData['password']!);
        // Sign user up
      }
      // Navigator.of(context).pushReplacementNamed(newRoute)
    } on HttpException catch (error) {
      var message = "Authentication failed. ";
      if (error.toString().contains('EMAIL_EXISTS')) {
        message = 'This email address is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        message = 'This is not valid address.';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        message = 'This password is too weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        message = 'Could not Find a user with that email.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        message = 'Invalid Password.';
      }
      _showErrorDialog(message);
    } catch (error) {
      var message = "Couldn't authenticate you. Please try again later.";
      _showErrorDialog(message);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
      _controller.forward();
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 8.0,
        child: AnimatedContainer (//AnimatedBuilder(
            //   animation: _heighAnimation,
            //   builder: (ctx, ch) => Container(
             height: _authMode == AuthMode.Signup ? 320 : 260,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeIn,
          // height: _heighAnimation.value.height,
          constraints: BoxConstraints(minHeight: _authMode == AuthMode.Signup ? 320 : 260,
          ),
          width: deviceSize.width * 0.75,
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'E-Mail'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Invalid email!';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _authData['email'] = value as String;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 5) {
                        return 'Password is too short!';
                      }
                    },
                    onSaved: (value) {
                      _authData['password'] = value as String;
                    },
                  ),
                    AnimatedContainer(
                      constraints: BoxConstraints(minHeight:_authMode == AuthMode.Signup?60:0,maxHeight:_authMode==AuthMode.Signup?120:0 ),
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn ,
                      child: FadeTransition(
                        opacity: _opacityAnimation,
                        child: SlideTransition(
                          position: _slideAnimation,
                          child: TextFormField(
                            enabled: _authMode == AuthMode.Signup,
                            decoration:
                                const InputDecoration(labelText: 'Confirm Password'),
                            obscureText: true,
                            validator: _authMode == AuthMode.Signup
                                ? (value) {
                                    if (value != _passwordController.text) {
                                      return 'Passwords do not match!';
                                    }
                                  }
                                : null,
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (_isLoading)
                    const CircularProgressIndicator()
                  else
                    ElevatedButton(
                      onPressed: _submit,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 8.0),
                        // color: Theme.of(context).primaryColor,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Text(
                          _authMode == AuthMode.Login ? 'LOGIN' : 'SIGN UP',
                          style: TextStyle(
                              color: Theme.of(context)
                                  .primaryTextTheme
                                  .button!
                                  .color),
                        ),
                      ),
                    ),
                  TextButton(
                    onPressed: _switchAuthMode,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 4),
                      child: Text(
                        '${_authMode == AuthMode.Login ? 'SIGNUP' : 'LOGIN'} INSTEAD',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),

                    // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
