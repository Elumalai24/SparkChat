
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../database/firebase/Authentication.dart';
import '../database/firebase/firestore.dart';
import 'login_screen.dart';


class SignUpScreen extends StatefulWidget {
  final String title;
  const SignUpScreen({Key? key, required this.title}) : super(key: key);
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formkey = GlobalKey<FormState>();
  Auth instance = Auth();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool isHidden = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Form(
            key: _formkey,
            child: Container(
              padding: EdgeInsets.only(
                  bottom: 180.h, top: 120.h, left: 12.w, right: 12.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Create Account',
                      style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                  SizedBox(height: 19.h),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
                    cursorColor: Colors.black,
                    controller: _nameController,
                    onChanged: (val) {},
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      labelText: 'Name',
                      labelStyle: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.w),
                          // borderRadius: BorderRadius.circular(5.w)
                          borderRadius: BorderRadius.circular(6)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.w),
                          //  borderRadius: BorderRadius.circular(5.w)
                          borderRadius: BorderRadius.circular(6)),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.black, width: 1.w),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.black, width: 1.w),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.black, width: 1.w),
                      ),
                    ),
                  ),
                  SizedBox(height: 28.h),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
                    cursorColor: Colors.black,
                    controller: _emailController,
                    onChanged: (val) {},
                    decoration: InputDecoration(
                      // border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10),
                      // prefix: Text(
                      //   '+91 ',
                      //   style:  TextStyle(
                      //           fontSize: 12.sp,
                      //           fontWeight: FontWeight.w400,
                      //           color: Colors.black)
                      // ),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.w),
                          // borderRadius: BorderRadius.circular(5.w)
                          borderRadius: BorderRadius.circular(6)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.w),
                          //  borderRadius: BorderRadius.circular(5.w)
                          borderRadius: BorderRadius.circular(6)),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.black, width: 1.w),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.black, width: 1.w),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.black, width: 1.w),
                      ),
                    ),
                  ),
                  SizedBox(height: 28.h),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
                    cursorColor: Colors.black,
                    obscureText: isHidden,
                    controller: _passController,
                    onChanged: (val) {},
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 8.h),
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isHidden = !isHidden;
                            });
                          },
                          child: isHidden
                              ? Icon(Icons.visibility_off,
                                  size: 18.sp, color: Colors.black)
                              : Icon(Icons.visibility,
                                  size: 18.sp, color: Colors.black)),
                      labelText: 'PASSWORD',
                      labelStyle: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.w),
                          // borderRadius: BorderRadius.circular(5.w)
                          borderRadius: BorderRadius.circular(6)),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.w),
                          //  borderRadius: BorderRadius.circular(5.w)
                          borderRadius: BorderRadius.circular(6)),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.black, width: 1.w),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.black, width: 1.w),
                      ),
                      focusedErrorBorder: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.black, width: 1.w),
                      ),
                    ),
                  ),
                  SizedBox(height: 13.h),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formkey.currentState!.validate() &&
                          _emailController.text.endsWith("@gmail.com") &&
                          _passController.text.length >= 4 &&
                          _nameController.text.length >= 4) {
                       final User? user =  await Auth.registerUsingEmailAndPassword(
                            email: _emailController.text,
                            password: _passController.text,
                            name: _nameController.text,
                            context: context);
                       if(user != null){
                       await DatabaseService().addUser( userId: user.uid, name: user.displayName ?? "", email: user.email ?? "");
                       }
                      } else {
                        const snackBar =
                            SnackBar(content: Text("Enter Correctly"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      FocusScope.of(context).unfocus();
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        // padding: EdgeInsets.all(10),
                        minimumSize: Size(336.w, 43.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        )),
                    child: Text('Register',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ))
                  ),
                  SizedBox(height: 22.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      LoginScreen()));
                        },
                        child: Text('Login to Continue',
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
