class bol{ // Classe da bola
  
  float x, y; // Posicao da bola
  float xspeed = 5, yspeed = 2.3; //  Velocidade da bola
  
  bol(){ // Definições iniciais
    x = 0;
    y = 0;
  }
  
  void display(){ // Desenha a bola
    stroke(0);
    ellipse(x, y, 28, 28);
  }
  
  void move(){ // Move a bola
    x += xspeed;
    y += yspeed;
  }
  
  void checkb(){ // Checa se bateu em algum lugar
    if (x > width || x < 0){
      xspeed = xspeed * (-1);
    }
    if (y > height || y < 0){
      yspeed = yspeed * (-1);
    }   
  } 
  
  void checkpont(){ // Aumenta a pontuação dos jogadores
    if(x == 0){
     pont1 += 1;
    }
    if(x == width){
     pont2 += 1;
    }
  }
  
}
