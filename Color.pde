enum Color {
  U(255, 255, 255),
  F(255, 0, 0),
  L(0, 255, 0),
  D(255, 255, 0),
  B(255, 128, 0),
  R(0, 0, 255);
  
  int r;
  int g;
  int b;
  
  private Color(int r, int g, int b) {
    this.r = r;
    this.g = g;
    this.b = b;
  }
}
