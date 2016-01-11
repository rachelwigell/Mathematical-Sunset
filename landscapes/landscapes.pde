float time = 0;
float sunX = random(200, 1000);
Branch tree;
Star[] stars;

public void setup(){
  size(1200, 700, P2D);
  frameRate(10);
  tree = new Branch();
  stars = new Star[500];
  for(int i = 0; i < 500; i++){
    stars[i] = new Star();
  }
}

public void draw(){
  background(255);
  drawSky();
  drawStars(stars);
  drawSun();
  drawTree(tree);
  time += .005;
}

public void drawSky(){
  /* the following color points were taken from a photo of a sunset
  20, 40, 60
  30, 60, 90
  150, 160, 180
  250, 190, 150
  250, 180, 110
  250, 170, 90
  230, 110, 50
  180, 70, 30
  90, 30, 20
  the equations used for r,g,b below were found using a cubic regression
  to fit the data to the x values 0, 5, 20, 30, 45, 50, 55, 60, 65*/
  strokeWeight(2);
  for(int i = 0; i < 325; i++){
    float r = -.003895*pow(i/5.0, 3)+.22076*pow(i/5.0, 2)+3.3674*i/5.0+16.2112;
    float g = -.001146*pow(i/5.0, 3)-.044437*pow(i/5.0, 2)+7.551*i/5.0+33.285;
    float b = .00222*pow(i/5.0, 3)-.3445*pow(i/5.0, 2)+12.422*i/5.0+50.1203;
    stroke(.002*time*pow(r, 2) + r*(1-time), .0028*time*pow(g, 2) + g*(1-time), .0025*time*pow(b, 2) + b*(1-.7*time));
    line(0, i*2+1, 1200, i*2+1);
  }
}

public void drawSun(){
  noStroke();
  fill(255-time*50, 250-time*140, 230-time*160);
  ellipse(sunX, 500+time*160, 200, 200);
  fill(0);
  rect(0, 650, 1200, 50); 
}

public void drawTree(Branch plant){
  fill(0);
  stroke(0);
  strokeWeight(1);
  if(abs(plant.path.end.y - plant.path.start.y) > abs(plant.path.end.x - plant.path.start.x)){
    beginShape();
    vertex(plant.path.end.x+plant.path.length/120, plant.path.end.y);
    vertex(plant.path.end.x-plant.path.length/120, plant.path.end.y);
    vertex(plant.path.start.x-plant.path.length/32, plant.path.start.y);
    vertex(plant.path.start.x+plant.path.length/32, plant.path.start.y);
    endShape(CLOSE);
  }
  else{
    beginShape();
    vertex(plant.path.end.x, plant.path.end.y+plant.path.length/120);
    vertex(plant.path.end.x, plant.path.end.y-plant.path.length/120);
    vertex(plant.path.start.x, plant.path.start.y-plant.path.length/32);
    vertex(plant.path.start.x, plant.path.start.y+plant.path.length/32);
    endShape(CLOSE);
  }
  if(plant.level < plant.endLevel){
    for(int i = 0; i < plant.numBranches; i++){
      Branch b = (Branch) plant.branches[i];
      drawTree(b);
    }
  }
}

public void drawStars(Star[] stars){
  noStroke();
  pushMatrix();
  translate(600, 650);
  rotate(time/10);
  for(int i = 0; i < stars.length; i++){
    Star star = stars[i];
    fill(255, 100*pow(time*6, 2)/screenY(star.position.x, star.position.y));
    ellipse(star.position.x, star.position.y, star.size, star.size);
  }
  popMatrix();
}