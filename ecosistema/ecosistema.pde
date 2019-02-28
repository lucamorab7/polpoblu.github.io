/////////////////////////////////////////////////////////////////////////
//Luca Morabito
//Matricola 836162
//Generative Design A.A. 2016/2017, Prof. Anna Scotti
/////////////////////////////////////////////////////////////////////////
//VARIABILI

cellula cell;
int nCell = 10;
boolean effectOn = true;
ArrayList<cellula> cellule;

/////////////////////////////////////////////////////////////////////////
//SETUP: definizione size, colore e creazione dell'array

void setup() {
  size(720, 450);
  smooth();
  colorMode(HSB);
  blendMode(ADD);

  cellule = new ArrayList<cellula>();
  for (int i=0; i<nCell; i++) {
    cell = new cellula();
    cellule.add(cell);
  }
}

/////////////////////////////////////////////////////////////////////////
//DRAW: effetto metaball e comportamento delle cellule

void draw() {
  background(155, 200, 200);
  if (effectOn) {

//Effetto Metaball
    loadPixels();
    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        int index = x + y * width;
        float sum = 0;
        for (cellula cell : cellule) {
          float d = dist(x, y, cell.pos.x, cell.pos.y);
          sum += 150 * cell.r /d;
        }
        if (sum > 150) {
          float anello = map(sum, 255, 100, 0, 200); 
          sum = constrain(sum, 120, 330);
          pixels[index] = color(map(sum, 600, 100, 150, 200), sq(anello), 255);
        }
      }
    }
    updatePixels();
  }

//Comportamento

  for (int i = 0; i < cellule.size(); i++) {
    cellula cell = cellule.get(i);
    cell.update();
    cell.caccia();
    if (!effectOn) { 
      cell.show();
    }
  }
}

/////////////////////////////////////////////////////////////////////////
//MITOSI:  divisione delle cellule al click del mouse
void mousePressed() {
  for (int i = cellule.size()-1; i >= 0; i--) {
    cellula cell = cellule.get(i);
    if (cell.clicked(mouseX, mouseY)) {
      cell.vel = PVector.random2D();
      cell.vel.mult(random(0.1, 2));
      cellule.add(cell.mitosi());
      cell.vel = PVector.random2D();
      cell.vel.mult(random(0.1, 2));
      cellule.add(cell.mitosi());
      cellule.remove(i);
    }
  }
}

/////////////////////////////////////////////////////////////////////////
//TOGGLE: attiva l'effetto se viene premuto il tasto
void keyPressed() {
  if (key == 'w') {
    effectOn = !effectOn;
    cell.show();
  }
}

/////////////////////////////////////////////////////////////////////////