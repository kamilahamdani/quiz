import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
              SizedBox(height: 15),
              Text("Kamila Hamdani Lisnawati",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text("232101104", style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
