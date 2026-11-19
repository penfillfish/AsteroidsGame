class Asteroid extends Floater
{
  private double rotSpeed;
  private float maxRad,minRad;
  public Asteroid(){
    corners = 6;
    xCorners = new int[]{-10,-22,14,26,12,-22};
    yCorners = new int[]{0,-16,-16,0,20,16};
    myColor = 144;
    int temp = (int)(Math.random()*4)+1;
    if(temp==1){myCenterX = Math.random()*width;myCenterY = 0;
    }else if(temp==2){myCenterX = width;myCenterY = Math.random()*height;
    }else if(temp==3){myCenterX = Math.random()*width;myCenterY = height;
    }else{myCenterX = 0;myCenterY = Math.random()*height;}
    myXspeed = Math.random()-0.5*(Math.random()*5);
    myYspeed = Math.random()-0.5*(Math.random()*5);
    myPointDirection = Math.random()*360;
    rotSpeed = (Math.random()>0.5)?-1*Math.random()*5:Math.random()*5;
    maxRad = dist(0,0,furthestPoint()[0],furthestPoint()[1]);
    minRad = dist(0,0,closestPoint()[0],closestPoint()[1]);
    accelerate(1);
  }
  public void move(){
    turn(rotSpeed);
    while(myPointDirection>360){myPointDirection-=360;}
    super.move();
    show();
  }
  public boolean collideShip(Spaceship ship){
    for(int i=0;i<ship.getCorners('x').length;i++){
      float distToCenter = distToCenter(ship.getDir(),ship.getPos('x'),ship.getPos('y'),ship.getCorners('x')[i],ship.getCorners('y')[i]);
      if(distToCenter<minRad){
        return true;
      }
    }
    return false;
  }
  public boolean collideBullet(ArrayList<Bullet> bullets){
    for(int j=bullets.size()-1;j>=0;j--){
      Bullet b = bullets.get(j);
      for(int i=0;i<b.getCorners('x').length;i++){
        float distToCenter = distToCenter(b.getDir(),b.getPos('x'),b.getPos('y'),b.getCorners('x')[i],b.getCorners('y')[i]);
        if(distToCenter<maxRad){
          b.die();
          return true;
        }
      }
    }
    return false;
  }
  private float distToCenter(double dir, double x, double y, int xCorner, int yCorner){
    float rotatedCornerX = (float)(xCorner*cos((float)dir)-yCorner*sin((float)dir)+x);
    float rotatedCornerY = (float)(xCorner*cos((float)dir)-yCorner*sin((float)dir)+y);
    return dist((float)myCenterX,(float)myCenterY,rotatedCornerX,rotatedCornerY);
  }
  private int[] furthestPoint(){
    int[] point = {xCorners[0],yCorners[0]}; 
    int maxDist = (int)(dist(0,0,xCorners[0],yCorners[0]));
    for(int i=1;i<xCorners.length;i++){
      if((int)(dist(0,0,xCorners[i],yCorners[i]))>maxDist){
        maxDist = (int)dist(0,0,xCorners[i],yCorners[i]);
        point[0] = xCorners[i];
        point[1] = yCorners[i];
      }
    }
    return point;
  }
  private int[] closestPoint(){
    int[] point = {xCorners[0],yCorners[0]}; 
    int minDist = (int)(dist(0,0,xCorners[0],yCorners[0]));
    for(int i=1;i<xCorners.length;i++){
      if((int)(dist(0,0,xCorners[i],yCorners[i]))<minDist){
        minDist = (int)dist(0,0,xCorners[i],yCorners[i]);
        point[0] = xCorners[i];
        point[1] = yCorners[i];
      }
    }
    return point;
  }
}
