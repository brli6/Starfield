Particle [] bob;
void setup()
{
  size(500,500);
  bob = new Particle[500];
  for(int i = 0; i < bob.length; i++)
  {
    bob[i] = new NormalParticle();
  }  
    bob[3] = new OddballParticle();
    bob[1] = new JumboParticle();
}
void draw()
{
  background(0);
  for(int i = 0; i < bob.length; i++)
  {
    bob[i].show();
    bob[i].move();
  }
}

class NormalParticle implements Particle
{
  double myX, myY;
  double mySpeed, myAngle;
  //int myColor;
  NormalParticle()
  {
    myX = 250;
    myY = 250;
    mySpeed = (double)(Math.random()*5);
    myAngle = (double)(Math.random()*2)*Math.PI;
  }

public void move()
{
  myX=(Math.cos(myAngle)*mySpeed)+myX;
  myY=(Math.sin(myAngle)*mySpeed)+myY;
}
public void show()
{
  fill((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
  stroke(255);
  ellipse((float)myX,(float)myY,10,10);
}
}
interface Particle
{
  public void show();
  public void move();
}

class OddballParticle implements Particle
{
  int myX, myY;
  OddballParticle()
  {
    myX = myY = 0;
  }

public void move()
{
  myX=myX + ((int)(Math.random()*5));
  myY=myY + ((int)(Math.random()*5));
}
public void show()
{
  fill(255,20,147);
  rect(myX,myY,20,20);
}
}
class JumboParticle extends NormalParticle
{
  public void show()
  {
    fill(102,255,178);
    ellipse((float)myX,(float)myY,60,60);
  }
}