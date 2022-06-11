float p1 = 0, p2 = 0;
float x = 0, y = 0;
int pont1 = 0, pont2 = 0;
int v_b = 8; //Velocidade das barras
int velocide1 = 3;
int velocidade2 = 2;
int placar_ld = 0;
int placar_le = 0;
int vencedor = 0;
PFont k; // classificação da variavel k como fonte
int b_pause = 0; // botão que pausa o jogo = 1, para simular o pause 
bol b;

void setup(){
  fullScreen(); //Tamanho da tela
  textAlign(CENTER, CENTER); // definindo o textos sempre no centro da tela 
  velocide1 = 3;
  velocidade2 = 2;
  printArray(PFont.list());
  k = createFont("Perpetua Itálico", 24);
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
  tela_pause();
  
  textSize(100);
  text(pont1, 270, 100);
  text(pont2, 810, 100);
  
  rect(6, p1, 14, 200, 28); 
  rect((width - 16 - 6), p2, 14, 200, 28);
  
  b.display();
  b.move();
  b.checkb();
  b.checkpont();
  
  //fim_jogo(); // quando definir a função de pontos do pong, colocar a função fim de jogo dentro de um if
}

void tela_pause(){
  
  if (b_pause == 1){
  //tem que congelar o jogo, por isso iguala a variavel a 0, logo as velocidades são = 0
  velocide1 = 0;
  velocidade2 = 0;
  
  background(180,0,0);
  textSize(height/5); // tamanho da letra
  text("PAUSE", width/2, height/3 -200);
  textSize(height/15);
  text ("click para retornar", width/2, height/3 +200);

   if (mousePressed){
   velocide1 = 3;
   velocidade2 = 2;
   b_pause = 0;
   
   }}

}

void fim_jogo(){ // função de fim de jogo
  textSize(height/10);
  
  if (placar_ld == vencedor){ //definindo venncedor como lado direito
    fill (0,255,0);
    tela_venc("Lado direito é o vencedor!!!!!!!!");
   }
   
   if(placar_le == vencedor){ //definindo venncedor como lado esquerdo
     fill (0,255,0);
    tela_venc("Lado esquerdo é o vencedor!!!!!!!!"); 
   }
}

void tela_venc (String text) {//tela de vencedor
//tem que congelar o jogo, por isso iguala a variavel a 0, logo as velocidades são = 0
  velocide1 = 0;
  velocidade2 = 0;

  background(180,0,0);
  fill(255); // definindo a cor das letras como brancas
  text("Fim de jogo", width/2, height/3 -200);
  text ("click para jogar novamente", width/2, height/3 +200);
  fill(0,255,0); // definindo a cor das letras como verde
  text(text, width/2, height/3); // definindo o texto do vencedor
  
  if(mousePressed){
    // placar_ld = placar do lado direito
  // placar_le = placar do lado esquerdo
  // como o jogo reiniciou, as velocidades voltam ao normal
    placar_ld = 0;
    placar_le = 0;
    velocide1 = 3;
    velocidade2 = 2;}
    
} 


