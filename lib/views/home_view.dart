import 'package:flutter/material.dart';
import 'package:flutter_jwt/views/auth/signin_view.dart';
import 'package:flutter_jwt/views/auth/signup_view.dart';

class HomeView extends StatelessWidget {
  static String routeName = '/';

  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Bienvenue sur Malco !',
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
            ),
            FlatButton(
              color: Colors.grey.shade900,
              onPressed: () {
                Navigator.pushNamed(context, SignupView.routeName);
              },
              child: const Text(
                "S'inscrire",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            FlatButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.pushNamed(context, SigninView.routeName);
              },
              child: const Text(
                "Connexion",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
