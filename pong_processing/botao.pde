class bot{
  String frase = "";
  int px = 0, py = 0;
  float tamanho = 0;
  
  bot(){
  
  }
  
  void escreve(String frase, int px, int py){
   textSize(height/10);
   tamanho = textWidth(frase);
   
   fill(200,80, 0);  
   rect(px - (tamanho / 2), py - 38 , tamanho, 120, 28);
   
   textAlign(CENTER, CENTER); 
   
   fill(0);  
   text (frase, px, py);
  }

}
