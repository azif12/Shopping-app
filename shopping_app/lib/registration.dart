import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/constant.dart';
import 'package:shopping_app/login.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController user = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController mobilenumber = TextEditingController();
  final CollectionReference userRef =
      FirebaseFirestore.instance.collection('usercollection');

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assests/images/img5.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 80.h),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'HELLO THERE!..',
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.bold,
                        fontSize: 19.sp,
                      ),
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
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 15.w),
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                color: white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Padding(
                            padding: EdgeInsets.only(right: 15.w),
                            child: Text(
                              'REGISTER',
                              style: TextStyle(
                                color: Colors.blue,
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
                      child: TextField(
                        controller: user,
                        decoration: InputDecoration(
                          fillColor: Colors.black38,
                          filled: true,
                          prefixIcon: Icon(Icons.person, size: 24.sp),
                          labelText: "E-mail",
                          border: OutlineInputBorder(),
                        ),
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
                      child: TextField(
                        controller: password,
                        decoration: InputDecoration(
                          fillColor: Colors.black38,
                          filled: true,
                          prefixIcon: Icon(Icons.lock, size: 24.sp),
                          labelText: "Password",
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
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
                      child: TextField(
                        controller: mobilenumber,
                        decoration: InputDecoration(
                          fillColor: Colors.black38,
                          filled: true,
                          prefixIcon: Icon(Icons.call, size: 24.sp),
                          labelText: "Mobile Number",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: SizedBox(
                    width: 330,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black87),
                      ),
                      onPressed: () async {
                        try {
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .createUserWithEmailAndPassword(
                                  email: user.text,
                                  password: password.text);

                          if (userCredential.user != null) {
                            await userRef.doc(userCredential.user!.uid).set({
                              'name': user.text,
                              'number': mobilenumber.text,
                              'userid': userCredential.user!.uid,
                            });
                            print('User successfully added to Firestore');

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          } else {
                            print('User creation failed');
                          }
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            _showErrorSnackBar(
                                'The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            _showErrorSnackBar(
                                'The account already exists for that email.');
                          } else {
                            _showErrorSnackBar('Error: ${e.message}');
                          }
                        } catch (e) {
                          _showErrorSnackBar('Error: $e');
                        }
                      },
                      child: Text(
                        'GET STARTED >',
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgotten Password?..',
                      style:
                          TextStyle(color: black, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
