class vec2 {
  float amt, thick;
  PImage img;
  vec2(float amt, PImage img, float thick) {
    this.amt = amt;
    this.img = img;
    this.thick = thick;
  }
  void show() {
    for (int i = 0; i < amt; i++) {
      float posX = random(0, width/2);
      float posY = random(0, height);
      color c = this.img.get(int(map(posX, 0, width/2, 0, img.width)), int(map(posY, 0, height, 0, img.height)));
      stroke(c, 40);
      strokeWeight(thick);
      point(posX, posY);
    }
  }
};
