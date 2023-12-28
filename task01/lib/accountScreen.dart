import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accounts"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Accounts",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 20),
            AccountTile(name: "Panji Pradana", email: "panjipedrana@mail.com"),
            AccountTile(name: "Sulistyo Aji", email: "sustiylo@mail.com"),
            AccountTile(name: "Astrau Lopez", email: "lopez@mail.com"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/forgot');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple, // Change the button color
              ),
              child: Text("Go to Forgot Password"),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountTile extends StatelessWidget {
  final String name;
  final String email;

  AccountTile({required this.name, required this.email});

@override
Widget build(BuildContext context) {
  return Container(
    width: 320,
    height: 100,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.deepPurple, // Change the background color
              child: Icon(
                Icons.person,
                color: Colors.white, // Change the icon color
              ),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  email,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
}
