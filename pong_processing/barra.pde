class barra {
  
 float largura = 15;
 float altura = 200;
 float local_y = height/2; //posição y/2 para comerçar no centro da tela
 float local_x; //poisção x
 
  barra(boolean esquerda){
  if(esquerda){
    local_x =  largura + 10; // o +10 serve para se afastar da borda
  
  } else{
    local_x = width - largura - 10;// o -10 serve para se afastar da borda
 
  }
  }
 
  void barra_inicio(){
    rect(local_x, local_y, largura, altura);
    rectMode(CENTER);
    fill(255);
  }
  
  void mover(int veloy){
    local_y = local_y + veloy; //soma a posição inicial mais a velocidade
    local_y = constrain(local_y, altura/2, height- altura/2); // restringe a movimentação em limites superiores e inferiores
  
}

 
}
