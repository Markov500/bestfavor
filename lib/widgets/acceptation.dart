import 'package:flutter/material.dart';
import 'package:bestfavor/data/data.dart';
import 'package:bestfavor/widgets/affichage_demande.dart';

class Acceptation extends StatelessWidget {
  const Acceptation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: mesDemandes
            .where((element) => element.accepte == 2)
            .map((e) => AffichageDemande(
                  maDemande: e,
                ))
            .toList(),
      ),
    );
  }
}
