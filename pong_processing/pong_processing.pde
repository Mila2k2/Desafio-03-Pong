float p1 = 0, p2 = 0;
float x = 0, y = 0;
int pont1 = 0, pont2 = 0;
int v_b = 8;

void setup(){
  size(1080,720); //Tamanho da tela
}

void draw(){
  background(180,0,0); // Cor do fundo
  
  //ellipse(x, y, 30, 30);
  meio();
  textSize(100);
  text(pont1, 270, 100);
  text(pont2, 810, 100);
  
  rect(6, p1, 14, 200, 28);
  rect(1058, p2, 14, 200, 28);
}

void keyPressed() { //Barras não sincronizadas devido a essa função so pegar uma tecla por vez
    if (keyCode == UP && p1 > 0) {
      p1 = p1 - v_b;
    } else if (keyCode == DOWN && p1 < (height - 204)) {
      p1 = p1 + v_b;
    }
    
     if(key == 'w' && p2 > 0){
       p2 = p2 - v_b;
    } else if(key == 's' && p2 < (height - 204)){
      p2 = p2 + v_b;
    }
}

void meio(){
  for (int i = 5; i < 686; i = i + 20) {
    rect(540, i, 2, 35);
    i = i + 20;
  }
}