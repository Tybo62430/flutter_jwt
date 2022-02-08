class User {
  int id;
  String email;
  String nom;
  String prenom;
  DateTime dateDeNaissance;
  String telephone;
  bool sexe;
  bool cgu;
  bool isVerified;
  String status;
  String adresse;
  String codePostal;
  String ville;

  User({
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
  })  : id = 0,
        isVerified = false,
        status = "inscription";

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        nom = json['nom'],
        prenom = json['prenom'],
        dateDeNaissance = DateTime.parse(json['dateNaissance']),
        telephone = json['telephone'],
        sexe = json['sexe'],
        cgu = json['cgu'],
        isVerified = json['isVerified'],
        status = json['status'],
        adresse = json['adresse'],
        codePostal = json['codePostal'],
        ville = json['ville'];
}
