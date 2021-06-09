// Taken and modified from https://github.com/floboc/tiles-gan/blob/master/dataset/prepare_tiles.pde
ArrayList<PImage> images = new ArrayList

<PImage>();

void setup() 
{
  String input_folder = "C:/Users/gunne/Desktop/Github_Repos/DCGAN/pokedata/front_unprocessed"; //folder containing tilesets (must not contain any other file)
  String output_folder = "C:/Users/gunne/Desktop/Github_Repos/DCGAN/pokedata/front_segmented"; //folder that will contain individual tiles (must exist)
  int size = 65; //Size of each tile (square)
  
  // Load each tileset
  File[] files = listFiles(input_folder);
  for (int i = 0; i < files.length; i++) 
  {
      File f = files[i];    
      println("Processing " + f.getName() + "...");
      if (!f.isDirectory())
      {
          PImage img = loadImage(f.getAbsolutePath());
          int cols = img.width / size;
          int rows = img.height / size;
          for (int c = 0; c < cols; c++)
          {
            for (int r = 0; r < rows; r++)
            {
              PImage tile_img = createImage(size, size, ARGB);
              tile_img.set(0, 0, img.get(c * size, r * size, size-1, size-1));
              
              // Check that the tile is not empty
              color col = tile_img.get(0, 0);
              boolean is_not_empty = false;
              for (int x = 0; x < size; x++)
              {
                for (int y = 0; y < size; y++)
                {
                  if (tile_img.get(x,y) != col)
                  {
                    is_not_empty = true;
                    break;
                  }
                }
                if (is_not_empty)
                  break;
              }
              
              if (is_not_empty)
                tile_img.save(output_folder + "/" + f.getName() + (r * cols + c) + ".png");
            }
          }
      }
  }
  
  println("Done!");
}
