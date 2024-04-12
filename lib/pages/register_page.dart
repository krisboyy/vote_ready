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
  String? _selectedConstituency;
  final List<String> _constituencies = [
    'Changanassery',
    'Ettumanoor',
    'Kaduthuruthy',
    'Kanjirappally',
    'Kottayam',
    'Pala',
    'Poonjar',
    'Puthuppally',
    'Vaikom',
  ];

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
                    const SizedBox(height: 16.0),
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
                            DropdownButtonFormField<String>(
                              value: _selectedConstituency,
                              decoration: InputDecoration(
                                labelText: 'Registered constituency',
                                labelStyle: bodyStyle,
                              ),
                              style: bodyStyle.copyWith(
                                fontSize: 18.spMin,
                                height: 1.5,
                                color: Colors.black,
                              ),
                              items: _constituencies.map((String constituency) {
                                return DropdownMenuItem<String>(
                                  value: constituency,
                                  child: Text(constituency),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedConstituency = value;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select a constituency';
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
                    const SizedBox(height: 25.0),
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
    String? constituency = _selectedConstituency;
    try {
      final db = FirebaseFirestore.instance;
      final registerData = <String, dynamic>{
        "Name": username,
        "Constituency": constituency,
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
