class bot {
  String frase = "";
  int px, py;
  float tamanho = 0;
  int r = 220, g = 80, b = 80;
  
  void setColor(int r, int g, int b) { // Recolhe valores de cor RGB que podem ser utilizadas para os botões
     this.r = r;
     this.b = b;
     this.g = g;
  }

  bot(int px, int py) { 
    this.px = px; //this. Torna px uma variável exclusiva do objeto que pode ser utilizada em toda classe
    this.py = py;
  }

  void escreve(String frase) { //Escreve texto dentro do retângulo
    textSize(height/12.5);
    tamanho = textWidth(frase); // Tamanho da frase
    stroke(0);
    fill(r,g,b); // preenchimento variável
    rect(this.px, this.py+15, tamanho+50, 120, 28);
    
    textAlign(CENTER, CENTER); //Alinha o texto no retângulo
    fill(0);
    text (frase, this.px, this.py);
  }

  void select_bot() { //Coloca borda branca no botão
    stroke(0);
    fill(225, 225);
    rect(px, py+15, tamanho+80, 80, 28);
  }
}
