class Demande {
  String id;
  String motif;
  String nomUtilisateur;
  String description;
  DateTime dateEnvoi;
  int accepte = 1;

  Demande({
    required this.id,
    required this.motif,
    required this.nomUtilisateur,
    required this.description,
    required this.dateEnvoi,
  });
}
