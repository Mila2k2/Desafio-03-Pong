class bol{ // Classe da bola
  
  float x, y; // Posicao da bola
  float xspeed = 5, yspeed = 2.3; //  Velocidade da bola
  
  bol(){ // Definições iniciais
    x = 0;
    y = 0;
  }
  
  void display(){ // Desenha a bola
    stroke(0);
    ellipse(x, y, 28, 28);
  }
  
  void move(){ // Move a bola
    x += xspeed;
    y += yspeed;
  }
  
  // Checa se bateu em algum lugar
  void checkb(){   
    //Checar o comprimento máx (desativado para testar o reseta_bola)
   // if (x > width || x < 0){  
   //   xspeed = xspeed * (-1);
   // }
   //Checar a altura máx
    if (y > height || y < 0){ 
      yspeed = yspeed * (-1);
    }  
    
    //Condições da bolinha bater na parede
    //Adicionei um incremento na pontuação aqui, caso queiram comprimir o código
    if(x > width){
      pont1++;
       reseta_bola();
    }
    if(x < 0){
      pont2++;
       reseta_bola();
     }
  } 
  
  //Função para colocar a bolinha no centro novamente.
  //OBS: Ajustar para a bolinha ir para o lado oposto do jogador que pontuar!!!!!!!!!!!!!!
  void reseta_bola(){
    x = width/2;
    y = height/2;

  }
  
  //Checagem para aumentar a pontuação dos jogadores
  void checkpont(){ 
    //Aqui já poderia fazer o incremento
    if(x == 0.1){
     pont1 += 1;
    }
    if(x == width){
     pont2 += 1;
    }
  }
  
}

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