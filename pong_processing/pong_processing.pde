import processing.serial.*; //Biblioteca para comunicação serial
import processing.sound.*; //Biblioteca para som

int ordem = 0; // Chamada das telas
String ganhou = ""; // Nome do jogador que ganhou (Direita/ Esquerda)
int pulsando = 50;

int pont1 = 0, pont2 = 0; // Pontuação dos jogadores
int pontc1 = 0, pontc2 = 0; // Pontuação dos jogadores corrigida
int vencedor = 6; // Quantidades de pontos para vencer/perder


int click = 0;

bol b;
bot jogar, instrucoes, b3, retornar, reiniciar, voltar;
barra barra_direita;
barra barra_esquerda;

String portName = "COM5";
Serial myPort;

String pacote = "";
char[] pacoteAberto;

int seletor = 0;

String strBarra1 = "", strBarra2 = "";
String botao1 = "", botao2 = "";

SoundFile menu;
SoundFile jogo;
SoundFile vitoria;

void setup() {
  size(1080, 720); //Tamanho da tela
  //fullScreen(); // Tamanho preenchendo a tela
  textAlign(CENTER, CENTER); //  Alianhmento do texto
  rectMode(CENTER);

  b = new bol(); // Inicia o objeto bola

  jogar = new bot(width/2, height/3 +125);
  instrucoes = new bot(width/2, height/3 + 275);
  b3 = new bot(width/2, height/2 +200);
  retornar = new bot(width/2, height/3 +100);
  reiniciar = new bot(width/2, height/2 +150);
  voltar = new bot(width/2, height/3 +200);

  barra_direita = new barra(false);// falso pq é direita
  barra_esquerda = new barra(true);// verdadeiro pq é esquerda

  myPort = new Serial(this, portName, 9600);

  menu = new SoundFile(this, "musicas/adventure.mp3");
  jogo = new SoundFile(this, "musicas/boss-fight.mp3");
  vitoria = new SoundFile(this, "musicas/vitoria.mp3");
}

void draw() { // main

  comunicacao();

  switch (ordem) { // Ordena as cenas do jogo
  case 0:
    tela_inicial();
    if (click == 0 && (botao1.indexOf('1') != -1 || botao2.indexOf('1') != -1)) click = 1;

    if (click == 1 && (botao1.indexOf('1') == -1) && (botao2.indexOf('1') == -1)) {

      if (int(strBarra1) > 127 || int(strBarra2) > 127) {
        click = 4;
        ordem = 2;
      } else {
        click += 1;
        ordem = 1;
      }
    }
    break;
  case 1:
    tela_instrucoes();
    if (click == 2 && (botao1.indexOf('1') != -1 || botao2.indexOf('1') != -1)) click = 3;

    if (click == 3 && (botao1.indexOf('1') == -1) && (botao2.indexOf('1') == -1)) {
      click += 1;
      ordem = 2;
    }
    break;
  case 2:
    dinamico();
    if (click == 4 && (botao1.indexOf('1') != -1 || botao2.indexOf('1') != -1)) click = 5;

    if (click == 5 && (botao1.indexOf('1') == -1) && (botao2.indexOf('1') == -1)) {
      click += 1;
      ordem = 3;
    }

    if (pontc1 == vencedor || pontc2 == vencedor) { //Analisando se o jogo acabou para acionar tela de fim
      ordem = 4;
    }

    break;
  case 3:
    tela_pause();
    if (click == 6 && (botao1.indexOf('1') != -1 || botao2.indexOf('1') != -1)) click = 7;

    if (click == 7 && (botao1.indexOf('1') == -1) && (botao2.indexOf('1') == -1)) {
      if (int(strBarra1) > 127 || int(strBarra2) > 127) {
        click = 4;
        ordem = 4;
      } else {
        click = 4;
        ordem = 2;
      }
    }
    break;
  case 4:
    fim_jogo();
    if (click == 4 && (botao1.indexOf('1') != -1 || botao2.indexOf('1') != -1)) click = 5;

    if (click == 5 && (botao1.indexOf('1') == -1) && (botao2.indexOf('1') == -1)) {
      click = 0;
      ordem = 0;
      barra_esquerda.local_y = height/2; //As barras começam no centro quando o jogo reinicia
      barra_direita.local_y = height/2;
      ordem = 0;
    }

    break;
  }
}

void comunicacao() {
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

      seletor = 0;
    }
  }
}

void meio() { // Desenha os traços no meio
  for (int i = 0; i < height; i = i + 20) {
    fill(255);
    rect(width/2, i, 2, 35);
    i += 35;
  }

  if (pontc1 >= 2 || pontc1 >= 2) {
    rect(width/2, height/2, 15, 100, 30);
  }
}

void tela_inicial() { // Primeira tela
  pont1 = 0;
  pont2 = 0;

  if (!menu.isPlaying()) {
    menu.play();
    jogo.stop();
    vitoria.stop();
  }

  background(200, 0, 0);
  textSize(height/6);
  fill(255);

  textSize(pulsando);
  text("PoOng", width/2, height/3 -150); // Textos finais
  if (pulsando == height/6 ) pulsando = height/7;
  else pulsando += 1;

  if (int(strBarra1) > 127 || int(strBarra2) > 127) jogar.select_bot();
  else instrucoes.select_bot();

  jogar.escreve("Jogar");
  instrucoes.escreve("Instruções");
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

  b3.select_bot();
  b3.escreve("Jogar");
}


void dinamico() { // Tela das movimentações principais do jogo

  if (!jogo.isPlaying()) {
    jogo.play();
    menu.stop();
  }

  background(180, 0, 0);
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

  ordem = 2;
}

void tela_pause() { // Tela de pause do jogo

  if (!menu.isPlaying()) {
    menu.play();
    jogo.stop();
  }

  background(180, 0, 0);
  textSize(height/6);
  fill(255);
  text("PAUSE", width/2, height/3 -200); // Textos de pause

  if (int(strBarra1) > 127 || int(strBarra2) > 127) retornar.select_bot();
  else reiniciar.select_bot();
  retornar.escreve("Reiniciar");
  reiniciar.escreve("Retornar");
  //text ();

  ordem = 3; //Mantém tela pause
}


void fim_jogo() { // função de fim de jogo

  if (!vitoria.isPlaying()) {
    vitoria.play();
    menu.stop();
    jogo.stop();
  }

  if (pontc2 == vencedor) { //definindo vencedor como um lado
    ganhou = "Lado esquerdo é o vencedor!";
  } else if (pontc1 == vencedor) { //definindo vencedor como um  outro lado
    ganhou = "Lado direito é o vencedor!";
  }
  background(180, 0, 0);
  textSize(height/10);
  fill(255); // definindo a cor das letras como brancas
  text("Fim de jogo", width/2, height/3 -200); // Textos finais
  text(ganhou, width/2, height/3);

  voltar.select_bot();
  voltar.escreve("Voltar a tela inicial");

  ordem = 4; // Mantem a tela final ativa
}
