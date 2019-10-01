class Cube3 extends Cube {
  
  Cube3 () {
    super(3);
  }
  
  void handleKey(char key) {
    switch(key) {
      case 'q': // L
        cube.rotateBlocks(Arrays.asList(cube.blocks[0][1][0], cube.blocks[0][2][0], cube.blocks[0][2][1], cube.blocks[0][2][2],
          cube.blocks[0][1][2], cube.blocks[0][0][2], cube.blocks[0][0][1], cube.blocks[0][0][0]), Arrays.asList(cube.blocks[0][1][1]), new int[] {4, 3, 1, 0}, 0);
        break;
      case 'a': // L' 
        cube.rotateBlocks(Arrays.asList(cube.blocks[0][0][0], cube.blocks[0][0][1], cube.blocks[0][0][2], cube.blocks[0][1][2],
          cube.blocks[0][2][2], cube.blocks[0][2][1], cube.blocks[0][2][0], cube.blocks[0][1][0]), Arrays.asList(cube.blocks[0][1][1]), new int[] {0, 1, 3, 4}, 3); 
        break;
      case 'w': // F 
        cube.rotateBlocks(Arrays.asList(cube.blocks[0][0][0], cube.blocks[1][0][0], cube.blocks[2][0][0], cube.blocks[2][1][0],
          cube.blocks[2][2][0], cube.blocks[1][2][0], cube.blocks[0][2][0], cube.blocks[0][1][0]), Arrays.asList(cube.blocks[1][1][0]), new int[] {0, 2, 3, 5}, 5);
        break;
      case 's': // F' 
        cube.rotateBlocks(Arrays.asList(cube.blocks[0][1][0], cube.blocks[0][2][0], cube.blocks[1][2][0], cube.blocks[2][2][0],
          cube.blocks[2][1][0], cube.blocks[2][0][0], cube.blocks[1][0][0], cube.blocks[0][0][0]), Arrays.asList(cube.blocks[1][1][0]), new int[] {5, 3, 2, 0}, 2);
        break;
      case 'e': // R 
        cube.rotateBlocks(Arrays.asList(cube.blocks[2][0][0], cube.blocks[2][0][1], cube.blocks[2][0][2], cube.blocks[2][1][2],
          cube.blocks[2][2][2], cube.blocks[2][2][1], cube.blocks[2][2][0], cube.blocks[2][1][0]), Arrays.asList(cube.blocks[2][1][1]), new int[] {1, 3, 4, 0}, 3); 
        break;
      case 'd': // R' 
        cube.rotateBlocks(Arrays.asList(cube.blocks[2][1][0], cube.blocks[2][2][0], cube.blocks[2][2][1], cube.blocks[2][2][2],
          cube.blocks[2][1][2], cube.blocks[2][0][2], cube.blocks[2][0][1], cube.blocks[2][0][0]), Arrays.asList(cube.blocks[2][1][1]), new int[] {0, 4, 3, 1}, 0);
        break;
      case 'r': // B 
        cube.rotateBlocks(Arrays.asList(cube.blocks[0][0][2], cube.blocks[0][1][2], cube.blocks[0][2][2], cube.blocks[1][2][2],
          cube.blocks[2][2][2], cube.blocks[2][1][2], cube.blocks[2][0][2], cube.blocks[1][0][2]), Arrays.asList(cube.blocks[1][1][2]), new int[] {5, 3, 2, 0}, 2); 
        break;
      case 'f': // B' 
        cube.rotateBlocks(Arrays.asList(cube.blocks[1][0][2], cube.blocks[2][0][2], cube.blocks[2][1][2], cube.blocks[2][2][2],
          cube.blocks[1][2][2], cube.blocks[0][2][2], cube.blocks[0][1][2], cube.blocks[0][0][2]), Arrays.asList(cube.blocks[1][1][2]), new int[] {0, 2, 3, 5}, 5); 
        break;
      case 't': // U 
        cube.rotateBlocks(Arrays.asList(cube.blocks[0][0][0], cube.blocks[0][0][1], cube.blocks[0][0][2], cube.blocks[1][0][2],
          cube.blocks[2][0][2], cube.blocks[2][0][1], cube.blocks[2][0][0], cube.blocks[1][0][0]), Arrays.asList(cube.blocks[1][0][1]), new int[] {5, 4, 2, 1}, 1);
        break;
      case 'g': // U' 
        cube.rotateBlocks(Arrays.asList(cube.blocks[1][0][0], cube.blocks[2][0][0], cube.blocks[2][0][1], cube.blocks[2][0][2],
          cube.blocks[1][0][2], cube.blocks[0][0][2], cube.blocks[0][0][1], cube.blocks[0][0][0]), Arrays.asList(cube.blocks[1][0][1]), new int[] {1, 2, 4, 5}, 4); 
        break;
      case 'z': // D 
        cube.rotateBlocks(Arrays.asList(cube.blocks[0][2][0], cube.blocks[1][2][0], cube.blocks[2][2][0], cube.blocks[2][2][1],
          cube.blocks[2][2][2], cube.blocks[1][2][2], cube.blocks[0][2][2], cube.blocks[0][2][1]), Arrays.asList(cube.blocks[1][2][1]), new int[] {1, 2, 4, 5}, 4); 
        break;
      case 'h': // D' 
        cube.rotateBlocks(Arrays.asList(cube.blocks[0][2][1], cube.blocks[0][2][2], cube.blocks[1][2][2], cube.blocks[2][2][2],
          cube.blocks[2][2][1], cube.blocks[2][2][0], cube.blocks[1][2][0], cube.blocks[0][2][0]), Arrays.asList(cube.blocks[1][2][1]), new int[] {5, 4, 2, 1}, 1); 
        break;
    }
  }
}
