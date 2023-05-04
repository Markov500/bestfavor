import 'package:bestfavor/models/demande.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AjoutDemande extends StatefulWidget {
  const AjoutDemande({super.key});

  @override
  State<AjoutDemande> createState() => _AjoutDemandeState();
}

class _AjoutDemandeState extends State<AjoutDemande> {
  List<String> lesUtilisateurs = ["Jean", "Luc", "Jacques"];

  String ami = "";
  TextEditingController motifController = TextEditingController();
  TextEditingController contenuController = TextEditingController();
  DateTime? creneau;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Faire une demande"),
      ),
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //
            //La liste déroulante//*************************** *
            ///
            Container(
              margin: EdgeInsets.all(10),
              child: DropdownButtonFormField<String>(
                onChanged: (String? newValue) {
                  setState(() {
                    if (newValue != null) {
                      setState(() {
                        ami = newValue;
                      });
                    }
                  });
                },
                items: lesUtilisateurs.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Choisir votre ami',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            //++++Champ pour le modif++++++
            //***************************** */
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Taper le motif',
                ),
              ),
            ),

            //*************************** */
            //++++Champ pour la description++++++
            //***************************** */
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                maxLines: 8,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Taper le contenu',
                ),
              ),
            ),

            //*************************** */
            //++++Champ pour le crénau++++++
            //***************************** */

            GestureDetector(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 15, top: 20, bottom: 20),
                margin: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: Text("Choisir un crenau"),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.black38,
                )),
              ),
              onTap: () {
                showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2030, 9, 7, 17))
                    .then((value) {
                  setState(() {
                    creneau = value;
                  });
                });
              },
            ),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  Demande(
                      id: DateTime.now().toString(),
                      motif: motifController.text,
                      nomUtilisateur: ami,
                      description: contenuController.text,
                      dateEnvoi: creneau!);
                },
                child: Text("Valider"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
