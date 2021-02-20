class vec1 {
  float posX, posY, veloX, veloY, thick;
  PImage img;
  vec1(float posx, float posy, float velox, float veloy, PImage img, float thick) {
    this.posX = posx;
    this.posY = posy;
    this.veloX = velox;
    this.veloY = veloy;
    this.img = img;
    this.thick = thick;
  }
  void cheak() {
    if (this.posX >= width/2 - thick/2|| this.posX <= thick/2) {
      this.veloX *= -1;
    }
    if (this.posY >= height - thick/2|| this.posY <= thick/2) {
      this.veloY *= -1;
    }
  }
  void vecupdate() {
    this.posX += this.veloX;
    this.posY += this.veloY;
  }
  void show() {
    color c = this.img.get(int(map(this.posX, 0, width/2, 0, img.width)), int(map(this.posY, 0, height, 0, img.height)));
    stroke(c);
    strokeWeight(thick);
    point(this.posX, this.posY);
  }
};
