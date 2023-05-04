class Demande {
  String id;
  String motif;
  String nomUtilisateur;
  String description;
  DateTime dateEnvoi;
  bool? accepte;

  Demande(
      {required this.id,
      required this.motif,
      required this.nomUtilisateur,
      required this.description,
      required this.dateEnvoi,
      this.accepte});
}
