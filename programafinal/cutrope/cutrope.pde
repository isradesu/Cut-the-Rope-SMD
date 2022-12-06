Pendulum p, p2;
Star s1, s2, s3;

PImage om_nom_aberta, om_nom_fechada, fundo, papel, doce, corda, estrela, area, estrelas0, estrelas1, estrelas2, estrelas3, botao_seguir, botao_voltar, botao_casa;

float pontoInicialX = 120;
float pontoInicialY = 150;
float doceX = pontoInicialX;
float doceY = pontoInicialY;


float speedX = 0;
float speedY = 0;
float gravity = 0.1;
float acceleration = 0.1;

final int DOCE_PARADO = 0;
final int DOCE_QUEDA = 1;
final int DOCE_BALANCANDO = 2;
final int DOCE_SOLTO = 3;

final int ESTRELA_DISP1 = 4;
final int ESTRELA_PEGA1 = 5;
final int ESTRELA_DISP2 = 6;
final int ESTRELA_PEGA2 = 7;
final int ESTRELA_DISP3 = 8;
final int ESTRELA_PEGA3 = 9;

final int FASE_1 = 10;
final int FASE_2 = 11;
final int PONTOS_FASE1 = 12;
final int PONTOS_FASE2 = 13;
final int PONTOS_DERROTA1 = 14;
final int PONTOS_DERROTA2 = 15;

int estadoDoce = DOCE_PARADO;
int estadoDoce2 = DOCE_PARADO;

int estadoEstrela1 = ESTRELA_DISP1;
int estadoEstrela2 = ESTRELA_DISP2;
int estadoEstrela3 = ESTRELA_DISP3;

int estadoFase = FASE_1;

boolean teste = false;
boolean teste2 = false;
int auxiliar = 0;
boolean auxauxiliar = true;

int pontuacao = 0;

void setup() {
  size(475, 635);
  om_nom_fechada = loadImage("om_nom_fechada.png");
  om_nom_aberta = loadImage("om_nom_aberta.png");
  fundo = loadImage("fundo.png");
  papel = loadImage("papelao.png");
  doce = loadImage("doce.png");
  corda = loadImage("corda.png");
  estrela = loadImage("estrela.png");
  area = loadImage("area.png");
  estrelas0 = loadImage("estrelas0.png");
  estrelas1 = loadImage("estrelas1.png");
  estrelas2 = loadImage("estrelas2.png");
  estrelas3 = loadImage("estrelas3.png");
  botao_seguir = loadImage("botao_seguir.png");
  botao_voltar = loadImage("botao_voltar.png");
  botao_casa = loadImage("botao_casa.png");
  p = new Pendulum(new PVector(doceX, doceY), 150);
  
}

void draw() {

  if (estadoFase == FASE_1) {
    if (teste2 == false) {
      estadoDoce = DOCE_PARADO;
      
      
      doceX = pontoInicialX;
      doceY = pontoInicialY;

      p.origin.x = doceX;
      p.origin.y = doceY;
      gravity = 0.1;
      speedY = 0.1;
      p.angle = PI/4;
      p.aVelocity = 0;
      
      
      criarEstrelas(120, 250, 220, 470, 430, 470);
      //auxiliar--;


      teste2 = true;
    }
    plano_fundo();
   
    


    laco(320, 350);  

    nom(320, 550);

    doce();
    mef_doce();

    estrelas();
    mef_estrelas();
    image(botao_voltar, 30,20,50,26);
    
      if(mousePressed == true && dist(mouseX, mouseY, 30, 20) <= 40){
          teste2 = false;
          pontuacao = 0;
      }
    
  
  }
  if (estadoFase == PONTOS_FASE1){
    tela_pontos(237.5, 170, 237.5,370,237.5,520);
  }

  if (estadoFase == FASE_2) {
    plano_fundo();
    if (teste == false) {
      estadoDoce = DOCE_PARADO;

      p.origin.x = 237;
      p.origin.y = 80;
      p.location.x = 120;
      p.location.y = 100;
      doceX = p.location.x;
      doceY = p.location.y;
      gravity = 0.1;
      speedY = 0.1;
      p.angle = PI/3;
      s1.location = new PVector(180, 220);
      s2.location = new PVector(400, 450);
      s3.location = new PVector(80, 520);
      s1.display();
      s2.display();
      s3.display();

      teste = true;
    }
    
    laco(350, 300);
    laco(140, 385);

    nom(330, 555);

    doce();
    mef_doce();
    
    estrelas();
    mef_estrelas();
    
    image(botao_voltar, 30,20,50,26);
    
    if(mousePressed == true && dist(mouseX, mouseY, 30, 20) <= 40){
          teste = false;
          pontuacao = 0;
      }
  }
  
    if (estadoFase == PONTOS_FASE2){
    tela_final(237.5, 170, 237.5,370,237.5,520);
  }
  
  
  
}



void criarEstrelas(float x1, float y1, float x2, float y2, float x3, float y3) {
  s1 = new Star(new PVector(x1, y1));  
  s2 = new Star(new PVector(x2, y2));  
  s3 = new Star(new PVector(x3, y3));
}



void nom(int x, int y) {

  if (dist(p.location.x, p.location.y, x, y) < 150) {
    imageMode(CENTER);
    image(papel, x, y + 45, 144, 108);
    image(om_nom_aberta, x, y, 96, 96);
  } else {
    imageMode(CENTER);
    image(papel, x, y + 45, 144, 108);
    image(om_nom_fechada, x, y, 96, 96);
  }

  if (dist(p.location.x, p.location.y, x, y) <= 50 && estadoFase == FASE_1) {
    estadoDoce = DOCE_SOLTO;
    p.displace();
    estadoFase = PONTOS_FASE1;
  }
  
  if (dist(p.location.x, p.location.y, x, y) <= 50 && estadoFase == FASE_2) {
    estadoDoce = DOCE_SOLTO;
    p.displace();
    estadoFase = PONTOS_FASE2;
    
  }
  
}

void doce() {

  if (estadoDoce == DOCE_PARADO) {
    p.freeze();
  }

  if (estadoDoce == DOCE_QUEDA) {
    p.fall();
  }

  if (estadoDoce == DOCE_BALANCANDO) {
    p.go();
  }

  if (estadoDoce == DOCE_SOLTO) {
    p.soltar();
  }
}

void mef_doce() {
  if (mousePressed == true && dist(mouseX, mouseY, p.origin.x, p.origin.y) <= 64 && estadoDoce == DOCE_PARADO) {
    estadoDoce = DOCE_QUEDA;
  }
  if (mousePressed == true && dist(mouseX, mouseY, p.location.x, p.location.y) <= 64) {
    estadoDoce = DOCE_SOLTO;
  }

  if (((doceX - p.origin.x) >= 150 || (doceY - p.origin.y) >= 150) && estadoDoce == DOCE_QUEDA) {
    estadoDoce = DOCE_BALANCANDO;
  }
}

float MRUV(float v, float a) {
  float d;

  d = v;
  d *= a;

  return(d);
}

void mef_estrelas() {


  if ((dist(p.location.x, p.location.y, s1.location.x, s1.location.y) <= 48) || dist(p.origin.x, doceY, s1.location.x, s1.location.y) <= 48) {
    estadoEstrela1 = ESTRELA_PEGA1;
  }

  if ((dist(p.location.x, p.location.y, s2.location.x, s2.location.y) <= 48) || dist(p.origin.x, doceY, s2.location.x, s2.location.y) <= 48) {
    estadoEstrela2 = ESTRELA_PEGA2;
  }

  if ((dist(p.location.x, p.location.y, s3.location.x, s3.location.y) <= 48) || dist(p.origin.x, doceY, s3.location.x, s3.location.y) <= 48) {
    estadoEstrela3 = ESTRELA_PEGA3;
  }
}

void plano_fundo() {
  imageMode(CORNER);
  image(fundo, 0, 0, 475, 635);
}

void estrelas() {
  if (estadoEstrela1 == ESTRELA_DISP1) {
    s1.display();
  }

  if (estadoEstrela2 == ESTRELA_DISP2) {
    s2.display();
  }

  if (estadoEstrela3 == ESTRELA_DISP3) {
    s3.display();
  }


  if (estadoEstrela1 == ESTRELA_PEGA1) {
    s1.displace();
    pontuacao++;
    estadoEstrela1 = ESTRELA_DISP1;
  }

  if (estadoEstrela2 == ESTRELA_PEGA2) {
    s2.displace();
    pontuacao++;
    estadoEstrela2 = ESTRELA_DISP2;
  }

  if (estadoEstrela3 == ESTRELA_PEGA3) {
    s3.displace();
    pontuacao++;
    estadoEstrela3 = ESTRELA_DISP3;
  }
}

class Pendulum {
  PVector location;    
  PVector origin;      
  float r;             
  float angle;         
  float aVelocity;     
  float aAcceleration; 
  float damping;       


  Pendulum(PVector origin_, float r_) {
    origin = origin_.get();
    location = new PVector();
    r = r_;
    angle = PI/4;

    aVelocity = 0.0;
    aAcceleration = 0.0;

    damping = 0.995;
  }

  void go() {
    update();
    display();
  }

  void fall() {
    doceY += speedY;
    speedY += gravity;

    imageMode(CENTER);

    stroke(#925f3c);
    strokeCap(SQUARE);
    strokeWeight(8);
    linha(origin.x, origin.y, origin.x, doceY);

    image(doce, origin.x, doceY, 48, 48);
  }

  void displace() {
    imageMode(CENTER);
    this.location.x += 2000;
  }

  void soltar() {

    if (location.x >= origin.x)
      location.x += MRUV(min((location.x-origin.x)/15, r/15), 0.6);
    else
      location.x -= MRUV(min((location.x+origin.x)/15, r/15), 0.6);


    location.y += speedY;
    speedY += gravity;
    gravity += 0.02;

    imageMode(CENTER);    
    image(doce, location.x, location.y, 48, 48);
  }

  void freeze() {
    imageMode(CENTER);
    image(doce, origin.x, origin.y, 48, 48);
  }

  void update() {
    float gravity = 0.4;

    aAcceleration = (-1 * gravity / r) * sin(angle);


    aVelocity += aAcceleration;
    angle += aVelocity;



    aVelocity *= damping;
  }

  void display() {

    location.set(r*sin(angle), r*cos(angle), 0);
    location.add(origin);

    stroke(#925f3c);
    strokeCap(SQUARE);
    strokeWeight(8);
    linha(origin.x, origin.y, location.x, location.y);

    imageMode(CENTER);
    image(doce, location.x, location.y, 48, 48);
  }
}

void laco(float x, float y) {
  imageMode(CENTER);
  image(area, x, y, 100, 100); //nó com uma área

  if (dist(p.location.x, p.location.y, x, y) <= 75) {
    p.origin.x = x;
    p.origin.y = y;
    p.angle = PI/3;

    estadoDoce = DOCE_BALANCANDO;
  }
}

void linha(float x1, float y1, float x2, float y2) {

  int lado = 10;

  int qtd = int(dist(x1, y1, x2, y2)/lado);  

  for (int i = 0; i <= qtd; i++) {
    float x = lerp(x1, x2, i/15.0);
    float y = lerp(y1, y2, i/16.6);
    noStroke();
    fill(#925f3c);
    rectMode(CENTER);
    rect(x, y, lado, lado);
  }
}


class Star {

  PVector location;

  Star(PVector location_) {
    location = location_.get();
  }


  void displace() {
    imageMode(CENTER);
    this.location.x += 2000;
    image(estrela, location.x, location.y, 48, 48);
  }

  void display() {
    imageMode(CENTER);
    image(estrela, location.x, location.y, 48, 48);
  }
}
