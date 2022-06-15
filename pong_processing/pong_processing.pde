float p1 = 0, p2 = 0;
float x = 0, y = 0;
int pont1 = 0, pont2 = 0;
int v_b = 8; //Velocidade das barras
bol b;
int ordem = 0;
String ganhou = "";
int vencedor = 1;

void setup(){
  //size(1080,720); //Tamanho da tela
  fullScreen();
  textAlign(CENTER, CENTER);
  b = new bol();
}

void draw(){
  switch (ordem){
    case 0:
      dinamico();
      break;
    case 1:
      fim_jogo();
      break;
    case 2:
      tela_pause();
      break;
  }
  
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
  for (int i = 0; i < height; i = i + 20) {
    fill(255);
    rect(width/2, i, 2, 35);
    i += 35;
  }
}

void dinamico(){
  background(180,0,0); // Cor do fundo
  meio();
  fill(255);
  textSize(100);
  text(pont1/2, width/4, 100);
  text(pont2/2, width - (width/4), 100);
  
  rect(6, p1, 14, 200, 28); 
  rect((width - 16 - 6), p2, 14, 200, 28);
  
  b.display();
  b.move();
  b.checkb();
  b.checkpont();
  
  if (pont1 == vencedor || pont2 == vencedor){ //definindo venncedor como lado direito
    fim_jogo();
   }  
   if (keyPressed){ //definindo venncedor como lado direito
    if(key == 'b'){
       tela_pause();
    }
  } 
}

void fim_jogo(){ // função de fim de jogo
  textSize(height/10);
  if (pont1 == vencedor){ //definindo venncedor como lado direito
    fill (0,255,0);
    ganhou = "Lado esquerdo é o vencedor!!!!!!!!";
   }
   if(pont2 == vencedor){ //definindo venncedor como lado esquerdo
    fill (0,255,0);
    ganhou = "Lado esquerdo é o vencedor!!!!!!!!"; 
   }  
    background(180,0,0);
    fill(255); // definindo a cor das letras como brancas
    text("Fim de jogo", width/2, height/3 -200);
    text ("click para jogar novamente", width/2, height/3 +200);
    fill(0,255,0); // definindo a cor das letras como verde
    text(ganhou, width/2, height/3); // definindo o texto do vencedor
  
    if(mousePressed){
      pont1 = 0;
      pont2 = 0;
      v_b = 8;
    }
  ordem = 1;
}

void tela_pause(){
 
  v_b = 0;
  background(180,0,0);
  textSize(height/5); // tamanho da letra
  text("PAUSE", width/2, height/3 -200);
  textSize(height/15);
  text ("click para retornar", width/2, height/3 +200);

  if (mousePressed){
     v_b = 8;
  }
 ordem = 2;

}

