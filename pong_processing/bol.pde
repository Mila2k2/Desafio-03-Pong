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
    x += xspeed;
    y += yspeed;
  }
  
  void checkb(){
    if (x > width || x < 0){
      xspeed = xspeed * (-1);
    }
    if (y > height || y < 0){
      yspeed = yspeed * (-1);
    }   
  } 
  
  void checkpont(){
    if(x == 0){
     pont1 += 1;
    }
    if(x == width){
     pont2 += 1;
    }
  }
  
}
