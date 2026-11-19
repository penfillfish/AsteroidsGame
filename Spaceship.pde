class Spaceship extends Floater
{
  private float friction;
  private int maxhp,hp;
  public Spaceship(){
    friction = 0.98;
    corners = 4;
    myCenterX = width/2;
    myCenterY = height/2;
    xCorners = new int[]{-8,16,-8,-2};
    yCorners = new int[]{-8,0,8,0};
    myColor = 255;
    maxhp = 10;
    hp = maxhp;
  }
  public void move(){
    if(direction[0]) super.accelerate(0.3);
    if(direction[1]) super.turn(-5);
    if(direction[3]) super.turn(5);
    myXspeed *= friction;
    myYspeed *= friction;
    super.move();
    show();
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
  public void show(){
    super.show();
    fill(255,0,0);
    rect((float)myCenterX-25,(float)myCenterY-30,50,10);
    if(hp>=0){
      fill(0,255,0);
      rect((float)myCenterX-25,(float)myCenterY-30,50*max(0,(float)hp/maxhp),10);
    }
  }
  public void damage(){
    hp -= 1;
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
   public double getSpeed(char n){
    if(n=='x')return myXspeed;
    else if(n=='y')return myYspeed;
    else return 0;
  }
  public void setSpeed(char n,double v){
    if(n=='x')myXspeed = v;
    else if(n=='y')myYspeed = v;
  }
  public int getHp(){
    return hp;
  }
  public void setHp(int v){
    hp = v;
  }
}
