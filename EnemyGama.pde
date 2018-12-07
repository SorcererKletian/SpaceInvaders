class EnemyGama{
  
  float posx, posy;
  float edgeLeft = 50;
  float edgeRight = 750;
  float speed;
  float hp;
  Boolean right;
  Boolean hitbox;
  float w;
  float h;
  float pt;
  Boolean fora;
  Boolean left;
  Boolean move;
  Boolean isHit;
  Boolean easy, medium, hard;
  
  EnemyGama(){
    
  }
  
  EnemyGama(float x, float y){
    this.posx = x;
    this.posy = y;
    this.w = 40;
    this.h = 25;
    this.pt = 50;
    this.fora = false;
    this.hp = 1;
    left = false;
    move = true;
    this.isHit = false; 
  }
  
  void Display(){
    image(invader3, posx, posy, w, h);
    
    
  }
  float getX(){
    return this.posx;
  }
  float getY(){
    return this.posy;
  }
  
  void remove(){
      this.posy = -50000;
      this.fora = true;
      this.move = false;
    
  }
  
  void isHitten(float b){
    isHit = true;
    if (this.isHit == true){
      this.hp = this.hp - b;
      isHit = false;
    }
  }
  
  void move(float tf){
    this.setDificulty(tf);
    if (!left && move){
      posx += speed + tf;
    }
    if (left && move){
      posx -= speed + tf;
    }   
  }
  void setDificulty(float df){
    if (df == 1){
      easy = true;
    }
    if (df == 2){
      medium = true;
    }
    if (df == 3){
      hard = true;
    }
  }
  
  void update(){
    if (this.hp <= 0){
      this.remove();
    }
  }

    void updateHp(){
    isHit = true;
    this.hp = hp - 1;
    isHit = false;
  }
  
  void moveBaixo(){
      left = true;
      posy += 20;
  }
  void moveBaixoInverso(){
    left = false;
    posy += 20;
  }
  
}