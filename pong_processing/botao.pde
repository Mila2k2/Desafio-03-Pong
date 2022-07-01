class bot{
  String frase = "";
  int px, py;
  float tamanho;
  
  bot(){
    px = 0;
    py = 0;
    tamanho = 0;
  }
  
  void escreve(String frase, int px, int py){
   textSize(height/10);
   tamanho = textWidth(frase);
   
   fill(200,80, 0);  
   rect(px, py, tamanho, 120, 28);
   
   textAlign(CENTER, CENTER); 
   
   fill(0);  
   text (frase, px, py);
  }

}
