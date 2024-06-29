import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'HomeScreen.dart';
import 'LoginScreen.dart';
import 'firebase_options.dart';
Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      ScreenUtilInit(
    builder: (context, _) {
      return  const MaterialApp(home: MyApp());
    }
  ));
}
class MyApp extends StatelessWidget {
 const  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            print("if called");
            return  HomePage(loginCheck: "isLogin",);
          }
          else{
            print(" else called");
            return LoginScreen();
          }
        }
    );
  }
  }
