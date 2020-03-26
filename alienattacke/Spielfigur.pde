class Spielfigur{
  float x=width/2;
  float y=height*0.8;
  float r=20;
  
  Spielfigur(){
  }
  
  void anzeigen(){
    stroke(255);
    fill(125);
    ellipse(x,y,2*r,2*r);
  }
  
  void bewegen(){
    if(keyPressed){
      if (keyCode==LEFT){
        if(x>0){x=x-5;}
      }
      if (keyCode==RIGHT){
        if(width>x){x=x+5;}
      }
    }
  }
  
  boolean kollision(Gegner geg) {
    float d = dist(x, y, geg.x, geg.y);
    if(d<=(r+geg.r)/2){
      return true;
    }else{
      return false;
    }
  }
  
}
