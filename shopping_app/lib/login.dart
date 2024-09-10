import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/Screens/HomePage/Bottomnavigation/Bottomscreen.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/registration.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assests/images/img5.jpg',
              fit: BoxFit.fill,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 100),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 80.h),
                      child: Text(
                        'Welcome back!',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 19.sp,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: Container(
                        height: 50.h,
                        width: 328.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.black87,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Padding(
                                padding: EdgeInsets.only(left: 15.w),
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegistrationPage()),
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 15.w),
                                child: Text(
                                  'REGISTER',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Card(
                        elevation: 10,
                        child: SizedBox(
                          height: 50.h,
                          child: TextFormField(
                            controller: userController,
                            decoration: InputDecoration(
                              fillColor: Colors.black38,
                              filled: true,
                              prefixIcon: Icon(Icons.person, size: 24.sp),
                              labelText: "E-mail",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your username';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Card(
                        elevation: 10,
                        child: SizedBox(
                          height: 50.h,
                          child: TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              fillColor: Colors.black38,
                              filled: true,
                              prefixIcon: Icon(Icons.lock, size: 24.sp),
                              labelText: "Password",
                              border: OutlineInputBorder(),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: isLoading
                          ? CircularProgressIndicator()
                          : ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(black)),
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  try {
                                    UserCredential userCredential =
                                        await FirebaseAuth.instance
                                            .signInWithEmailAndPassword(
                                                email: userController.text,
                                                password:
                                                    passwordController.text);

                                    if (userCredential.user != null) {
                                      print('User successfully logged in');
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MyBottomNavigationBar()));
                                    } else {
                                      print('Login failed');
                                    }
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'user-not-found') {
                                      print('No user found for that email.');
                                    } else if (e.code == 'wrong-password') {
                                      print('Wrong password provided.');
                                    } else {
                                      print('Error: ${e.message}');
                                    }
                                  } catch (e) {
                                    print('Error: $e');
                                  } finally {
                                    setState(() {
                                      isLoading = false;
                                    });
                                  }
                                }
                              },
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp,
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
