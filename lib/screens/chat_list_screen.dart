import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../database/firebase/Authentication.dart';
import 'app_users_screen.dart';
class HomePage extends StatelessWidget {
  final String loginCheck;
   HomePage({Key? key, required this.loginCheck}) : super(key: key);
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Screen"), actions: [
        IconButton(onPressed: (){
          Auth.signOut(context);
        }, icon: Icon(Icons.logout))],),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Text((loginCheck == "isLogin")? "Successfully Logined" :"Successfully Registered",   style: TextStyle(
                fontSize: 24.sp,fontWeight: FontWeight.w500,color: Colors.black)),
          SizedBox(height: 10,),
          Text("Generated UserId is ",   style: TextStyle(
              fontSize: 20.sp,fontWeight: FontWeight.w400,color: Colors.black)),
              SizedBox(height: 10,),
          Text(user!.uid),
        ]),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => AppUsersScreen()));
      },),
    );
  }
}

