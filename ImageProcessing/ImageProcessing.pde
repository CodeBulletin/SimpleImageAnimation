int x = 1000;
vec[] v;
vec1[] v1;
vec2 v2;
vec3[] v3;
PImage img;
int stp = 1;
char h = '2';
float pevh, pevw;
void setup() {
  if (h == '1') {
    v = new vec[x];
  } else if (h == '2') {
    v1 = new vec1[x];
  } else if (h == '4') {
    v3 = new vec3[x];
  }
  img = loadImage("image1.jpg");
  size(1000, 500, P2D);
  pevw = width;
  pevh = height;
  if (h == '1') {
    for (int i = 0; i<x; i++) {
      v[i] = new vec(width/4, height/2, random(-3, 3), img, 1);
    }
  } else if (h == '2') {
    for (int i = 0; i<x; i++) {
      v1[i] = new vec1(width/4, height/2, random(-3, 3), random(-3, 3), img, 1);
    }
  } else if (h == '3') {
    v2 = new vec2(x, img, 1);
  } else if (h == '4') {
    for (int i = 0; i<x; i++) {
      v3[i] = new vec3(random(0, width/2), random(0, height), random(0, TWO_PI), random(0, PI/16), random(0, 1), img, 1);
    }
  }
  background(255);
}

void keyPressed() {
  if (key == 'r') {
    stp = 1;
    setup();
  }
  if (key == 'p') {
    stp = 0;
  }
  if (key == 'o') {
    stp = 1;
  }
  if (key == 's') {
    save("image.jpg");
  }
  if (key == '1') {
    h = '1';
    setup();
  }
  if (key == '2') {
    h = '2';
    setup();
  }
  if (key == '3') {
    h = '3';
    setup();
  }
  if (key == '4') {
    h = '4';
    setup();
  }
}
void cheakupdate(float a, float b) {
  if (a != pevw || b != pevh) {
    pevw = a;
    pevh = b;
    setup();
  }
}
void draw() {
  cheakupdate(width, height);
  println(frameRate);
  if (stp == 1) {
    if (h == '1') {
      for (vec vo : v) {
        vo.update();
      }
      for (int i = 0; i<300; i++) {
        for (vec vo : v) {
          vo.cheak();
          vo.vecupdate();
          vo.show();
        }
      }
    } else if (h == '2') {
      for (vec1 vo : v1) {
        vo.cheak();
        vo.vecupdate();
        vo.show();
      }
    } else if (h == '3') {
      v2.show();
    } else if (h == '4') {
      for (vec3 vo : v3) {       
        for (int i = 0; i<300; i++) {
          vo.cheak();
          vo.update();
          vo.show();
        }
      }
    }
    image(img, width/2, 0, width/2, height);
  }
}
