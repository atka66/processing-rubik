abstract class Cube {

  int sideWidth = 80;
  int animationLength = 4;
  
  Block[][][] blocks;
  boolean isAnimating = false;
  int animationRotationAxis = 0;
  int animationCountdown = 0;
  
  abstract void handleKey(char key);
  
  protected Cube(int size) {
    blocks = new Block[size][size][size];
    
    for (int i = 0; i < blocks.length; i++) {
      for (int j = 0; j < blocks[i].length; j++) {
        for (int k = 0; k < blocks[i][j].length; k++) {
          blocks[i][j][k] = new Block(new Color[] {Color.U, Color.F, Color.L, Color.D, Color.B, Color.R});
        }
      }
    }
    
    for (int i = 0; i < blocks.length; i++) {
      for (int j = 0; j < blocks[i].length; j++) {
        for (int k = 0; k < blocks[i][j].length; k++) {
          if (j != 0) {
            blocks[i][j][k].sides[0] = null;
          }
          if (k != 0) {
            blocks[i][j][k].sides[1] = null;
          }
          if (i != 0) {
            blocks[i][j][k].sides[2] = null;
          }
          if (j < blocks[i].length - 1) {
            blocks[i][j][k].sides[3] = null;
          }
          if (k < blocks[i][j].length - 1) {
            blocks[i][j][k].sides[4] = null;
          }
          if (i < blocks.length - 1) {
            blocks[i][j][k].sides[5] = null;
          }
        }
      }
    }
  }

  void animateRotation(boolean notRevert) { // axis: 0=X, 1=Y, 2=Z
    float rotation = (notRevert ? 1 : -1) * (this.animationRotationAxis / 3 == 0 ? 1 : -1) * radians(90) * (float)this.animationCountdown / (float)this.animationLength;
    switch (this.animationRotationAxis % 3) {
      case 0:
        rotateX(rotation);
        break;
      case 1:
        rotateY(rotation);
        break;
      case 2:
        rotateZ(rotation);
        break;
    }
  }
  
  void rotateBlocks(List<Block> blocks, List<Block> optionalBlocks, int[] rotatingSides, int axis) {
    if (!this.isAnimating) {
      // turn on animation
      this.isAnimating = true;
      this.animationRotationAxis = axis;
      this.animationCountdown = this.animationLength;
      for (Block block: blocks) {
          block.isAnimated = true;
      }
      for (Block block: optionalBlocks) {
          block.isAnimated = true;
      }
      // rotate the corresponding sides on every block
      for (Block block : blocks) {    
        Color rotateTmp = block.sides[rotatingSides[0]];
        for (int i = 0; i < rotatingSides.length - 1; i++) {
          block.sides[rotatingSides[i]] = block.sides[rotatingSides[i + 1]];
        }
        block.sides[rotatingSides[rotatingSides.length - 1]] = rotateTmp;
      }
      
      // move the color of the blocks to it's destination block
      int blocksToMove = blocks.size() / 4;
      for (int i = 0; i < blocksToMove; i++) {
        Color[] switchTmp = blocks.get(blocks.size() - 1).sides;
        for (int j = blocks.size() - 1; j > 0; j--) {
          blocks.get(j).sides = blocks.get(j - 1).sides;
        }
        blocks.get(0).sides = switchTmp;
      }
    }
  }

  void drawSide(double[] x, double[] y, double[] z, Color col) {
    if (col == null) {
      fill(0);
    } else {
      fill(col.r, col.g, col.b);
    }
    beginShape();
    vertex((int)(x[0] * sideWidth), (int)(y[0] * sideWidth), (int)(-z[0] * sideWidth));
    vertex((int)(x[1] * sideWidth), (int)(y[1] * sideWidth), (int)(-z[1] * sideWidth));
    vertex((int)(x[2] * sideWidth), (int)(y[2] * sideWidth), (int)(-z[2] * sideWidth));
    vertex((int)(x[3] * sideWidth), (int)(y[3] * sideWidth), (int)(-z[3] * sideWidth));
    endShape(CLOSE);
  }
  
  void drawAnimatingBlock(double x, double y, double z, Block block) {
      animateRotation(true);
      drawBlock(x, y, z, block);
      animateRotation(false);
  }
  
  void drawBlock(double x, double y, double z, Block block) {
    // top
    drawSide(new double[] {x, x + 1, x + 1, x}, new double[] {y, y, y, y}, new double[] {z, z, z + 1, z + 1}, block.sides[0]);
    // front
    drawSide(new double[] {x, x + 1, x + 1, x}, new double[] {y, y, y + 1, y + 1}, new double[] {z, z, z, z}, block.sides[1]);
    // left
    drawSide(new double[] {x, x, x, x}, new double[] {y, y, y + 1, y + 1}, new double[] {z, z + 1, z + 1, z}, block.sides[2]);
    // bottom
    drawSide(new double[] {x, x + 1, x + 1, x}, new double[] {y + 1, y + 1, y + 1, y + 1}, new double[] {z, z, z + 1, z + 1}, block.sides[3]);
    // back
    drawSide(new double[] {x, x + 1, x + 1, x}, new double[] {y, y, y + 1, y + 1}, new double[] {z + 1, z + 1, z + 1, z + 1}, block.sides[4]);
    // right
    drawSide(new double[] {x + 1, x + 1, x + 1, x + 1}, new double[] {y, y, y + 1, y + 1}, new double[] {z, z + 1, z + 1, z}, block.sides[5]);
  }
  
  void drawCube() {
    double cubeOffset = cube.blocks.length / 2.0;
    for (int i = 0; i < cube.blocks.length; i++) {
      for (int j = 0; j < cube.blocks[i].length; j++) {
        for (int k = 0; k < cube.blocks[i][j].length; k++) {
          if (cube.blocks[i][j][k].isAnimated) {
            drawAnimatingBlock(i - cubeOffset, j - cubeOffset, k - cubeOffset, cube.blocks[i][j][k]);
          } else {
            drawBlock(i - cubeOffset, j - cubeOffset, k - cubeOffset, cube.blocks[i][j][k]);
          }
        }
      }
    }
    if (this.animationCountdown > 0) {
      this.animationCountdown--;
    } else {
      this.isAnimating = false;
      for (int i = 0; i < cube.blocks.length; i++) {
        for (int j = 0; j < cube.blocks[i].length; j++) {
          for (int k = 0; k < cube.blocks[i][j].length; k++) {
            cube.blocks[i][j][k].isAnimated = false;
          }
        }
      }
    }
  }
}
