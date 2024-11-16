import 'package:flutter/material.dart';

class Griglia extends StatefulWidget {
  final int righe = 5;
  final int colonne = 5;

  const Griglia({super.key});

  @override
  State<Griglia> createState() => _GrigliaState();
}

class _GrigliaState extends State<Griglia> {
  // Stato della griglia
  late List<List<int>> statoGriglia;

  // Posizione attuale del giocatore
  late int posizioneGiocatoreRiga;
  late int posizioneGiocatoreColonna;

  @override
  void initState() {
    super.initState();

    // Inizializza la griglia come matrice vuota
    statoGriglia = List.generate(
      widget.righe,
          (_) => List.generate(widget.colonne, (_) => 0),
    );

    // Posizione iniziale del giocatore
    posizioneGiocatoreRiga = 4;
    posizioneGiocatoreColonna = 2;
    statoGriglia[posizioneGiocatoreRiga][posizioneGiocatoreColonna] = -1; // Giocatore
  }

  // Aggiorna lo stato della cella
  void aggiornaCella(int nuovaRiga, int nuovaColonna) {
    // Controlla se la cella è adiacente e non ha valore 1
    if (isMossaValida(nuovaRiga, nuovaColonna)) {
      setState(() {
        // La cella attuale diventa esplorata (1)
        statoGriglia[posizioneGiocatoreRiga][posizioneGiocatoreColonna] = 1;

        // Aggiorna la posizione del giocatore
        posizioneGiocatoreRiga = nuovaRiga;
        posizioneGiocatoreColonna = nuovaColonna;

        // La nuova cella diventa il giocatore (-1)
        statoGriglia[nuovaRiga][nuovaColonna] = -1;

        // Controlla se ci sono celle disponibili
        if (!ciSonoMosseDisponibili()) {
          print("Game Over");
        }
      });
    }
  }

  // Controlla se una mossa è valida
  bool isMossaValida(int nuovaRiga, int nuovaColonna) {
    // Calcola la differenza tra le coordinate attuali e quelle nuove
    int deltaRiga = (nuovaRiga - posizioneGiocatoreRiga).abs();
    int deltaColonna = (nuovaColonna - posizioneGiocatoreColonna).abs();

    // Verifica se la cella è adiacente e non ha valore 1
    return (deltaRiga + deltaColonna == 1) && statoGriglia[nuovaRiga][nuovaColonna] != 1 && statoGriglia[nuovaRiga][nuovaColonna] != -1 ;
  }

  // Controlla se ci sono mosse disponibili
  bool ciSonoMosseDisponibili() {
    // Controlla le celle sopra, sotto, a sinistra e a destra
    List<List<int>> direzioni = [
      [-1, 0], // Sopra
      [1, 0], // Sotto
      [0, -1], // Sinistra
      [0, 1], // Destra
    ];

    for (var direzione in direzioni) {
      int nuovaRiga = posizioneGiocatoreRiga + direzione[0];
      int nuovaColonna = posizioneGiocatoreColonna + direzione[1];

      // Controlla se la cella è all'interno dei limiti della griglia ed è valida
      if (nuovaRiga >= 0 &&
          nuovaRiga < widget.righe &&
          nuovaColonna >= 0 &&
          nuovaColonna < widget.colonne &&
          statoGriglia[nuovaRiga][nuovaColonna] != 1 && statoGriglia[nuovaRiga][nuovaColonna] != -1 ) {
        return true; // C'è almeno una mossa valida
      }
    }

    return false; // Nessuna mossa disponibile
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.colonne,
      ),
      itemCount: widget.righe * widget.colonne,
      itemBuilder: (context, index) {
        int riga = index ~/ widget.colonne;
        int colonna = index % widget.colonne;

        return GestureDetector(
          onTap: () => aggiornaCella(riga, colonna),
          child: Container(
            margin: const EdgeInsets.all(2),
            color: statoGriglia[riga][colonna] == -1
                ? Colors.green // Posizione del giocatore
                : statoGriglia[riga][colonna] == 1
                ? Colors.blueGrey // Celle esplorate
                : Colors.blue[50], // Celle non esplorate
            child: Center(
              child: Text('${statoGriglia[riga][colonna]}',textDirection: TextDirection.ltr,),
            ),
          ),
        );
      },
    );
  }
}
