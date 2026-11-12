boolean[] direction = {false,false,false,false,false};
Spaceship ship;
ArrayList<Star> stars;
public void setup() 
{
  size(1000,1000);
  ship = new Spaceship();
  stars = new ArrayList<Star>();
  for(int i=0;i<200;i++){stars.add(new Star());}
}

public void draw() 
{
  background(0);
  for(int i=stars.size()-1;i>0;i--){stars.get(i).show();}
  ship.move();
}

public void keyPressed(){
  if(key=='w'||keyCode == UP) direction[0]=true;
  if(key=='a'||keyCode == LEFT) direction[1]=true;
  if(key=='s'||keyCode == DOWN) direction[2]=true;
  if(key=='d'||keyCode == RIGHT) direction[3]=true;
  if(key==' ') direction[4]=true;
  if(key=='r') ship.hyperspace();
}

public void mousePressed(){if(direction[4]!=true)direction[4]=true;}

public void mouseReleased(){if(direction[4]!=false)direction[4]=false;}

public void keyReleased(){
  if(key=='w'||keyCode == UP) direction[0]=false;
  if(key=='a'||keyCode == LEFT) direction[1]=false;
  if(key=='s'||keyCode == DOWN) direction[2]=false;
  if(key=='d'||keyCode == RIGHT) direction[3]=false;
  if(key==' ') direction[4]=true;
}
