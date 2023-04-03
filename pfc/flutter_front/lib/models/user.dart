class User {
  late String matricule;
  late String password;
  User(String matricule, String password) {
    this.matricule = matricule;
    this.password = password;
  }
  String getPassword() {
    return this.password;
  }

  String getMatricule() {
    return this.matricule;
  }
}
