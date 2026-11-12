class Bullet extends Floater
{
  public Bullet(Spaceship s){
    corners = 4;
    xCorners = new int[]{-4,4,4,-4};
    yCorners = new int[]{2,2,-2,-2};
    myColor = 255;
    myCenterX = s.getPos('x');
    myCenterY = s.getPos('y');
    myPointDirection = s.getDir();
    myXspeed = s.getSpeed('x');
    myYspeed = s.getSpeed('y');
    accelerate(20);
  }
  public void fire(){
    myCenterX += myXspeed;
    myCenterY += myYspeed;
    super.show();
  } 
  public boolean isOutOfBounds(){
    return myCenterX<0||myCenterY<0||myCenterX>width||myCenterY>height;
  }
}
