boolean[] direction = {false,false,false,false,false};
Spaceship ship;
ArrayList<Star> stars;
ArrayList<Bullet> bullets;
ArrayList<Asteroid> asteroids;
int gameStatus = 1; //2: Win!; 1: Game in Progress; 0: GameOver
public void setup() 
{
  size(1000,1000);
  ship = new Spaceship();
  stars = new ArrayList<Star>();
  bullets = new ArrayList<Bullet>();
  asteroids = new ArrayList<Asteroid>();
  for(int i=0;i<200;i++){stars.add(new Star());}
  for(int i=0;i<50;i++){asteroids.add(new Asteroid());}
}

public void draw() 
{
  if(ship.getHp()<=0){gameStatus = 0;}
  if(asteroids.size()<=0){gameStatus = 2;}
  if(gameStatus == 1){
    background(0);
    ship.move();
    if(direction[4])bullets.add(new Bullet(ship));
    for(int i=bullets.size()-1;i>=0;i--){
      if(bullets.get(i).isOutOfBounds()){
        bullets.remove(i);
      } else{
        bullets.get(i).fire();
      }
    }
    for(int i=stars.size()-1;i>=0;i--){stars.get(i).show();}
    for(int i=asteroids.size()-1;i>=0;i--){
      Asteroid a = asteroids.get(i);
      if(a.collideShip(ship)){
        ship.setHp(ship.getHp()-1);
        asteroids.remove(i);
      }else if(a.collideBullet(bullets)){
        asteroids.remove(i);
      }else{
        a.move();
      }
    }
  }else if(gameStatus == 0){
    ship.show();
    fill(255,0,0);
    textSize(128);
    textAlign(CENTER,CENTER);
    text("Game Over",width/2,height/2);
    noLoop();
  }else if(gameStatus == 2){
    ship.show();
    fill(0,255,0);
    textSize(128);
    textAlign(CENTER,CENTER);
    text("You Win!",width/2,height/2);
    noLoop();
  }
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
  if(key==' ') direction[4]=false;
}
