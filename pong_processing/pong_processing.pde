float p1 = 0, p2 = 0;
float x = 0, y = 0;
int pont1 = 0, pont2 = 0;
int v_b = 8; //Velocidade das barras
bol b;

void setup(){
  size(1080,720); //Tamanho da tela
  b = new bol();
}

void draw(){
  dinamico();
}

void keyPressed() { //Barras não sincronizadas devido a essa função so pegar uma tecla por vez
    if (keyCode == UP && p1 > 0) {
      p1 -= v_b;
    } else if (keyCode == DOWN && p1 < (height - 200)) {
      p1 += v_b;
    }
    
     if(key == 'w' && p2 > 0){
      p2 -= v_b;
    } else if(key == 's' && p2 < (height - 200)){
      p2 += v_b;
    }
}

void meio(){
  for (int i = 5; i < 686; i = i + 20) {
    rect(540, i, 2, 35);
    i += 20;
  }
}

void dinamico(){
  background(180,0,0); // Cor do fundo
  meio();
  
  textSize(100);
  text(pont1, 270, 100);
  text(pont2, 810, 100);
  
  rect(6, p1, 14, 200, 28); 
  rect((width - 16 - 6), p2, 14, 200, 28);
  
  b.display();
  b.move();
  b.checkb();
  b.checkpont();
}
