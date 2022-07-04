class bol { // Classe da bola

  float x, y; // Posicao da bola
  float xspeed = 5, yspeed = 2.3; //  Velocidade da bola
  float r = 14; //raio da bola

  bol() {
    x = width/2;
    y = height /2;
  }
  void display() { // Desenha a bola
    stroke(0);
    ellipse(x, y, 28, 28);
  }

  void move() { // Move a bola
    x += xspeed;
    y += yspeed;
  }

  void checkb() { // Checa se bateu em algum lugar
    if (x > width || x < 0) {
      xspeed = xspeed * (-1);
    }
    if (y > height || y < 0) {
      yspeed = yspeed * (-1);
    }
    
  }

  void checkpont() { // Aumenta a pontuação dos jogadores
    if (x == 0) {
      pont1 += 2;

      x = width/2;
      y = height/2;
      xspeed = xspeed * (-1);
    }
    if (x == width) {
      pont2 += 2;

      x = width/2;
      y = height/2;
      xspeed = xspeed * (-1);
    }
  }

  void colisaobarrad(float xx, float yy, float largura, float altura) {
    if (x + r > xx - largura/2 && y - r < yy + altura/2 && y + r> yy - altura/2) { // condições para a bola recochetear
      xspeed *= -1; // inverter a velocidade da bola
    }
  }

  void colisaobarrae(float xx, float yy, float largura, float altura) {
    if (y - r < yy + altura/2 && y + r > yy - altura/2 && x - r < xx + largura/2) { // condições para a bola recochetear
      xspeed *= -1; // inverter a velocidade da bola
    }
  }
}
