import 'package:flutter/cupertino.dart';

class Cella extends StatefulWidget {
  final int contenutoIniziale;
  final Color coloreIniziale;

  const Cella({required this.contenutoIniziale, required this.coloreIniziale,super.key});
  @override
  State<Cella> createState() => _CellaState();
}

class _CellaState extends State<Cella> {
  late int contenuto;
  late Color colore;

  @override
  void initState(){
    super.initState();
    contenuto = widget.contenutoIniziale;
    colore = widget.coloreIniziale;

  }


  // Metodo per aggiornare la cella
  void aggiornaCella(int nuovoContenuto, Color nuovoColore) {
    setState(() {
      contenuto = nuovoContenuto;
      colore = nuovoColore;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
