class bot {
  String frase = "";
  int px, py;
  float tamanho = 0;
  int r = 0, g = 0, b = 0;
  
  void setColor(int r, int g, int b) {
     this.r = r;
     this.b = b;
     this.g = g;
  }

  bot(int px, int py) {
    this.px = px;
    this.py = py;
  }

  void escreve(String frase) {
    textSize(height/12.5);
    tamanho = textWidth(frase);
    
    //fill(r,g,b);
    fill(220, 80, 80);
    rect(this.px, this.py+15, tamanho+50, 120, 28);
    textAlign(CENTER, CENTER);

    fill(0);
    text (frase, this.px, this.py);
  }

  void select_bot() {
    stroke(225);
    fill(225, 225);
    rect(px, py+15, tamanho+80, 80, 28);
  }
}
