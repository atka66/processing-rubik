class Cube2 extends Cube { 
  
  Cube2 () {
    super(2);
  }
  
  void handleKey(char key) {
    switch(key) {
      case 'q': // L
        cube.rotateBlocks(Arrays.asList(cube.blocks[0][1][0], cube.blocks[0][1][1], cube.blocks[0][0][1], cube.blocks[0][0][0]),
          new ArrayList<Block>(), new int[] {4, 3, 1, 0}, 0);
        break;
      case 'a': // L' 
        cube.rotateBlocks(Arrays.asList(cube.blocks[0][0][0], cube.blocks[0][0][1], cube.blocks[0][1][1], cube.blocks[0][1][0]),
          new ArrayList<Block>(), new int[] {0, 1, 3, 4}, 3); 
        break;
      case 'w': // F 
        cube.rotateBlocks(Arrays.asList(cube.blocks[0][0][0], cube.blocks[1][0][0], cube.blocks[1][1][0], cube.blocks[0][1][0]),
          new ArrayList<Block>(), new int[] {0, 2, 3, 5}, 5);
        break;
      case 's': // F' 
        cube.rotateBlocks(Arrays.asList(cube.blocks[0][1][0], cube.blocks[1][1][0], cube.blocks[1][0][0], cube.blocks[0][0][0]),
          new ArrayList<Block>(), new int[] {5, 3, 2, 0}, 2);
        break;
      case 'e': // R 
        cube.rotateBlocks(Arrays.asList(cube.blocks[1][0][0], cube.blocks[1][0][1], cube.blocks[1][1][1], cube.blocks[1][1][0]),
          new ArrayList<Block>(), new int[] {1, 3, 4, 0}, 3); 
        break;
      case 'd': // R' 
        cube.rotateBlocks(Arrays.asList(cube.blocks[1][1][0], cube.blocks[1][1][1], cube.blocks[1][0][1], cube.blocks[1][0][0]),
          new ArrayList<Block>(), new int[] {0, 4, 3, 1}, 0);
        break;
      case 'r': // B 
        cube.rotateBlocks(Arrays.asList(cube.blocks[0][0][1], cube.blocks[0][1][1], cube.blocks[1][1][1], cube.blocks[1][0][1]),
          new ArrayList<Block>(), new int[] {5, 3, 2, 0}, 2); 
        break;
      case 'f': // B' 
        cube.rotateBlocks(Arrays.asList(cube.blocks[1][0][1], cube.blocks[1][1][1], cube.blocks[0][1][1], cube.blocks[0][0][1]),
          new ArrayList<Block>(), new int[] {0, 2, 3, 5}, 5); 
        break;
      case 't': // U 
        cube.rotateBlocks(Arrays.asList(cube.blocks[0][0][0], cube.blocks[0][0][1], cube.blocks[1][0][1], cube.blocks[1][0][0]),
          new ArrayList<Block>(), new int[] {5, 4, 2, 1}, 1);
        break;
      case 'g': // U' 
        cube.rotateBlocks(Arrays.asList(cube.blocks[1][0][0], cube.blocks[1][0][1], cube.blocks[0][0][1], cube.blocks[0][0][0]),
          new ArrayList<Block>(), new int[] {1, 2, 4, 5}, 4); 
        break;
      case 'z': // D 
        cube.rotateBlocks(Arrays.asList(cube.blocks[0][1][0], cube.blocks[1][1][0], cube.blocks[1][1][1], cube.blocks[0][1][1]),
          new ArrayList<Block>(), new int[] {1, 2, 4, 5}, 4); 
        break;
      case 'h': // D' 
        cube.rotateBlocks(Arrays.asList(cube.blocks[1][1][0], cube.blocks[0][1][0], cube.blocks[0][1][1], cube.blocks[1][1][1]),
          new ArrayList<Block>(), new int[] {5, 4, 2, 1}, 1); 
        break;
    }
  }
}
