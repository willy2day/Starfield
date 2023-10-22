Phrog [] phrogies= new Phrog[10];
Phrog willy; 


void setup(){
  size(1000,1000);
  for (int i=0;i<phrogies.length; i++){
    phrogies[i]= new Phrog(500,500,1,45);
  }
  phrogies[phrogies.length-1]= new Fly(500,500,10,(Math.random()*100)-100);
  phrogies[phrogies.length-2]= new Fly(500,500,10,(Math.random()*100)-100);

}


void draw(){
  background(255);
  for (int i=0;i<phrogies.length; i++){
    phrogies[i].move();
    phrogies[i].show();}
   
}

void mousepressed(){
  redraw();
}
class Phrog{
  double py,px,pSpeed,pAngle;
  Phrog(double y, double x, double speed, double angle){
  px=x+Math.random()*7;
  py=y+Math.random()*7;
  pSpeed=speed;
  pAngle=(double)(Math.random()*10*angle);
  }
  
  void move(){
    px=px+pSpeed*cos(radians((float)pAngle));
    py=py+pSpeed*sin(radians((float)pAngle));
  
  }
  
  void show(){
  fill(204, 255, 204);
  strokeWeight(0);
  ellipse((float) px, (float) py, 180, 150); // body
  ellipse((float) (px - 45), (float) (py - 55), 50, 50); // left eye socket
  ellipse((float) (px + 45), (float) (py - 55), 50, 50); // right eye socket
  fill(252, 255, 221); // belly
  ellipse((float) px, (float) (py + 20), 110, 110);
  fill(204, 255, 204);
  strokeWeight(0.5);
  arc((float) (px - 35), (float) (py + 70), 30, 40, -20, 200, OPEN); // legs
  arc((float) (px + 35), (float) (py + 70), 30, 40, -20, 200, OPEN);
  noFill();
  strokeWeight(0.5);
  fill(204, 255, 204); // legs
  arc((float) (px + 165 - 200), (float) py, 30, 40, -20, 200, OPEN); // left arm
  arc((float) (px + 235 - 200), (float) py, 30, 40, -20, 200, OPEN); // right arm
  fill(0, 0, 0);
  ellipse((float) (px - 47), (float) (py - 60), 20, 20); // left pupil
  ellipse((float) (px + 47), (float) (py - 60), 20, 20); // right pupil
}
}
class Fly extends Phrog {
  Fly(double y, double x, double speed, double angle) {
    super(y, x, speed, angle); // Call the constructor of the Phrog class to initialize inherited fields

    px += (Math.random() * 50)-25;
    py += (Math.random() * 50)-25;
    pSpeed = speed ;
    pAngle = Math.random()* angle;
  }
  void show(){
  fill(0,0,0);
  ellipse((float) px, (float) py, 50,50);
  }
}
