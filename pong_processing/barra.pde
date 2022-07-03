class barra {

  float largura = 15;
  float altura = 200;
  float local_y = height/2; //posição y/2 para comerçar no centro da barra
  float local_x;

  barra(boolean esquerda) {
    if (esquerda) {
      local_x =  largura + 5; // o +5 serve para se afastar da borda
    } else {
      local_x = width - largura - 5;// o -5 serve para se afastar da borda
    }
  }

  void barra_inicio() { // configurando as barras iniciais
    fill(255);
    rect(local_x, local_y, largura, altura, 30);
  }

  void moverPot(int pos) {
    if (pos != local_y) {
      local_y = map(pos, 0, 255, 100, height - 100);  // Potenciometro
    }
  }
}
