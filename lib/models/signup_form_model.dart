class SignupForm {
  String email;
  String password;
  String nom;
  String prenom;
  DateTime dateDeNaissance;
  String telephone;
  bool sexe;
  bool cgu;
  String adresse;
  String codePostal;
  String ville;

  SignupForm({
    required this.email,
    required this.nom,
    required this.prenom,
    required this.dateDeNaissance,
    required this.telephone,
    required this.sexe,
    required this.cgu,
    required this.adresse,
    required this.codePostal,
    required this.ville,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'nom': nom,
      'prenom': prenom,
      'dateNaissance': dateDeNaissance.toString(),
      'telephone': telephone,
      'sexe': sexe,
      'cgu': cgu,
      'adresse': adresse,
      'codePostal': codePostal,
      'ville': ville,
    };
  }
}
