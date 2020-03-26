class Gegner{
  float r, x, y, ySpeed;
  int erfolgloseAttacke=0;
  
  Gegner(){
    setzen();
  }
  
  void anzeigen(){
    stroke(255);
    fill(255,0,0);
    ellipse(x,y,2*r,2*r);
  }
  
  void attackieren(){
    erfolgloseAttacke=0;
    y=y+ySpeed;
    x=x+random(-2,2);
    if(y>800+10){
      setzen();
    }
  }
  
  int punktestand(){
    return erfolgloseAttacke;
    
  }
  
  void setzen(){
    x=random(width);
    y=-random(height);
    ySpeed=random(2,7);
    r=2;
    erfolgloseAttacke=1;
  }
}
