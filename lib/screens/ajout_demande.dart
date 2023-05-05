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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Faire une demande"),
      ),
      body: Form(
        key: formKey,
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
                validator: (value) {
                  return value == null ? "Choisissez un ami!" : null;
                },
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
                validator: (value) {
                  return value == "" ? "Ce champ est obligatoire" : null;
                },
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
                validator: (value) {
                  return value == "" ? "Ce champ est obligatoire" : null;
                },
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
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black38,
                  ),
                ),
                child: Text(creneau == null
                    ? "Choisir un crenau"
                    : formatDate(creneau!)),
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
                  if (formKey.currentState!.validate() && creneau != null) {}
                  /*
                  Demande(
                      id: DateTime.now().toString(),
                      motif: motifController.text,
                      nomUtilisateur: ami,
                      description: contenuController.text,
                      dateEnvoi: creneau!);*/
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

String formatDate(DateTime date) {
  //Format  the day
  String res =
      date.day < 2 ? "0" + date.day.toString() : date.day.toString() + " ";

  //Format the month
  switch (date.month) {
    case 1:
      res += "Jan";
      break;
    case 2:
      res += "fev";
      break;
    case 3:
      res += "Mar";
      break;
    case 4:
      res += "Avr";
      break;
    case 5:
      res += "Mai";
      break;
    case 6:
      res += "Juin";
      break;
    case 7:
      res += "Juil";
      break;
    case 8:
      res += "Aou";
      break;
    case 9:
      res += "Sep";
      break;
    case 10:
      res += "Oct";
      break;
    case 11:
      res += "Nov";
      break;
    case 12:
      res += "Dec";
      break;
    default:
      res += " ";
      break;
  }

  //Format the year
  res += " " + date.year.toString();

  return res;
}
