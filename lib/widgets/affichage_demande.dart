import 'package:bestfavor/models/demande.dart';
import 'package:flutter/material.dart';

class AffichageDemande extends StatelessWidget {
  final Demande maDemande;
  final accepter;
  final refuser;

  const AffichageDemande(
      {super.key, required this.maDemande, this.accepter, this.refuser});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        ListTile(
          leading: FlutterLogo(size: 56.0),
          title: Text(maDemande.motif),
          subtitle: Text(maDemande.description),
        ),
        Divider(
          color: Colors.grey,
        ),
        maDemande.accepte == 1
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        accepter(maDemande);
                      },
                      child: Text("Accepter")),
                  Padding(padding: EdgeInsets.all(10)),
                  ElevatedButton(
                      onPressed: () {
                        refuser(maDemande);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      child: Text("Refuser")),
                  Padding(padding: EdgeInsets.all(10)),
                ],
              )
            : Padding(padding: EdgeInsets.all(0))
      ],
    ));
  }
}
