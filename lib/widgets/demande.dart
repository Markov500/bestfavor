import 'package:bestfavor/data/data.dart';
import 'package:bestfavor/widgets/affichage_demande.dart';
import 'package:flutter/material.dart';

class Demande extends StatefulWidget {
  const Demande({super.key});

  @override
  State<Demande> createState() => _DemandeState();
}

class _DemandeState extends State<Demande> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: mesDemandes
            .map((e) => AffichageDemande(
                  maDemande: e,
                ))
            .toList(),
      ),
    );
  }
}
