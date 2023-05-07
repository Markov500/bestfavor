import 'package:bestfavor/data/data.dart';
import 'package:flutter/material.dart';
import 'package:bestfavor/widgets/affichage_demande.dart';

class Refus extends StatelessWidget {
  const Refus({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: mesDemandes
            .where((element) => element.accepte == false)
            .map((e) => AffichageDemande(
                  maDemande: e,
                ))
            .toList(),
      ),
    );
  }
}
