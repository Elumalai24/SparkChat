import 'package:flutter/material.dart';

class AppUsersScreen extends StatelessWidget {
  const AppUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
    body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index){
      return const ListTile(title: Text("Lotus"));
    }),
    );
  }
}
