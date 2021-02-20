class vec {
  float posX, posY, velo, veloX, veloY, thick;
  PImage img;
  vec(float posX, float posY, float velo, PImage img, float thick) {
    this.posX = posX;
    this.posY = posY;
    this.velo = velo;
    this.veloX = 0;
    this.veloY = 0;
    this.img = img;
    this.thick = thick;
  }
  void update() {
    float mx = random(1);
    if (mx<=0.25) {
      this.veloX = this.velo;
      this.veloY = 0;
    } else if (mx<= 0.50) {
      this.veloX = -this.velo;
      this.veloY = 0;
    } else if (mx <= 0.75) {
      this.veloX = 0;
      this.veloY = this.velo;
    } else if (mx <= 1) {
      this.veloX = 0;
      this.veloY = -this.velo;
    }
  }
  void cheak() {
    if (this.posX >= width/2 - thick/2|| this.posX <= thick/2) {
      this.veloX *= -1;
    }
    if (this.posY >= height -thick/2|| this.posY <= thick/2) {
      this.veloY *= -1;
    }
  }
  void vecupdate() {
    this.posX += this.veloX;
    this.posY += this.veloY;
  }
  void show() {
    color c = this.img.get(int(map(this.posX, 0, width/2, 0, img.width)), int(map(this.posY, 0, height, 0, img.height)));;
    stroke(c, 40);
    strokeWeight(thick);
    point(this.posX, this.posY);
  }
};
