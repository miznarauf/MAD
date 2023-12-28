import 'package:flutter/material.dart';
import 'package:task01/ForgotPasswprdScreen.dart'; // Import your ForgotPasswordScreen
import 'package:task01/accountScreen.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AccountScreen(),
    // Navigate to the ForgotPasswordScreen
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Modified Flutter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Remove the home property from here, as we're using the home property in the main function.
    );
  }
}
