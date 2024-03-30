import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _userNameController = TextEditingController();
    TextEditingController _passkeyController = TextEditingController();

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
        child: FadeTransition(
          opacity: _fadeInAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Vote Ready',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2.0,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 100.0,
                  vertical: 25.0,
                ),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _userNameController,
                        decoration: const InputDecoration(
                          labelText: 'User Name',
                        ),
                      ),
                      TextFormField(
                        controller: _passkeyController,
                        decoration: const InputDecoration(
                          labelText: 'Passkey',
                        ),
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      String username = _userNameController.text;
                      String password = _passkeyController.text;

                      if (username == "user" && password == "password") {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      } else {
                        print('error');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.cyanAccent,
                      minimumSize: const Size(120, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 3.0,
                    ),
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
