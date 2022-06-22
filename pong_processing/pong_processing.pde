//import processing.serial.*; // Comentar a variável para não usar comunicação serial

float p1 = 0, p2 = 0; // Posição das barras, eixo y
float x = 0, y = 0; // Posicao da bolinha
int pont1 = 0, pont2 = 0; // Pontuação dos jogadores
int v_b = 8; //Velocidade das barras
int ordem = 0; // Chamada das telas
String ganhou = ""; // Nome do jogador que ganhou (numero 1/ numero 2)
int vencedor = 6; // Quantidades de pontos para vencer/perder
bol b; // Objeto bola
bot b1, b2, b3, b4;
//Serial MyPort; // Comentar a variável para não usar comunicação serial
int pontc1 = 0, pontc2 = 0;

/* // Comentar as variáveis abaixo para não usar comunicação serial
String pacote = "";
String portName = "COM5";
char[] pacoteaberto;
int tracos = 0;
String barra1 = "", barra2 = "";
int cont = 0;
*/
void setup(){
  size(1080,720); //Tamanho da tela
  //fullScreen(); // Tamanho preenchendo a tela
  textAlign(CENTER, CENTER); //  Alianhmento do texto
  b = new bol(); // Inicia o objeto bola
  
  b1 = new bot(); b2 = new bot(); b3 = new bot(); b4 = new bot();
  
  //MyPort = new Serial(this, portName, 9600);  // Comentar a variável para não usar comunicação serial
   
}

void draw(){ // main
  switch (ordem){ // Ordena as cenas do jogo
    case 0:
      tela_inicial();
      break;
    case 1:
      dinamico();
      break;
    case 2:
      tela_pause();
      break;
    case 3:
      fim_jogo();
      break;
  }
}

void keyPressed() { // Move as barras com um limite inferior e superior
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
//Barras não sincronizadas devido a essa função so pegar uma tecla por vez
}

void movebarra() { // Move as barras nos potenciometros(Comunicação serial)
     //p1 = map(int(barra1),0,255, 0, height - 200); 
     //p2 = map(int(barra2),0,255, 0, height - 200);
}

void meio(){ // Desenha os traços no meio
  for (int i = 0; i < height; i = i + 20) {
    fill(255);
    rect(width/2, i, 2, 35);
    i += 35;
  }
}

void dinamico(){ // Tela das movimentações principais do jogo
  background(180,0,0); // Cor do fundo
  meio(); // Desenha traços do meio
  fill(255); 
  textSize(100);
  text(pontc1, width/4, 100); // Mostra as pontuacoes alinhadas
  text(pontc2, width - (width/4), 100);
  
  rect(6, p1, 14, 200, 28); // Desenha os retângulos certinho
  rect((width - 16 - 6), p2, 14, 200, 28);
  
  movebarra();
  b.display(); //Ações da bola
  b.move();
  b.checkb();
  b.checkpont();
  pontc1 = pont1 / 2; // Corrige a duplicação da pontuação
  pontc2 = pont2 / 2;
  
  if (pontc1 == vencedor || pontc2 == vencedor){ //Analisando se o jogo acabou para acionar tela de fim
    fim_jogo();
   }  
   if (keyPressed){ //Aciona o pause apertando a tecla b
    if(key == 'b'){
       tela_pause();
    }
  }
  /*
  if ( MyPort.available() > 0) {   // Comentar tudo dentro desse if para usar sem comunicação
      pacote = MyPort.readStringUntil('\n'); 
      if(pacote != null){
         barra1 = "";
        //pacote = pacote.replace("\n", ""); 
        pacoteaberto = pacote.toCharArray();
        
        for(int i = 0; i < 3; i++){
          //barra1 = barra1 + pacoteaberto[i];
          //if(pacoteaberto[i] == '-' ){break;}
        }
        
      }
      println("Barra 1: ", barra1,"Pacote", pacote);
        //println("Valor barra1: ", barra1);
        //println("Valor pacote: ", pacote);
    }
    */
}

void fim_jogo(){ // função de fim de jogo
  textSize(height/10);
  if (pont1 == vencedor){ //definindo vencedor como um lado
    fill (0,255,0);
    ganhou = "Lado esquerdo é o vencedor!!!!!!!!";
   } else if(pont2 == vencedor){ //definindo vencedor como um  outro lado
    fill (0,255,0);
    ganhou = "Lado esquerdo é o vencedor!!!!!!!!"; 
   }  
    background(180,0,0);
    fill(255); // definindo a cor das letras como brancas
    text("Fim de jogo", width/2, height/3 -200); // Textos finais
    b3.escreve("click para jogar novamente", width/2, height/3 +200);
    fill(0,255,0); // definindo a cor das letras como verde
    text(ganhou, width/2, height/3); // definindo o texto do vencedor
  
  
    if(mousePressed){ // Clicando com o mouse reinicia as variáveis do jogo
      pont1 = 0;
      pont2 = 0;
      v_b = 8;
    }
    
    ordem = 3; // Mantem a tela final ativa
}

void tela_pause(){ // Tela de pause do jogo
 
  v_b = 0; // zera a velocidade das barras
  background(180,0,0);
  textSize(height/5); 
  text("PAUSE", width/2, height/3 -200); // Textos de pause
  
  b2.escreve("Retomar", width/2, height/3 +200);
  b4.escreve("Casa", width/2, height/2 +200);
  //text ();
  
  if (mousePressed){ // é para no futuro retomar o jogo
     v_b = 8;
  }
  ordem = 2;

}

void tela_inicial(){ // Primeira tela
   background(200,0,0);
   textSize(height/10);
   fill(255); // definindo a cor das letras como brancas
   text("POOng", width/2, height/3 -200); // Textos finais
   
   b1.escreve("Jogar",width/2, height/3 +200);
    
   if(mousePressed){ // Caso pressione o mouse o jogo comeca
     ordem = 1;
   }  
}
