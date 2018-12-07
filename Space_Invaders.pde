int m;
int lives;
int last;
int numero;
int r, q, k;
int gameState;
int posicaox;
int posicaoy;
int incremento;
int rand2;
int totalEnemy;
int pontos;
int full_enemy;
int tamanhoAlien;
int full_shield;
float x;
float y;
float h;
float w;
float time;
float initxLinha;
float inityLinha;
float initxColuna;
float inityColuna;
float linhas;
float colunas;
float speed;
float initY;
float espacamento;
float index;
float rand;
float shieldX;
Boolean inimiLeft;
Boolean space;
Boolean left;
Boolean right;
Boolean canShoot;
Boolean atirando;
Boolean enemyshoot;
Boolean up;
Boolean down;
Boolean a;
Boolean b;
Boolean c;
Boolean s;
Boolean hard;
ArrayList <Bullet> bullet1;
ArrayList <Enemy> inimigos;
ArrayList <EnemyBeta> ini;
ArrayList <BulletEnemy> be;
ArrayList <Shield> arrShield;
Bullet bullet;
Enemy inimigo;
Player player;
Enemy[] inimi;
EnemyBeta[] inimibeta;
EnemyGama[] inimigama;
EnemyGama[] inimigama2;
EnemyGama[] inimigama3;
Shield[] shield;
PFont f;
PFont p;
PFont title;
PFont dfFacil;
PFont dfMedio;
PFont dfDificil;
String headline = "Pontos: ";
String titleText = "Dificuldade";
String txtFacil = "Aperte 'A' para:  Facil";
String txtMedio = "Aperte 'B' para:  Medio";
String txtDificil = "Aperte 'C' para:  Dificil";
String txtJogarNovamente = "Aperte 'S' para jogar novamente";
String pts;
PImage invader;
PImage invader2;
PImage invader3;
PImage spaceship;
PImage tiro;

void setup(){
  size(800, 600);
  background(0, 0, 0);
  speed = 30;
  pontos = 0;
  gameState = 1;
  pts = str(pontos);
  x = width/2;
  y = height -40;
  f = createFont ("Arial", 16, true);
  atirando = false;
  space = false;
  canShoot = true;
  enemyshoot = true;
  inimigo = new Enemy(250, 300);
  player = new Player();
  bullet1 = new ArrayList();
  be = new ArrayList();
  arrShield = new ArrayList();
  inimi = new Enemy[10];
  inimibeta = new EnemyBeta[10];
  inimigama = new EnemyGama[10];
  inimigama2 = new EnemyGama[10];
  inimigama3 = new EnemyGama[10];
  shield = new Shield[5];
  linhas = 3;
  colunas = 5;
  initxColuna = 100;
  initxLinha = 50;
  totalEnemy = 10;
  m = 0;
  last = 0;
  numero = 10;
  
  inimiLeft = false;
  hard = false;
  lives = 3;
  invader = loadImage("invader.png");
  invader2 = loadImage("invader2.png");
  invader3 = loadImage("invader3.png");
  spaceship = loadImage("spaceship.png");
  tiro = loadImage("tiro.png");
  tiro.resize(10, 10);

 
  tamanhoAlien = 30;
  espacamento = 15;
  enemyshoot = true; 
  posicaox = 1;
  posicaoy = 1;
  incremento = 1;
  shieldX = width /8;
  
  a = false;
  b = false;
  c = false;
  s = false;
  
  resetEnemy();
  arrShieldDesenha();

 
  
}

void draw(){
  if (gameState == 1){
    arrShieldDesenha();
    resetPosition();
    resetBullets();
    resetEnemy();
    resetStats();
    menu();
  }
  
  
  if (gameState == 2){
    
    background(0, 0, 0);
    textFont(f, 16);
    textAlign(LEFT);
    text(str(pontos), 100, 50);
    textFont(f, 25);
    textAlign(CENTER);
    text("Facil", width/2, 50);
    textFont(f, 16);
    textAlign(RIGHT);
    text(str(lives), 750, 50);
    textFont(f, 16);
    textAlign(RIGHT);
    text("Vidas: ", 700, 50);
  
    player.Display();
    createEnemy();
    shootRate(1);
    createArrShield();
    
    if (enemyshoot){
        rand = (int)random(0, 10);
        if (inimibeta[(int)rand].fora == false){
          BulletEnemy b = new BulletEnemy(inimibeta[(int)rand].posx + 16, inimibeta[(int)rand].posy);
          b.setPower(1);
          be.add(b);
          enemyshoot = false;
        }   
    }
    if (enemyshoot){
        rand = (int)random(0, 10);
        if (inimi[(int)rand].fora == false){
          BulletEnemy bb = new BulletEnemy(inimi[(int)rand].posx + 8, inimi[(int)rand].posy);
          bb.setPower(1);
          be.add(bb);
          enemyshoot = false;
        }   
    }
    if (enemyshoot){
      rand = (int)random(0, 10);
  
      if (inimigama[(int)rand].fora == false){
        BulletEnemy bbb = new BulletEnemy(inimigama[(int)rand].posx + 16, inimigama[(int)rand].posy);
        bbb.setPower(1);
        be.add(bbb);
        enemyshoot = false;
      }
    }
    if (enemyshoot){
      rand = (int)random(0, 10);
  
      if (inimigama2[(int)rand].fora == false){
        BulletEnemy bbbb = new BulletEnemy(inimigama2[(int)rand].posx + 16, inimigama2[(int)rand].posy);
        bbbb.setPower(1);
        be.add(bbbb);
        enemyshoot = false;
      }
    }
    if (enemyshoot){
      rand = (int)random(0, 10);
  
      if (inimigama3[(int)rand].fora == false){
        BulletEnemy bbbbb = new BulletEnemy(inimigama3[(int)rand].posx + 16, inimigama3[(int)rand].posy);
        bbbbb.setPower(1);
        be.add(bbbbb);
        enemyshoot = false;
      }
    }
  
    for (BulletEnemy b: be){
      b.display();
      b.start();
      b.update(); 
    }
    
    if (space && canShoot){ //<>//
      Bullet b = new Bullet(player.x + 12, y);
      bullet1.add(b);
      canShoot = false;
      if (millis() > 1000){
        canShoot = true;
      }
    } 
    
    
    for (Bullet b: bullet1){
      b.display();
      b.start();
      b.update();
    }
    for (Bullet b: bullet1){
      for (Enemy e: inimi){
        if (b.x > e.posx && b.x < e.posx + e.w && b.y > e.posy && b.y < e.posy + e.h){
          e.isHitten(1);
          e.update();
          if (e.fora == true){
            full_enemy--;
            pontos += e.pt;
          }
          b.reset();
          println(pontos);
          println(e.hp);
          updatePts(pontos);
        }
      }
    }
    for (Bullet b: bullet1){
      for (EnemyBeta e: inimibeta){
        if (b.x > e.posx && b.x < e.posx + e.w && b.y > e.posy && b.y < e.posy + e.h){
          e.isHitten(1);
          e.update();
          if (e.fora == true){
            full_enemy--;
            pontos += e.pt;
          }
          b.reset();
          println(pontos);
          println(e.hp);
          updatePts(pontos); 
        }
      }
    }
    for (Bullet b: bullet1){
      for (EnemyGama e: inimigama){
        if (b.x > e.posx && b.x < e.posx + e.w && b.y > e.posy && b.y < e.posy + e.h){
          e.isHitten(1);
          e.update();
          if (e.fora == true){
            full_enemy--;
            pontos += e.pt;
          }
          b.reset();
          println(pontos);
          println(e.hp);
          updatePts(pontos); 
        }
      }
    }
    for (Bullet b: bullet1){
      for (EnemyGama e: inimigama2){
        if (b.x > e.posx && b.x < e.posx + e.w && b.y > e.posy && b.y < e.posy + e.h){
          e.isHitten(1);
          e.update();
          if (e.fora == true){
            full_enemy--;
            pontos += e.pt;
          }
          b.reset();
          println(pontos);
          println(e.hp);
          updatePts(pontos);
          
        }
      }
    }
    for (Bullet b: bullet1){
      for (EnemyGama e: inimigama3){
        if (b.x > e.posx && b.x < e.posx + e.w && b.y > e.posy && b.y < e.posy + e.h){
          e.isHitten(1);
          e.update();
          if (e.fora == true){
            full_enemy--;
            pontos += e.pt;
          }
          b.reset();
          println(pontos);
          println(e.hp);
          updatePts(pontos);
          
        }
      }
    }
    
    for (BulletEnemy b : be){
      for (Shield s : arrShield){
        if (b.x > s.x && b.x < s.x + 100 && b.y > s.y && b.y < s.y + 25){
          s.isHitten();
          s.update();
          b.reset();
        }
      }
    }
    
    for (BulletEnemy b: be){
      if (b.x > player.x && b.x < player.x + player.size && b.y > player.y && b.y < player.y + 15){
        b.reset();
        player.reset();
        lives--;
        noLives();
      } 
    }
    
    if (full_enemy == 0){
      println("you win");
      full_enemy = 1;
      gameState = 5;
    }
    
    textFont(f, 16);
    textAlign(LEFT);
    text(headline, 30, 50);
    }
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (gameState == 3){
      background(0, 0, 0);
      textFont(f, 16);
      textAlign(LEFT);
      text(str(pontos), 100, 50);
      textFont(f, 25);
      textAlign(CENTER);
      text("Medio", width/2, 50);
      textFont(f, 16);
      textAlign(RIGHT);
      text(str(lives), 750, 50);
      textFont(f, 16);
      textAlign(RIGHT);
      text("Vidas: ", 700, 50);
    
    
    
      player.Display();
      createArrShield();
      createEnemy();
      shootRate(0.5);
    
      if (enemyshoot){
        rand = (int)random(0, 10);
        if (inimibeta[(int)rand].fora == false){
          BulletEnemy b = new BulletEnemy(inimibeta[(int)rand].posx + 16, inimibeta[(int)rand].posy);
          b.setPower(2);
          be.add(b);
          enemyshoot = false;
        }   
      }
      if (enemyshoot){
        rand = (int)random(0, 10);
        if (inimi[(int)rand].fora == false){
          BulletEnemy bb = new BulletEnemy(inimi[(int)rand].posx + 8, inimi[(int)rand].posy);
          bb.setPower(2);
          be.add(bb);
          enemyshoot = false;
        }   
    }
    if (enemyshoot){
      rand = (int)random(0, 10);
  
      if (inimigama[(int)rand].fora == false){
        BulletEnemy bbb = new BulletEnemy(inimigama[(int)rand].posx + 16, inimigama[(int)rand].posy);
        bbb.setPower(2);
        be.add(bbb);
        enemyshoot = false;
      }
    }
    if (enemyshoot){
      rand = (int)random(0, 10);
  
      if (inimigama2[(int)rand].fora == false){
        BulletEnemy bbbb = new BulletEnemy(inimigama2[(int)rand].posx + 16, inimigama2[(int)rand].posy);
        bbbb.setPower(2);
        be.add(bbbb);
        enemyshoot = false;
      }
    }
    if (enemyshoot){
      rand = (int)random(0, 10);
  
      if (inimigama3[(int)rand].fora == false){
        BulletEnemy bbbbb = new BulletEnemy(inimigama3[(int)rand].posx + 16, inimigama3[(int)rand].posy);
        bbbbb.setPower(2);
        be.add(bbbbb);
        enemyshoot = false;
      }
    }
  
    for (BulletEnemy b: be){
      b.display();
      b.start();
      b.update(); 
    }
    
    
    if (space && canShoot){
      Bullet b = new Bullet(player.x + 12, y);
      bullet1.add(b);
      canShoot = false;
      if (millis() > 1000){
        canShoot = true;
      }
    } 
    
    
    for (Bullet b: bullet1){
      b.display();
      b.start();
      b.update();
    }
    for (Bullet b: bullet1){
      for (Enemy e: inimi){
        if (b.x > e.posx && b.x < e.posx + e.w && b.y > e.posy && b.y < e.posy + e.h){
          e.isHitten(0.5);
          e.update();
          if (e.fora == true){
            full_enemy--;
            pontos += e.pt;
          }
          b.reset();
          
          println(pontos);
          println(e.hp);
          updatePts(pontos);
        }
      }
    }
    for (Bullet b: bullet1){
      for (EnemyBeta e: inimibeta){
        if (b.x > e.posx && b.x < e.posx + e.w && b.y > e.posy && b.y < e.posy + e.h){
          e.isHitten(0.5);
          e.update();
          if (e.fora == true){
            full_enemy--;
            pontos += e.pt;
          }
          b.reset();
          
          println(pontos);
          println(e.hp);
          updatePts(pontos);
          
        }
      }
    }
    for (Bullet b: bullet1){
      for (int r = 0; r < inimigama.length; r++){
        if (b.x > inimigama[r].posx && b.x < inimigama[r].posx + inimigama[r].w && b.y > inimigama[r].posy && b.y < inimigama[r].posy + inimigama[r].h){
          inimigama[r].isHitten(0.5);
          inimigama[r].update();
          if (inimigama[r].fora == true){
            full_enemy--;
            pontos += inimigama[r].pt;
          }
          b.reset();
          println(inimigama[r].hp);
          println(pontos);
          updatePts(pontos);
          
        }
      }
    }
    for (Bullet b: bullet1){
      for (EnemyGama e: inimigama2){
        if (b.x > e.posx && b.x < e.posx + e.w && b.y > e.posy && b.y < e.posy + e.h){
          e.isHitten(0.5);
          e.update();
          if (e.fora == true){
            full_enemy--;
            pontos += e.pt;
          }
          b.reset();
          println(pontos);
          println(e.hp);
          updatePts(pontos);
          
        }
      }
    }
    for (Bullet b: bullet1){
      for (EnemyGama e: inimigama3){
        if (b.x > e.posx && b.x < e.posx + e.w && b.y > e.posy && b.y < e.posy + e.h){
          e.isHitten(0.5);
          e.update();
          if (e.fora == true){
            full_enemy--;
            pontos += e.pt;
          }
          b.reset();
          println(pontos);
          println(e.hp);
          updatePts(pontos);
          
        }
      }
    }
    
    
    for (BulletEnemy b : be){
      for (Shield s : arrShield){
        if (b.x > s.x && b.x < s.x + 100 && b.y > s.y && b.y < s.y + 25){
          s.isHitten();
          s.update();
          b.reset();
        }
      }
    }
    for (BulletEnemy b: be){
      if (b.x > player.x && b.x < player.x + player.size && b.y > player.y && b.y < player.y + 15){
        println("você perdeu noooooooooooob");
        b.reset();
        player.reset();
        lives--;
        noLives();
      } 
    }
    if (full_enemy == 0){
      println("you win");
      full_enemy = 1;
      gameState = 5;
    }
    
    textFont(f, 16);
    textAlign(LEFT);
    text(headline, 30, 50);
    }
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    if (gameState == 4){
      background(0, 0, 0);
      textFont(f, 16);
      textAlign(LEFT);
      text(str(pontos), 100, 50);
      textFont(f, 25);
      textAlign(CENTER);
      text("Dificil", width/2, 50);
      textFont(f, 16);
      textAlign(RIGHT);
      text(str(lives), 750, 50);
      textFont(f, 16);
      textAlign(RIGHT);
      text("Vidas: ", 700, 50);
    
    
      
      player.Display();
      createArrShield();
      
      for (int index = 0; index < arrShield.size(); index++){
        if (index == 0 || index == 1 || index == 3 || index == 4){
          arrShield.get(index).destroyed();
        } 
      }

      createEnemy();
      shootRate(0.2);
    
    
      if (enemyshoot){
        rand = (int)random(0, 10);
        if (inimibeta[(int)rand].fora == false){
          BulletEnemy b = new BulletEnemy(inimibeta[(int)rand].posx + 16, inimibeta[(int)rand].posy);
          b.setPower(3);
          be.add(b);
          enemyshoot = false;
        }   
      }
      if (enemyshoot){
        rand = (int)random(0, 10);
        if (inimi[(int)rand].fora == false){
          BulletEnemy bb = new BulletEnemy(inimi[(int)rand].posx + 8, inimi[(int)rand].posy);
          bb.setPower(3);
          be.add(bb);
          enemyshoot = false;
        }   
      }
      if (enemyshoot){
        rand = (int)random(0, 10);
  
          if (inimigama[(int)rand].fora == false){
            BulletEnemy bbb = new BulletEnemy(inimigama[(int)rand].posx + 16, inimigama[(int)rand].posy);
            bbb.setPower(3);
            be.add(bbb);
            enemyshoot = false;
          }
        }
      if (enemyshoot){
      rand = (int)random(0, 10);
  
      if (inimigama2[(int)rand].fora == false){
        BulletEnemy bbbb = new BulletEnemy(inimigama2[(int)rand].posx + 16, inimigama2[(int)rand].posy);
        bbbb.setPower(3);
        be.add(bbbb);
        enemyshoot = false;
      }
    }
    if (enemyshoot){
      rand = (int)random(0, 10);
  
      if (inimigama3[(int)rand].fora == false){
        BulletEnemy bbbbb = new BulletEnemy(inimigama3[(int)rand].posx + 16, inimigama3[(int)rand].posy);
        bbbbb.setPower(3);
        be.add(bbbbb);
        enemyshoot = false;
      }
    }
  
      for (BulletEnemy b: be){
        b.display();
        b.start();
        b.update(); 
      }
    
      if (space && canShoot){
        Bullet b = new Bullet(player.x + 12, y);
        bullet1.add(b);
        canShoot = false;
        if (millis() > 1000){
          canShoot = true;
        }
      } 
    
    
      for (Bullet b: bullet1){
        b.display();
        b.start();
        b.update();
      }
      for (Bullet b: bullet1){
        for (Enemy e: inimi){
          if (b.x > e.posx && b.x < e.posx + e.w && b.y > e.posy && b.y < e.posy + e.h){
            e.isHitten(0.2);
            e.update();
            if (e.fora == true){
              full_enemy--;
              pontos += e.pt;
            }
            b.reset();
          
            println(pontos);
            println(e.hp);
            updatePts(pontos);
          }
        }
      }
      for (Bullet b: bullet1){
        for (EnemyBeta e: inimibeta){
          if (b.x > e.posx && b.x < e.posx + e.w && b.y > e.posy && b.y < e.posy + e.h){
            e.isHitten(0.2);
            e.update();
            if (e.fora == true){
              full_enemy--;
              pontos += e.pt;
            }
            b.reset();
            
            println(pontos);
            println(e.hp);
            updatePts(pontos);
            
          }
        }
      }
      for (Bullet b: bullet1){
        for (EnemyGama e: inimigama){
          if (b.x > e.posx && b.x < e.posx + e.w && b.y > e.posy && b.y < e.posy + e.h){
            e.isHitten(0.2);
            
            e.update();
            if (e.fora == true){
              full_enemy--;
              pontos += e.pt;
            }
            b.reset();
          
            println(pontos);
            println(e.hp);
            updatePts(pontos);
          
            }
          }
        }
       for (Bullet b: bullet1){
      for (EnemyGama e: inimigama2){
        if (b.x > e.posx && b.x < e.posx + e.w && b.y > e.posy && b.y < e.posy + e.h){
          e.isHitten(0.2);
          e.update();
          if (e.fora == true){
            full_enemy--;
            pontos += e.pt;
          }
          b.reset();
          println(pontos);
          println(e.hp);
          updatePts(pontos);
          
        }
      }
    }
    for (Bullet b: bullet1){
      for (EnemyGama e: inimigama3){
        if (b.x > e.posx && b.x < e.posx + e.w && b.y > e.posy && b.y < e.posy + e.h){
          e.isHitten(0.2);
          e.update();
          if (e.fora == true){
            full_enemy--;
            pontos += e.pt;
          }
          b.reset();
          println(pontos);
          println(e.hp);
          updatePts(pontos);
          
        }
      }
    }
    
    for (BulletEnemy b : be){
      for (Shield s : arrShield){
        if (b.x > s.x && b.x < s.x + 100 && b.y > s.y && b.y < s.y + 25){
          s.isHitten();
          s.update();
          b.reset();
        }
      }
    }
      for (BulletEnemy b: be){
        if (b.x > player.x && b.x < player.x + player.size && b.y > player.y && b.y < player.y + 15){
          println("você perdeu noooooooooooob");
          player.reset();
          lives--;
          noLives();
          b.reset();
        } 
      }
     
      if (full_enemy == 0){
        println("you win");
        full_enemy = 1;
        gameState = 5;
      }
    
      textFont(f, 16);
      textAlign(LEFT);
      text(headline, 30, 50);
      }
    
      if (gameState == 5){
        background(0);
        textFont(f, 30);
        textAlign(CENTER);
        text("VITÓRIA", 380, 100);
        textFont(f, 25);
        textAlign(CENTER);
        text("Pontuação: " + str(pontos), 380, 200);
        textFont(f, 25);
        textAlign(CENTER);
        text(txtJogarNovamente, 380, 280);
        arrShield.clear();
        shieldX = width/8;
      }
      if (gameState == 6){
        background(0);
        textFont(f, 30);
        textAlign(CENTER);
        text("DERROTA", 380, 100);
        textFont(f, 25);
        textAlign(CENTER);
        text(txtJogarNovamente, 380, 280); 
        arrShield.clear();
        shieldX = width/8;
      }
  }


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void novoMenu(){
  
}

void endGame(){
  gameState = 6;
}

void finishAlien(){
  for (Enemy e: inimi){
    for (EnemyBeta f: inimibeta){
      for (EnemyGama g: inimigama){
        for (EnemyGama h: inimigama2){
          for (EnemyGama j: inimigama3){
            
            if (e.posy >= player.y-30 || f.posy >= player.y-30 || g.posy >= player.y-30 || h.posy >= player.y-30 || j.posy >= player.y-30){
              endGame();
            }
          }
        }
      }
    }
  }
}

void noLives(){
  if (lives == 0){
    endGame();
  }
}

void resetPosition(){
  player.reset();
}


void arrShieldDesenha(){
  full_shield = 0;
  
  if (arrShield.size() < 5){
    Shield arrS = new Shield(shieldX, 450);
    arrShield.add(arrS);
    shieldX += 130;
    full_shield++;
  }else{
    
  }
  /*
  
  while (full_shield < 6){
    Shield arrS = new Shield(shieldX, 450);
    arrShield.add(arrS);
    shieldX += 130;
    full_shield++;
  }*/
  

  
}

void resetArrShield(){
  arrShield.clear();
}

void createArrShield(){
  for (Shield r : arrShield){
    fill(0, 255, 0);
    r.desenha();
  }
}

void resetBullets(){
  for (Bullet b: bullet1){
    b.reset();
  }
  bullet1.clear();
}

void createShield(){
  for (r = 0; r < 5; r++){
    fill(0, 255, 0);
    shield[r].desenha();
      
    }
}

void resetShield(){
  for (int a = 0; a < 5; a++){
    shield[a] = new Shield(shieldX, 450);
    shieldX += 130;
  }
}

void resetStats(){
  lives = 3;
  pontos = 0;
}

void resetEnemy(){
  full_enemy = 0;
  for (int a = 0; a < totalEnemy; a++){
    inimi[a] = new Enemy(initxLinha + (initxLinha * a) + espacamento + tamanhoAlien, initxColuna);
    full_enemy++;
    inimibeta[a] = new EnemyBeta(initxLinha + (initxLinha * a) + espacamento + tamanhoAlien, initxColuna+50);
    full_enemy++;
    inimigama[a] = new EnemyGama(initxLinha + (initxLinha * a) + espacamento + tamanhoAlien, initxColuna+100 );
    full_enemy++;
    inimigama2[a] = new EnemyGama(initxLinha + (initxLinha * a) + espacamento + tamanhoAlien, initxColuna +150);
    full_enemy++;
    inimigama3[a] = new EnemyGama(initxLinha + (initxLinha * a) + espacamento + tamanhoAlien, initxColuna +200);
    full_enemy++;
  }
}


void createEnemy(){
  for (r = 0; r < inimigama.length; r++){
        inimi[r].Display();
        inimibeta[r].Display();
        inimigama[r].Display();
        inimigama2[r].Display();
        inimigama3[r].Display();
        
        if (gameState == 2){
          inimi[r].move(0.3);
          inimibeta[r].move(0.3);
          inimigama[r].move(0.3);
          inimigama2[r].move(0.3);
          inimigama3[r].move(0.3);
          finishAlien();
        }
        if (gameState == 3){
          inimi[r].move(0.8);
          inimibeta[r].move(0.8);
          inimigama[r].move(0.8);
          inimigama2[r].move(0.8);
          inimigama3[r].move(0.8);
          finishAlien();
        }
        if (gameState == 4){
          inimi[r].move(1.3);
          inimibeta[r].move(1.3);
          inimigama[r].move(1.3);
          inimigama2[r].move(1.3);
          inimigama3[r].move(1.3);
          finishAlien();
        }
        if (inimi[r].posx >= 720 || inimibeta[r].posx >= 720 || inimigama[r].posx >= 720 || inimigama2[r].posx >= 720 || inimigama3[r].posx >= 720){
          for (int y = 0; y < inimigama.length; y++){
            inimi[y].moveBaixo();
            inimibeta[y].moveBaixo();  
            inimigama[y].moveBaixo();
            inimigama2[y].moveBaixo();
            inimigama3[y].moveBaixo();
          }
        }else{
              if (inimi[r].posx <= 50 || inimibeta[r].posx <= 50 ||inimigama[r].posx <= 50 || inimigama2[r].posx <= 50 || inimigama3[r].posx <= 50){
                for (int fy = 0; fy < inimigama.length; fy++){
                  inimi[fy].moveBaixoInverso();
                  inimibeta[fy].moveBaixoInverso();
                  inimigama[fy].moveBaixoInverso();
                  inimigama2[fy].moveBaixoInverso();
                  inimigama3[fy].moveBaixoInverso();
              }
        }
      }
    }
}

void shootRate(float dificuldade){
  
  m = millis() - last;
    if (millis() > last + dificuldade * 1000){
      last = millis();
      enemyshoot = true;
    }
}


void updatePts(int p){
  textFont(f, 16);
  textAlign(LEFT);
  text(str(p), 100, 50);
}

void menu(){
  background(0);
  textFont(f, 30);
  textAlign(CENTER);
  text(titleText,380, 100);
  textFont(f, 25);
  textAlign(CENTER);
  text(txtFacil, 380, 200);
  textFont(f, 25);
  textAlign(CENTER);
  text(txtMedio, 380, 240);
  textFont(f, 25);
  textAlign(CENTER);
  text(txtDificil, 380, 280);
  
  if (a == true){
    gameState = 2;
  }
  if (b == true){
    gameState = 3;
  }
  if (c == true){
    gameState = 4;
  }
}



void keyPressed(){
  switch(keyCode){
    case 32:
      space = true;
      break;
    case LEFT:
      left = true;
      player.moveLeft();
      break;
    case RIGHT:
      right = true;
      player.moveRight();
      break;
    case 'a':
      a = true;
      break;
    case 'A':
      a = true;
      break;
    case 'b':
      b = true;
      break;
    case 'B':
      b = true;
      break;
    case 'c':
      c = true;
      break;
    case 'C':
      c = true;
      break;
    case 's':
      gameState = 1;
      break;
    case 'S':
      gameState = 1;
  }

 
}
void Click()
{
    if (mousePressed)
  {
     if (mouseX < width/2) {
      a = true;
    } else {
      b = true;
    }
  }
}
void keyReleased(){
  switch(keyCode){
    case 32:
      space = false;
      break;
    case 37:
      left = false;
      break;
    case 39:
      right = false;
      break;
    case 'a':
      a = false;
      break;
    case 'A':
      a = false;
      break;
    case 'b':
      b = false;
      break;
    case 'B':
      b = false;
      break;
      case 'c':
      c = false;
      break;
    case 'C':
      c = false;
      break;
  }

}
