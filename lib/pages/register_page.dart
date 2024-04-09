import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vote_ready/pages/home_page.dart';
import '../components/error_pop.dart';
import 'login_page.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userMobileController = TextEditingController();
  final TextEditingController _userIDController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // _checkIfRegistered();

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
    TextStyle titleStyle = GoogleFonts.poppins(
      fontSize: 24.spMin,
      fontWeight: FontWeight.w900,
    );
    TextStyle bodyStyle = GoogleFonts.poppins(
      fontSize: 16.spMin,
      fontWeight: FontWeight.w500,
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: FadeTransition(
                opacity: _fadeInAnimation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 0.02.sh,
                    ),
                    Text(
                      'Register',
                      style: titleStyle.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 150.0,
                        vertical: 25.0,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: _userNameController,
                              decoration: InputDecoration(
                                labelText: 'Your registered name',
                                labelStyle: bodyStyle,
                              ),
                              style: bodyStyle.copyWith(
                                fontSize: 18.spMin,
                                height: 2,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty || value.length < 3) {
                                  return 'Name must be at least 3 characters';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: _userMobileController,
                              decoration: InputDecoration(
                                labelText: 'Registered phone number',
                                labelStyle: bodyStyle,
                              ),
                              keyboardType: TextInputType.phone,
                              style: bodyStyle.copyWith(
                                fontSize: 18.spMin,
                                height: 2,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty || value.length != 10) {
                                  return 'Enter a valid 10-digit phone number';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: _userIDController,
                              decoration: InputDecoration(
                                labelText: 'Registered ID number',
                                labelStyle: bodyStyle,
                              ),
                              style: bodyStyle.copyWith(
                                fontSize: 18.spMin,
                                height: 2,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty || value.length != 6) {
                                  return 'ID must be 6 characters';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _register();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(120, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 3.0,
                      ),
                      child: Text(
                        'Register',
                        style: bodyStyle.copyWith(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _register() async {
    String username = _userNameController.text;
    String mobile = _userMobileController.text;
    String userid = _userIDController.text;
    try {
      final db = FirebaseFirestore.instance;
      final registerData = <String, dynamic>{
        "Name": username,
        "ID": userid,
        "Phone": mobile
      };
      await db.collection("users").doc(AuthService.user!.email).set(registerData, SetOptions(merge: true));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('registered', true);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } catch (e) {
      print(e);
      const ErrorPopUp();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
