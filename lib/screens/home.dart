import 'package:bestfavor/screens/ajout_demande.dart';
import 'package:bestfavor/widgets/acceptation.dart';
import 'package:bestfavor/widgets/demandePage.dart';
import 'package:bestfavor/widgets/refus.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    DemandePage demandePage = DemandePage();
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            bottom: const TabBar(tabs: [
              Tab(
                child: Text("Demande"),
              ),
              Tab(
                child: Text("Acceptation"),
              ),
              Tab(
                child: Text("Refus"),
              ),
            ]),
            title: Text(
              "Best favor",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: TabBarView(
            children: [demandePage, Acceptation(), Refus()],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AjoutDemande()))
                  .then((value) {
                setState(() {
                  demandePage = DemandePage();
                });
              });
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        ));
  }
}
