//import processing.serial.*; // Comentar a variável para não usar comunicação serial

float x = 0, y = 0;  // Posicao da bolinha
int v_b = 8; //Velocidade das barras

int ordem = 0; // Chamada das telas
String ganhou = ""; // Nome do jogador que ganhou (numero 1/ numero 2)
int reset = 0;

int pont1 = 0, pont2 = 0; // Pontuação dos jogadores
int pontc1 = 0, pontc2 = 0; // Pontuação dos jogadores corrigida
int vencedor = 2; // Quantidades de pontos para vencer/perder


//Serial MyPort; // Comentar a variável para não usar comunicação serial
bol b;
bot b1, b2, b3, b4;
barra barra_direita;
barra barra_esquerda;
 
/* // Comentar as variáveis abaixo para não usar comunicação serial
String portName = "COM5";
String pacote = "";
char[] pacoteaberto;
int tracos = 0;
int cont = 0;

String barra1 = "", barra2 = "";
String botao1 = "", botao2 = "";
*/

void setup(){
  size(1080,720); //Tamanho da tela
  //fullScreen(); // Tamanho preenchendo a tela
  textAlign(CENTER, CENTER); //  Alianhmento do texto
  rectMode(CENTER);
  
  b = new bol(); // Inicia o objeto bola
  b1 = new bot(); b2 = new bot(); b3 = new bot(); b4 = new bot();
  barra_direita = new barra(false);// falso pq é direita
  barra_esquerda = new barra(true);// verdadeiro pq é esquerda
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
      tela_instrucoes(); 
      break;
    case 4:
      fim_jogo();
      if(mousePressed && reset == 0){
        reset = 1;
      }
      if(!mousePressed && reset == 1){
        reset = 0;
        ordem = 0;
        barra_esquerda.local_y = height/2; //As barras começam no centro quando o jogo reinicia
        barra_direita.local_y = height/2;
      }
        break;
  }
}

void keyPressed() { // Move as barras com um limite inferior e superior
    int v_b = 8; // velocidade da barra
    if (keyCode == UP ) { 
      barra_direita.mover(-v_b);
    } else if (keyCode == DOWN ) {
      barra_direita.mover(v_b);
    }
     if(key == 'w'){
      barra_esquerda.mover(-v_b);
    } else if(key == 's' ){
      barra_esquerda.mover(v_b);
    }
//Barras não sincronizadas devido a essa função so pegar uma tecla por vez
}

void meio(){ // Desenha os traços no meio
  for (int i = 0; i < height; i = i + 20) {
    fill(255);
    rect(width/2, i, 2, 35);
    i += 35;
  }
}

void tela_inicial(){ // Primeira tela
   pont1 = 0; pont2 = 0;
   
   background(200,0,0);
   textSize(height/6);
   fill(255); 
   text("POOng", width/2, height/3 -150); // Textos finais
   
   b1.escreve("Jogar",width/2, height/3 +100);
   
   b1.escreve("Instruções",width/2, height/3 + 250);
   
   //fazer a distinção de se vai para as intruções ou para o jogo
   
   if(mousePressed){ // Caso pressione o mouse vai para as instruções
     ordem = 3;
   }  
}


void tela_instrucoes(){
    background(170,10,30);
    textSize(height/25);
    fill(255);
    
    text("Pong é uma simulação de uma partida de tênis de mesa.", width/2, height/4);
    
    String s = "O objetivo do jogo é fazer a bolinha chegar ao outro lado sem que seu oponente defenda e assim marcar mais pontos.";
    text(s, width/2, height/2-50, width/2+100, height/2); 
    
    String n = "Utilize os botões grandes para controlar a sua barra e evite que a bola toque na parede!";
    text(n, width/2, height/2+50, width/2+100, height/2); 

     b1.escreve("Jogar",width/2, height/2 +200);
     
     
}


void dinamico(){ // Tela das movimentações principais do jogo
  background(180,0,0); // Cor do fundo
  meio(); // Desenha traços do meio
  fill(255); 
  textSize(100);
  text(pontc1, width/4, 100); // Mostra as pontuacoes alinhadas
  text(pontc2, width - (width/4), 100);
  
  barra_esquerda.barra_inicio(); 
  barra_direita.barra_inicio();
  b.display(); //Mostra a bola
  
  b.move();
  b.checkb();
  b.colisaobarrad(barra_direita.local_x, barra_direita.local_y, barra_direita.largura, barra_direita.altura);
  b.colisaobarrae(barra_esquerda.local_x, barra_esquerda.local_y, barra_esquerda.largura, barra_esquerda.altura);
  
  b.checkpont();
  pontc1 = pont1 / 2; pontc2 = pont2 / 2; // Corrige a duplicação da pontuação
  
  
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

void tela_pause(){ // Tela de pause do jogo
  v_b = 0; // zera a velocidade das barras
  
  background(180,0,0);
  textSize(height/6); 
  fill(255);
  text("PAUSE", width/2, height/3 -200); // Textos de pause
  
  b2.escreve("Retomar", width/2, height/3 +100);
  b4.escreve("Reiniciar", width/2, height/2 +150);
  //text ();
  
  if (mousePressed){ // é para no futuro retomar o jogo
     v_b = 8;
  }
  ordem = 2;

}


void fim_jogo(){ // função de fim de jogo
  if (pontc2 == vencedor){ //definindo vencedor como um lado
     ganhou = "Lado esquerdo é o vencedor!";
   } else if(pontc1 == vencedor){ //definindo vencedor como um  outro lado
     ganhou = "Lado direito é o vencedor!"; 
   }  
  background(180,0,0);
  textSize(height/10);
  fill(255); // definindo a cor das letras como brancas
  text("Fim de jogo", width/2, height/3 -200); // Textos finais
  text(ganhou, width/2, height/3); // definindo o texto do vencedor
    
  b3.escreve("Jogar novamente", width/2, height/3 +200);
 
  ordem = 3; // Mantem a tela final ativa
}
