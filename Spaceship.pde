class Spaceship extends Floater
{
  private float friction;
  public Spaceship(){
    friction = 0.99;
    corners = 4;
    myCenterX = width/2;
    myCenterY = height/2;
    xCorners = new int[]{-8,16,-8,-2};
    yCorners = new int[]{-8,0,8,0};
    myColor = 255;
  }
  public void move(){
    if(direction[0]) super.accelerate(0.2);
    if(direction[1]) super.turn(-5);
    if(direction[3]) super.turn(5);
    myXspeed *= friction;
    myYspeed *= friction;
    super.move();
    super.show();
  }
  public void hyperspace(){
    myXspeed = 0;
    myYspeed = 0;
    double[] Old = {myCenterX, myCenterY};
    myCenterX = Math.random()*width;
    myCenterY = Math.random()*height;
    double[] New = {myCenterX, myCenterY};
    turn(Math.random()*360);
    for(int i=1;i<=4;i++){
      line((float)(Old[0]),(float)(Old[1]),(float)(New[0]),(float)(New[1]));
    }
  }
}
