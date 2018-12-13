int predSize = 500;
int preySize = 500;

class Predator{
  int x;
  int y;
  int health;
  int nbs;
  int isDead;
  
  Predator(){
    x = (int)random(width);
    y = (int)random(height);
    health = (int)random(500, 1000);
  }
  
  Predator(int nx, int ny){
    x = nx;
    y = ny;
    health = (int)random(500, 1000);
  }
  
  void move(){
    switch((int)random(0,4)){
      case 0: y++; if(y > height) y=0; break;
      case 1: y--; if(y < 0) y=height; break;
      case 2: x++; if(x > width) x=0; break;
      case 3: x--; if(x < 0) x=width; break;
    }
  }
  
  void health(){
    health--;
    
    if(health <= 0)
      isDead = 1;
  }
  
  void eat(int boost, int x, int y, int idx){
    health += boost;
    prey.remove(idx);
    preds.add(new Predator(x, y));
  }
}

class Prey{
  int x;
  int y;
  int health;
  int nbs;
  int hpAux;
  int isPregnant;
  int PregCont;
  int isDead;
  
  Prey(){
    x = (int)random(width);
    y = (int)random(height);
    health = (int)random(350, 500);
    hpAux = 0;
    PregCont = 0;
    isDead = 0;
  }
  
  Prey(int nx, int ny){
    x = nx;
    y = ny;
    health = (int)random(350, 500);
    hpAux = 0;
    PregCont = 0;
    isDead = 0;
  }
  
  void health(){
    hpAux++;
    
    if(hpAux > health){
      hpAux = 0;
      isPregnant = 1;
      PregCont++;
      
      if(PregCont > 2)
        isDead = 1;
    }
  }
  
  void haveBaby(){
    isPregnant = 0;
    prey.add(new Prey(x++, y--)); //Random Location to alter
  }
  
  void move(){
    switch((int)random(0,4)){
      case 0: y++; if(y > height) y=0; break;
      case 1: y--; if(y < 0) y=height; break;
      case 2: x++; if(x > width) x=0; break;
      case 3: x--; if(x < 0) x=width; break;
    }
  }
}

ArrayList<Predator> preds = new ArrayList<Predator>();
ArrayList<Prey> prey = new ArrayList<Prey>();

void setup(){
  background(0);
  size(800, 600);
  Fill();
}

void draw(){
  background(0);
  
  for(int idx = 0; idx < 1; idx++){
  MovePredators(); //Move
  MovePreys();
  
  HealthPredator(); //Health Change
  HealthPrey();
  
  PredEat(); //Eat //Life and Death
  BabyPrey();
  
  PredDead();
  PreyDead();
  }
}

void MovePredators(){
  for(Predator pred : preds){
    pred.move();
    set(pred.x, pred.y, color(255, 0, 0));
  }
}

void MovePreys(){
  for(Prey pr : prey){
    pr.move();
    set(pr.x, pr.y, color(0, 255, 0));
  }
}

void HealthPredator(){
  for(Predator pred : preds){
    pred.health();
  }
}

void HealthPrey(){
  for(Prey pr : prey){
    pr.health();
  }
}

void PredEat(){
  int cntPred = preds.size();
  int cntPrey = prey.size();
  
  int x;
  int y;
  
  Predator pred;
  Prey pr;
  
  for(int i = 0; i < cntPred; i++){
    pred = preds.get(i);
    x = pred.x;
    y = pred.y;
    
     for(int j = 0; j < cntPrey; j++){
       pr = prey.get(j);
       
       if(CheckAdjacent(pr.x, pr.y, x, y) == 1){
         pred.eat(pr.hpAux, pr.x, pr.y, j);
         cntPrey--;
       }
     }
  }
}

int CheckAdjacent(int prX, int prY, int X, int Y){
  if(prX >= X-1 && prX <= X+1){
    if(prY >= Y-1 && prY <= Y-1)
      return 1;
    else
      return 0;
  }
  else
    return 0;
  
}

void PredDead(){
  int cnt = preds.size();
  
  for(int idx = 0; idx < cnt; idx++){
    if(preds.get(idx).isDead == 1){
      cnt--;
      preds.remove(idx);
    }
  }
}

void PreyDead(){
  int cnt = prey.size();
  
  for(int idx = 0; idx < cnt; idx++){
    if(prey.get(idx).isDead == 1){
      cnt--;
      prey.remove(idx);
    }
  }
}

void BabyPrey(){
  int cnt = prey.size();
  
  for(int idx = 0; idx < cnt; idx++){
    if(prey.get(idx).isPregnant == 1)
      prey.get(idx).haveBaby();
  }
}

void Fill(){
  for(int idx = 0; idx < predSize; idx++){
    preds.add(new Predator());
    set(preds.get(idx).x, preds.get(idx).y, color(255, 0, 0));
  }
  
  for(int idx = 0; idx < preySize; idx++){
    prey.add(new Prey());
    set(prey.get(idx).x, prey.get(idx).y, color(255, 0, 0));
  }
}
