import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Forgot Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.lock,
                  size: 24,
                ),
                Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              "Enter the email that you used to register your account so we can send you a link to reset your password.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: "Email"),
                  ),
                ),
                SizedBox(width: 10), // Add spacing between input and button
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/account');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple, // Change the button color
                  ),
                  child: Text(
                    "Go to Account",
                    style: TextStyle(
                      color: Colors.white, // Change the text color
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Forgot your email? Try phone number",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
