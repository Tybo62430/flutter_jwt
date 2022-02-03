import 'package:flutter/material.dart';
import 'package:flutter_jwt/models/signup_form_model.dart';
import 'package:flutter_jwt/providers/auth_provider.dart';
import 'package:flutter_jwt/views/auth/signin_view.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SignupView extends StatefulWidget {
  static String routeName = '/signup';
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  late SignupForm signupForm;
  bool _gender = false;

  FormState get form => key.currentState!;

  @override
  void initState() {
    signupForm = SignupForm(
        email: "",
        nom: "",
        prenom: "",
        dateDeNaissance: DateTime.now(),
        telephone: "",
        sexe: false,
        cgu: false,
        adresse: "",
        codePostal: "",
        ville: "",
        password: "");
    super.initState();
  }

  Future<void> submitForm() async {
    if (form.validate()) {
      form.save();
      final error = await Provider.of<AuthProvider>(context, listen: false)
          .signup(signupForm);
      if (error == null) {
        Navigator.pushNamed(context, SigninView.routeName);
      } else {
        print(error.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.only(top: 50, bottom: 20, left: 20, right: 20),
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Inscription',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              Form(
                key: key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        const Text('Sexe:  ',
                            style: TextStyle(color: Colors.white)),
                        Radio(
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.white),
                          value: false,
                          groupValue: _gender,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _gender = value;
                                signupForm.sexe = _gender;
                              });
                            }
                          },
                        ),
                        const Text('Homme ',
                            style: TextStyle(color: Colors.white)),
                        Radio(
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Colors.white),
                          value: true,
                          groupValue: _gender,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                _gender = value;
                                signupForm.sexe = _gender;
                              });
                            }
                          },
                        ),
                        const Text('Femme ',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    const Text(
                      "Nom",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 3),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade900,
                        filled: true,
                      ),
                      style: const TextStyle(color: Colors.white),
                      onSaved: (newValue) {
                        signupForm.nom = newValue!;
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    const Text(
                      "Prenom",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 3),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade900,
                        filled: true,
                      ),
                      style: const TextStyle(color: Colors.white),
                      onSaved: (newValue) {
                        signupForm.prenom = newValue!;
                      },
                    ),
                    // const Padding(
                    //   padding: EdgeInsets.symmetric(vertical: 15),
                    // ),
                    // const Text(
                    //   "Date de naissance",
                    //   style: TextStyle(
                    //       color: Colors.white, fontWeight: FontWeight.bold),
                    // ),
                    // const Padding(
                    //   padding: EdgeInsets.symmetric(vertical: 3),
                    // ),
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //     fillColor: Colors.grey.shade900,
                    //     filled: true,
                    //   ),
                    //   style: const TextStyle(color: Colors.white),
                    //   onSaved: (newValue) {
                    //     signupForm.dateDeNaissance = newValue!;
                    //   },
                    // ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    const Text(
                      "Email",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 3),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade900,
                        filled: true,
                      ),
                      style: const TextStyle(color: Colors.white),
                      onSaved: (newValue) {
                        signupForm.email = newValue!;
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    const Text(
                      "Telephone",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 3),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade900,
                        filled: true,
                      ),
                      style: const TextStyle(color: Colors.white),
                      onSaved: (newValue) {
                        signupForm.telephone = newValue!;
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    const Text(
                      "Adresse",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 3),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade900,
                        filled: true,
                      ),
                      style: const TextStyle(color: Colors.white),
                      onSaved: (newValue) {
                        signupForm.adresse = newValue!;
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    const Text(
                      "Code Postal",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 3),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade900,
                        filled: true,
                      ),
                      style: const TextStyle(color: Colors.white),
                      onSaved: (newValue) {
                        signupForm.codePostal = newValue!;
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    const Text(
                      "Ville",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 3),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade900,
                        filled: true,
                      ),
                      style: const TextStyle(color: Colors.white),
                      onSaved: (newValue) {
                        signupForm.ville = newValue!;
                      },
                    ),
                    // const Text(
                    //   "Cgu",
                    //   style: TextStyle(
                    //       color: Colors.white, fontWeight: FontWeight.bold),
                    // ),
                    // const Padding(
                    //   padding: EdgeInsets.symmetric(vertical: 3),
                    // ),
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //     fillColor: Colors.grey.shade900,
                    //     filled: true,
                    //   ),
                    //   style: const TextStyle(color: Colors.white),
                    //   onSaved: (newValue) {
                    //     signupForm.cgu = newValue!;
                    //   },
                    // ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    const Text(
                      "Password",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 3),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade900,
                        filled: true,
                      ),
                      style: const TextStyle(color: Colors.white),
                      onSaved: (newValue) {
                        signupForm.password = newValue!;
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    FlatButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: submitForm,
                      child: const Text(
                        "S'inscrire",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
