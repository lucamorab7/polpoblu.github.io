/////////////////////////////////////////////////////////////////////////
//CLASSE CELLULA: definizione classe e metodi
class cellula {
  PVector pos;
  PVector vel;
  float r;

  cellula(PVector pos, PVector vel, float r) {
    this.pos = pos.copy();
    this.r = r;
    this.vel = vel;
  }

  cellula() {
    pos  = new PVector(random(width), random(height));
    r = 20;
    this.vel = PVector.random2D();
    this.vel.mult(random(0.1, 2));
  }

//UPDATE: impedisce alle cellule di uscire dla canvas
  void update() {
    this.pos.add(vel);
    if (pos.x > width || pos.x<0) {
      vel.x *= -1;
    }
    if (pos.y > height || pos.y < 0) {
      vel.y *= -1;
    }
  }

//SHOW: definisce gli ellissi
  void show() {
    fill(255, 255, 255);
    noStroke();
    ellipse(pos.x, pos.y, r*2, r*2);
  }

//CLICKED: controlla se il click avviene all'interno dell'ellisse
  boolean clicked(int x, int y) {
    float d = dist(this.pos.x, this.pos.y, x, y);
    if (d < r) {
      return true;
    } else {
      return false;
    }
  }

//CACCIA: caccia e assorbimento delle cellule più piccole
  void caccia() {   
    for (int i = 0; i < cellule.size(); i++) {
      cellula cell = cellule.get(i);
      if (this.r > cell.r && this.pos.dist(cell.pos) <= 100) {
        PVector target = PVector.sub(cell.pos, this.pos);
        target.normalize();
        float mag = this.vel.mag();
        target.mult(mag*0.7);
        this.pos.add(target);
        //this.show(); //se attivo, mostra quando le cellule sono in modalità "caccia"
        if (this.pos.dist(cell.pos) < this.r) {
          if(cell.r > 0){
            cell.r --;
          }
            else { cellule.remove(cellule.indexOf(cell));
            }
          this.r += 1;
        }
      }
    }
  }

//MITOSI: crea una nuova cellula di metà raggio
  cellula mitosi() {
    cellula cell = new cellula(pos, vel, r*0.5);
    return cell;
  }
}

/////////////////////////////////////////////////////////////////////////