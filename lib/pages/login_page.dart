import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../components/error_pop.dart';
import '../widgets/page_fonts.dart';
import 'package:vote_ready/pages/register_page.dart';


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
    TextStyle headerStyle = GoogleFonts.fugazOne(
      fontWeight: FontWeight.bold,
      fontSize: 100.spMin,
    );
    TextStyle bodyStyle = GoogleFonts.inter(
      fontWeight: FontWeight.bold,
      fontSize: 24.spMin,
    );

    return Scaffold(
      body: FadeTransition(
        opacity: _fadeInAnimation,
        child: SizedBox(
          height: 1.sh,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 1.sh,
                width: 0.5.sw,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 40.sp,
                      child: StrokeFont(
                        text: 'Vote',
                        headerStyle: headerStyle,
                        fontColor: const Color(0xFFFF9933),
                      ),
                    ),
                    Positioned(
                      bottom: 40.sp,
                      child: StrokeFont(
                        text: 'Ready',
                        headerStyle: headerStyle,
                        fontColor: const Color(0xFF128807),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 5,
                height: 200,
                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(1.sh)),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 0.35.sw,
                      child: Text(
                        "To continue, login with your Google account",
                        style: bodyStyle,
                        textAlign: TextAlign.center,
                      )),
                  SizedBox(
                    height: 0.05.sh,
                  ),
                  ElevatedButton(
                      onPressed: () async {

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const Register()),
                          ModalRoute.withName('/vote ready'),
                        );

                        await authenticateWithGoogle(context: context);
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/google_icon.png',
                            height: 0.1.sh,
                          ),
                          SizedBox(
                            width: 0.025.sh,
                          ),
                          Text(
                            "Login with Google",
                            style: bodyStyle.copyWith(
                              fontSize: 14.spMin,
                            ),
                          ),
                        ],
                      )),
                ],
              )
            ],
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

Future<void> authenticateWithGoogle({required BuildContext context}) async {
  try {
    await AuthService.signInWithGoogle();
    final db = FirebaseFirestore.instance;
    final user = <String, dynamic>{
      "username": AuthService.user!.displayName!,
      "email": AuthService.user!.email!,

    };
    await db.collection("users").doc(AuthService.user!.email).set(user, SetOptions(merge: true));
    // db.collection("users").doc(AuthService.user!.email).update(user);

  } on NoGoogleAccountChosenException {

    return;
  } catch (e) {
    print(e);
    // showMessageDialog(
    //   message: "An unknown error has occurred. Please try again.",
    //   context: context,
    // );
    const ErrorPopUp();
  }
}

class NoGoogleAccountChosenException implements Exception {
  const NoGoogleAccountChosenException();
}

class AuthService {
  AuthService._();

  static final _auth = FirebaseAuth.instance;
  static User? get user => _auth.currentUser;
  static Stream<User?> get userStream => _auth.userChanges();

  static Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      throw const NoGoogleAccountChosenException();
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
