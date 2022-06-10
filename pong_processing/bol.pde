class bol{
  
  float x, y;
  float xspeed = 5, yspeed = 2.3;
  
  bol(){
    x = 0;
    y = 0;
  }
  
  void display(){
    stroke(0);
    ellipse(x, y, 28, 28);
  }
  
  void move(){
    x = x + xspeed;
    y = y + yspeed;
  }
  
  void checkp(){
    
    if (x > width || x < 0){
      xspeed = xspeed * (-1);
    }
    if (y > height || y < 0){
      yspeed = yspeed * (-1);
    }
      
  } 
  
}
