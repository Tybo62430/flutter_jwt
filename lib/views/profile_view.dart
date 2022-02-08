import 'package:flutter/material.dart';
import 'package:flutter_jwt/models/user_model.dart';
import 'package:flutter_jwt/providers/auth_provider.dart';
import 'package:flutter_jwt/providers/user_provider.dart';
import 'package:flutter_jwt/views/home_view.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  static String routeName = '/profile';

  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          reverse: true,
          children: [
            ListTile(
              tileColor: Theme.of(context).primaryColor,
              title: const Text(
                'Deconnexion',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Provider.of<AuthProvider>(context, listen: false).signout();
                Navigator.pushNamed(context, HomeView.routeName);
              },
            )
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(
          user.nom + " " + user.prenom,
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
