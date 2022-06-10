class bol{
  
  float x;
  float y;
  
  bol(){
    x = width/2;
    y = height;
  }
  
  void display(){
    stroke(0);
    fill(127);
    ellipse(x,y, 64,64);
  }
}
