float p1 = 0;
float p2 = 0;

void setup(){
  size(1080,720); //Tamanho da tela
}

void draw(){
  background(180,0,0); // Cor do fundo
  
  rect(10, p1, 18, 220, 28);
  rect(1052, p2, 18, 220, 28);
  
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP && p1 > 0) {
      p1 = p1 - 8;
    } else if (keyCode == DOWN && p1 < (height - 224)) {
      p1 = p1 + 8;
    } 
  }
    if(key == 'w' && p2 > 0){
       p2 = p2 - 8;
    } else if(key == 's' && p2 < (height - 224)){
      p2 = p2 + 8;
    }
}
