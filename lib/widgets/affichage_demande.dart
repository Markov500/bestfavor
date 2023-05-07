import 'package:bestfavor/models/demande.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AffichageDemande extends StatelessWidget {
  final Demande maDemande;

  const AffichageDemande({super.key, required this.maDemande});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: FlutterLogo(size: 56.0),
        title: Text(maDemande.motif),
        subtitle: Text(maDemande.description),
        trailing: Icon(Icons.more_vert),
      ),
    );
  }
}
