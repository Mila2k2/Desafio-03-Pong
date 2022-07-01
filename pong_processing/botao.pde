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
   textSize(height/11);
   tamanho = textWidth(frase);
   
   fill(220,80, 80);  
   rect(px, py+15, tamanho+30, 120, 28);
   
   textAlign(CENTER, CENTER); 
   
   fill(0);  
   text (frase, px, py);
  }

}
