class Star //note that this class does NOT extend Floater
{
  private float myX,myY,mySize,myGrowth;
  private boolean grow;
  private int Color;
  public Star(){
    myX = (int)(Math.random()*1000);
    myY = (int)(Math.random()*1000);
    mySize = (int)(Math.random());
    myGrowth = (float)(Math.random()*0.1)+0.1;
    grow = true;
    Color = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
  }
  public void show(){
    fill(Color);
    if(mySize>=7){grow = false;}
    else if(mySize<=0){
      grow = true;
      if(Math.random()<0.1){
        Color = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
        myGrowth = (float)(Math.random()*2)+0.01;
        myX = (int)(Math.random()*1000);
        myY = (int)(Math.random()*1000);
      }
    }
    if(grow){mySize+=Math.random()*myGrowth;}
    else{mySize-=Math.random()*myGrowth;}
    ellipse(myX,myY,mySize,mySize);
  }
}
