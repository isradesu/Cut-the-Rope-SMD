void tela_pontos(float estrelasX, float estrelasY, float seguirX, float seguirY, float voltarX, float voltarY) {

  plano_fundo();
  imageMode(CENTER);
  if (pontuacao == 0) {
    image(estrelas0, estrelasX, estrelasY, 300, 88.5);
  }

  if (pontuacao == 1) {
    image(estrelas1, estrelasX, estrelasY, 300, 88.5);
  }

  if (pontuacao == 2) {
    image(estrelas2, estrelasX, estrelasY, 300, 88.5);
  }

  if (pontuacao == 3) {
    image(estrelas3, estrelasX, estrelasY, 300, 88.5);
  }

  image(botao_seguir, seguirX, seguirY);
  image(botao_voltar, voltarX, voltarY);

  //clique botao seguir
  if (mousePressed == true && dist(mouseX, mouseY, seguirX, seguirY) <= 64) {
    estadoFase = FASE_2;
    pontuacao = 0;
  }

  //clique botao voltar
  if (mousePressed == true && dist(mouseX, mouseY, voltarX, voltarY) <= 64) {

    teste2 = false;
    pontuacao = 0;
    estadoFase = FASE_1;
  }
}

void tela_final(float estrelasX, float estrelasY, float comecoX, float comecoY, float voltarX, float voltarY) {
  plano_fundo();
  imageMode(CENTER);
  if (pontuacao == 0) {
    image(estrelas0, estrelasX, estrelasY, 300, 88.5);
  }

  if (pontuacao == 1) {
    image(estrelas1, estrelasX, estrelasY, 300, 88.5);
  }

  if (pontuacao == 2) {
    image(estrelas2, estrelasX, estrelasY, 300, 88.5);
  }

  if (pontuacao == 3) {
    image(estrelas3, estrelasX, estrelasY, 300, 88.5);
  }

  image(botao_casa, comecoX, comecoY);
  image(botao_voltar, voltarX, voltarY);


  //clique botao comeco
  if (mousePressed == true && dist(mouseX, mouseY, comecoX, comecoY) <= 64) {
    
    teste2 = false;
    pontuacao = 0;
    estadoFase = FASE_1;
    
  }

  //botao voltar
  if (mousePressed == true && dist(mouseX, mouseY, voltarX, voltarY) <= 64) {

    teste = false;
    pontuacao = 0;
    estadoFase = FASE_2;
  }
}



/*void tela_derrota1(float estrelasX, float estrelasY, float voltarX, float voltarY){
    
  plano_fundo();
  imageMode(CENTER);
  
  image(estrelas0, estrelasX, estrelasY, 300, 88.5);
 
  image(botao_voltar, voltarX, voltarY);
  
  if (mousePressed == true && dist(mouseX, mouseY, voltarX, voltarY) <= 64) {

    teste2 = false;
    pontuacao = 0;
    estadoFase = FASE_1;
  }
  
}*/


  
