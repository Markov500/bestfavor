import 'package:bestfavor/data/data.dart';
import 'package:bestfavor/models/demande.dart';
import 'package:bestfavor/widgets/affichage_demande.dart';
import 'package:flutter/material.dart';

class DemandePage extends StatefulWidget {
  const DemandePage({super.key});

  @override
  State<DemandePage> createState() => _DemandePageState();
}

class _DemandePageState extends State<DemandePage> {
  accepterDemande(Demande demande) {
    setState(() {
      demande.accepte = 2;
    });
  }

  refuserDemande(Demande demande) {
    setState(() {
      demande.accepte = 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: mesDemandes
            .where((element) => element.accepte == 1)
            .map((e) => AffichageDemande(
                  maDemande: e,
                  accepter: accepterDemande,
                  refuser: refuserDemande,
                ))
            .toList(),
      ),
    );
  }
}
