import processing.serial.*; // Comentar a variável para não usar comunicação serial
//import javax.sound.sampled.*; //Abre biblioteca que suporta áudios
//import java.io.File; //Biblioteca pra acessar os arquivos de áudio

int v_b = 8; //Velocidade das barras

int ordem = 0; // Chamada das telas
String ganhou = ""; // Nome do jogador que ganhou (numero 1/ numero 2)
int reset = 0;

int pont1 = 0, pont2 = 0; // Pontuação dos jogadores
int pontc1 = 0, pontc2 = 0; // Pontuação dos jogadores corrigida
int vencedor = 2; // Quantidades de pontos para vencer/perder


//Serial MyPort; // Comentar a variável para não usar comunicação serial
bol b;
bot jogar, instrucoes, b3, retornar, reiniciar, voltar;
barra barra_direita;
barra barra_esquerda;

// Comentar as variáveis abaixo para não usar comunicação serial
String portName = "COM5";
Serial myPort;

String pacote = "";
char[] pacoteAberto;

int seletor = 0;

String strBarra1 = "", strBarra2 = "";
String botao1 = "", botao2 = "";


void setup() {
  size(1080, 720); //Tamanho da tela
  //fullScreen(); // Tamanho preenchendo a tela
  textAlign(CENTER, CENTER); //  Alianhmento do texto
  rectMode(CENTER);

  b = new bol(); // Inicia o objeto bola

  jogar = new bot(width/2, height/3 +100);
  instrucoes = new bot(width/2, height/3 + 250);
  b3 = new bot(width/2, height/2 +200);
  retornar = new bot(width/2, height/3 +100);
  reiniciar = new bot(width/2, height/2 +150);
  voltar = new bot(width/2, height/3 +200);

  barra_direita = new barra(false);// falso pq é direita
  barra_esquerda = new barra(true);// verdadeiro pq é esquerda

  myPort = new Serial(this, portName, 9600);  // Comentar a variável para não usar comunicação serial
}
/*
void VictorySound(){ //Função do som do fim de jogo
 File victory = new File("Pong_Sounds//victory-fanfare.wav"); //Adiciona o arquivo do áudio no código
 
 Clip clip = AudioSystem.getClip();
 clip.open(AudioSystem.getAudioInputStream(victory));
 clip.start();
 Thread.sleep(3000);// Toca o som por 3 segundos antes de interromper
 clip.stop();
 clip.close();
 }
 */

void draw() { // main
  if (myPort.available() > 0) {
    pacote = myPort.readStringUntil('\n');

    if (pacote != null) {
      strBarra1 = "";
      strBarra2 = "";
      botao1 = "";
      botao2 = "";

      pacoteAberto = pacote.toCharArray();

      for (int i = 0; i < pacote.length(); i++) {
        if (pacoteAberto[i] == '-') {
          seletor++;
          i++;
        }

        if (seletor == 0) strBarra1 += pacoteAberto[i];
        if (seletor == 1) strBarra2 += pacoteAberto[i];
        if (seletor == 2) botao1 += pacoteAberto[i];
        if (seletor == 3) botao2 += pacoteAberto[i];
      }
      println(botao1);
      println(botao2);
      println(strBarra1);
      seletor = 0;
    }
  }

  switch (ordem) { // Ordena as cenas do jogo
  case 0:
    tela_inicial();
    if (mousePressed || botao1.indexOf('1') != -1 || botao2.indexOf('1') != -1) { // Caso pressione o mouse vai para as instruções
      ordem = 2;
    } //else if(){ }
    break;
  case 1:
    tela_instrucoes();
    /*
    if (mousePressed || botao1.indexOf('1') != -1 || botao2.indexOf('1') != -1) { // Caso pressione o mouse vai para as instruções
     ordem = 2;
     }
     */
    break;
  case 2:
    dinamico();
    /*
    if ((keyPressed && key == 'b') || botao1.indexOf('1') != -1 || botao2.indexOf('1') != -1) {
     tela_pause();
     }
     */
    if (pontc1 == vencedor || pontc2 == vencedor) { //Analisando se o jogo acabou para acionar tela de fim
      fim_jogo();
    }

    break;
  case 3:
    tela_pause();
    /*
    if (mousePressed || botao1.indexOf('1') != -1 || botao2.indexOf('1') != -1) { // Caso pressione o mouse vai para as instruções
     ordem = 2;
     }
     */
    break;
  case 4:
    fim_jogo();

    if (mousePressed && reset == 0) {
      reset = 1;
    }
    if (!mousePressed && reset == 1) {
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
  if (key == 'w') {
    barra_esquerda.mover(-v_b);
  } else if (key == 's' ) {
    barra_esquerda.mover(v_b);
  }
  //Barras não sincronizadas devido a essa função so pegar uma tecla por vez
}

void meio() { // Desenha os traços no meio
  for (int i = 0; i < height; i = i + 20) {
    fill(255);
    rect(width/2, i, 2, 35);
    i += 35;
  }
}

void tela_inicial() { // Primeira tela
  pont1 = 0;
  pont2 = 0;

  background(200, 0, 0);
  textSize(height/6);
  fill(255);
  text("POOng", width/2, height/3 -150); // Textos finais
  jogar.select_bot();
  jogar.escreve("Jogar");
  instrucoes.escreve("Instruções");

  //fazer a distinção de se vai para as intruções ou para o jogo
}


void tela_instrucoes() {
  background(170, 10, 30);
  textSize(height/25);
  fill(255);

  text("Pong é uma simulação de uma partida de tênis de mesa.", width/2, height/4);

  String s = "O objetivo do jogo é fazer a bolinha chegar ao outro lado sem que seu oponente defenda e assim marcar mais pontos.";
  text(s, width/2, height/2-50, width/2+100, height/2);

  String n = "Utilize os botões grandes para controlar a sua barra e evite que a bola toque na parede!";
  text(n, width/2, height/2+50, width/2+100, height/2);

  b3.escreve("Jogar");
}


void dinamico() { // Tela das movimentações principais do jogo
  background(180, 0, 0); // Cor do fundo
  meio(); // Desenha traços do meio
  fill(255);
  textSize(100);
  text(pontc1, width/4, 100); // Mostra as pontuacoes alinhadas
  text(pontc2, width - (width/4), 100);

  b.display(); //Mostra a bola
  b.move();

  b.checkb();
  b.colisaobarrad(barra_direita.local_x, barra_direita.local_y, barra_direita.largura, barra_direita.altura);
  b.colisaobarrae(barra_esquerda.local_x, barra_esquerda.local_y, barra_esquerda.largura, barra_esquerda.altura);

  b.checkpont();
  pontc1 = pont1 / 2;
  pontc2 = pont2 / 2; // Corrige a duplicação da pontuação

  barra_esquerda.moverPot(int(strBarra1));
  barra_direita.moverPot(int(strBarra2));

  barra_esquerda.barra_inicio();
  barra_direita.barra_inicio();
}

void tela_pause() { // Tela de pause do jogo
  v_b = 0; // zera a velocidade das barras

  background(180, 0, 0);
  textSize(height/6);
  fill(255);
  text("PAUSE", width/2, height/3 -200); // Textos de pause

  retornar.escreve("Retornar");
  reiniciar.escreve("Reiniciar");
  //text ();

  if (mousePressed) { // é para no futuro retomar o jogo
    v_b = 8;
  }
  ordem = 3; //Mantém tela pause
}


void fim_jogo() { // função de fim de jogo
  if (pontc2 == vencedor) { //definindo vencedor como um lado
    ganhou = "Lado esquerdo é o vencedor!";
  } else if (pontc1 == vencedor) { //definindo vencedor como um  outro lado
    ganhou = "Lado direito é o vencedor!";
  }
  background(180, 0, 0);
  textSize(height/10);
  fill(255); // definindo a cor das letras como brancas
  text("Fim de jogo", width/2, height/3 -200); // Textos finais
  text(ganhou, width/2, height/3); // definindo o texto do vencedor

  voltar.escreve("Voltar a tela inicial");

  ordem = 4; // Mantem a tela final ativa
}
