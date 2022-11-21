import controlP5.*;

ControlP5 cp5;
PGraphics pg;

int boidNum = 2000;
int nbVisible = 600;
int resolution = 1;
boolean play = true;

Boid[] boidTab = new Boid[boidNum];
FlowField f; 

//noiseWind
float windRatio = 0.45;
float windSize = 0.28;
float windStrenght = 0.7;

float windRatioVal = windRatio;
float windSizeVal = windSize;
float windStrenghtVal = windStrenght;

//color
int h = 35;
int sat = 190;
int val = 220;

int h2 = 165;
int sat2 = 0;
int val2 = 220;

//global
int opa = 60;
int size = 50;
float warpX = 0.80;
float warpY = 0.85;

int opaBack = 12;
int ite = 0;

//boids
float align = 1;
float cohesion = 1;
float sep = 1;


//UI
boolean visible = true;
boolean back = false;
int sliderLength = 200;

void setup() {
  
  //fullScreen();
  size(1920, 1080);
  colorMode(HSB); 
  background(230);
  
  pg = createGraphics(width, height);
  pg.beginDraw();
  pg.background(220);
  pg.endDraw();
  setUi();
  
  f = new FlowField(resolution);
  
  for (int i = 0; i < boidNum; i++) {
    boidTab[i]= new Boid(new PVector(random(width/4, 3 * width/4), random(height/4, 3 * height/4)), i);
  }
}

void draw() {
  if(play) {
    pg.beginDraw();
    if(back) {pg.background(230);}
    //f.update();
    pg.noFill();
    color c = color(h + map(noise((10000 + ite) * 0.01), 0, 1, -20, 20), sat2, val2);
    pg.stroke(c, opa);
    pg.strokeWeight(size);
    pg.beginShape();
    for(int i = 0; i < (int)nbVisible / 2; i++) {
    
      Boid b = boidTab[i];
      /*pg.curveVertex(map(b.getPos().x, 0, width, width - width * warpX, width * warpX), 
          map(b.getPos().y, 0, height, height - height * warpY, height * warpY));*/
          
      /*pg.vertex(map(b.getPos().x, 0, width, width - width * warpX, width * warpX), 
          map(b.getPos().y, 0, height, height - height * warpY, height * warpY));
      pg.line(map(b.getPos().x, 0, width, width - width * warpX, width * warpX), 
          map(b.getPos().y, 0, height, height - height * warpY, height * warpY),
          b.getPos().x, b.getPos().y);*/
          
      b.flock(boidTab);
      b.follow(f);
      b.checkBound();
      b.update();
      b.display(c);
    }
    pg.endShape(CLOSE);
    
    c = color(h + map(noise(ite * 0.01) * noise(ite * 0.04), 0, 1, -35, 35), sat, val);
    pg.stroke(c, opa);
    pg.beginShape();
    for(int i = (int)nbVisible / 2; i < (int)nbVisible; i++) {
    
      Boid b = boidTab[i];
      /*pg.curveVertex(map(b.getPos().x, 0, width, width - width * warpX, width * warpX), 
          map(b.getPos().y, 0, height, height - height * warpY, height * warpY));*/
      /*pg.vertex(map(b.getPos().x, 0, width, width - width * warpX, width * warpX), 
          map(b.getPos().y, 0, height, height - height * warpY, height * warpY));
      pg.line(map(b.getPos().x, 0, width, width - width * warpX, width * warpX), 
          map(b.getPos().y, 0, height, height - height * warpY, height * warpY),
          b.getPos().x, b.getPos().y);*/
          
      b.flock(boidTab);
      b.follow(f);
      b.checkBound();
      b.update();
      b.display(c);
    }
    pg.endShape(CLOSE);
    
    pg.endDraw();
    
    ite++;
    
    pg.endDraw(); 
    image(pg, 0, 0);
    if(!visible) cp5.hide();
    else  cp5.show();
    cp5.draw();
    ite++;
  }
}

void keyPressed() {
  if (key == 's') saveFrame("saveFrame/boidsVis-#####.png");
  if (key == ' ') play = !play;
  if (key == 'u') {
    windRatioVal = windRatio;
    windSizeVal = windSize;
    windStrenghtVal = windStrenght;
    f.update();
  }
  if (key == 'b') back = !back;
  if (key == 'h') visible = !visible;
}
