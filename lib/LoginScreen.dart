
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Authentication.dart';
import 'HomeScreen.dart';
import 'SignUpScreen.dart';
class LoginScreen extends StatefulWidget {

  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  Auth instance = Auth();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
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
        appBar: AppBar(title: Text("Firebase Auth"),
        automaticallyImplyLeading: false,
        ),
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formkey,
          child: Container(
            padding: EdgeInsets.only(
                bottom: 180.h, top: 120.h, left: 12.w, right: 12.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Welcome to this app',
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
                        _passController.text.length >= 4) {
                     await Auth.signInUsingEmailPassword(
                                email: _emailController.text,
                                password: _passController.text,
                            context: context
                            );
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
                  child: Text('Login',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      )),
                ),
                SizedBox(height: 22.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'New to this app?',
                      style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)
                    ),
                    SizedBox(width: 5.w),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(title: "Firebase Auth")));
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black)
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
}
