class vec3 {
  float posX, posY, thick, X, Y, r, t, oldt, ct, rt, vmsort = 1, oldct;
  PImage img;
  vec3(float posX, float posY, float t, float ct, float rt, PImage img, float thick) {
    this.posX = posX;
    this.posY = posY;
    this.thick = thick;
    this.img = img;
    this.r = 0;
    this.t = t;
    this.oldt = this.t;
    this.ct = ct;
    this.oldct = ct;
    this.rt = rt;
  }
  void cheak() {
    if ((this.X > width/2 || this.X < 0) || (this.Y > height || this.Y < 0)) {
      this.rt *=-1;
      this.r = this.r+this.rt;
      this.ct = random(0, oldct);
    }
  }
  void update() {
    this.X = this.posX + this.r*cos(this.t);
    this.Y = this.posY + this.r*sin(this.t);
    this.t+=ct;
    if (this.t >= TWO_PI + this.oldt) {
      this.t = this.oldt;
      this.r = this.r+this.rt;
    }
  }
  void show() {
    color c = this.img.get(int(map(this.X, 0, width/2, 0, img.width)), int(map(this.Y, 0, height, 0, img.height)));
    stroke(c);
    strokeWeight(thick);
    point(this.X, this.Y);
  }
};
