import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${userProvider.username.isEmpty ? "Guest" : userProvider.username}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                userProvider.setUsername('Neel Shah'); // Example
              },
              child: const Text('Set Username to Neel Shah'),
            )
          ],
        ),
      ),
    );
  }
}
