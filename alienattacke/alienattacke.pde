Spielfigur sf;
Gegner[] geg = new Gegner[50];
int punkte=0;

void setup() {
  size(1200, 800);
  sf = new Spielfigur();
  for (int i = 0; i<geg.length; i++) {
    geg[i]=new Gegner();
  }
  textSize(40);
}

void draw() {
  background(0);
  sf.anzeigen();
  sf.bewegen();
  for (int i = 0; i<geg.length; i++) {
    geg[i].anzeigen();
    geg[i].attackieren();
    for (int j=i+1; j<geg.length; j++) {
      if (sf.kollision(geg[j])==true) {
        noLoop();
      }
    }
    punkte = punkte + geg[i].punktestand();
    text(punkte,50,100);
  }
}
