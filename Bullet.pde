class Bullet extends Floater
{
  private boolean dead;
  public Bullet(Spaceship s){
    dead = false;
    corners = 4;
    xCorners = new int[]{-4,4,4,-4};
    yCorners = new int[]{2,2,-2,-2};
    myColor = 255;
    myCenterX = s.getPos('x');
    myCenterY = s.getPos('y');
    myXspeed = s.getSpeed('x');
    myYspeed = s.getSpeed('y');
    myPointDirection = s.getDir();
    accelerate(12);
  }
  public void fire(){
    myCenterX += myXspeed;
    myCenterY += myYspeed;
    super.show();
  } 
  public void die(){
    dead = true;
  }
  public boolean isOutOfBounds(){
    return myCenterX<0||myCenterY<0||myCenterX>width||myCenterY>height||dead;
  }
  public double getPos(char n){
    if(n=='x')return myCenterX;
    else if(n=='y')return myCenterY;
    else return 0;
  }
  public void setPos(char n,double v){
    if(n=='x')myCenterX = v;
    else if(n=='y')myCenterY = v;
  }
  public int[] getCorners(char n){
    if(n=='x')return xCorners;
    else if(n=='y')return yCorners;
    else return null;
  }
  public void setCorners(char n,int p, int v){
    if(n=='x')xCorners[p] = v;
    else if(n=='y')yCorners[p] = v;
  }
  public double getDir(){
    return myPointDirection;
  }
  public void setDir(double v){
    myPointDirection = v;
  }
}
