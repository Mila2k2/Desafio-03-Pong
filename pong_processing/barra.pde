class barra {
  
 float largura = 15;
 float altura = 200;
 float local_y = height/2; //posição y/2 para comerçar no centro da barra
 float local_x; 
 
  barra(boolean esquerda){
    if(esquerda){
      local_x =  largura + 10; // o +10 serve para se afastar da borda
    
    } else{
      local_x = width - largura - 10;// o -10 serve para se afastar da borda
    }
  }
 
  void barra_inicio(){ // configurando as barras iniciais
    fill(255);
    rect(local_x, local_y, largura, altura, 30);
    
  }
  
  void mover(int veloy){
    local_y = local_y + veloy; //soma a posição inicial mais a velocidade
    local_y = constrain(local_y, altura/2, height- altura/2); // restringe a movimentação em limites superiores e inferiores
    //local_y = map(int(barra1),0,255, 0, height - 200);  // Potenciometro
  }

}
