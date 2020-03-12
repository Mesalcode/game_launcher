//Sogenannter ,,Flood Fill" Algorithmus
//Autor: philho (http://bazaar.launchpad.net/~philho/+junk/Processing/view/head:/_SmallPrograms/ShowFloodFill/FloodFill.pde)



boolean bWithBorder = false;



/*void mouseReleased()
{
  if (bWithBorder)
  {
    FloodFillWithBorder ff = new FloodFillWithBorder();
    ff.DoFill(
        mouseX, mouseY, // current mouse pos as point object
        GetRandomColor(),
        GetRandomColor()
    );
  }
  else
  {
    FloodFill ff = new FloodFill();
    ff.DoFill(
        mouseX, mouseY, // current mouse pos as point object
        GetRandomColor()
    );
  }
  updatePixels();
}*/



color GetRandomColor()
{
  return 0xFF000000 | (int) random(0x1000000); // random color (need to set alpha too)
}
public class FF
{
  protected int iw; // Image width
  protected int ih; // Image height
  protected color[] imagePixels;
  protected color backColor; // Color found at given position
  protected color fillColor; // Color to apply
  // Stack is almost deprecated and slow (synchronized).
  // I would use Deque but that's Java 1.6, excluding current (mid-2009) Macs...
  protected ArrayList stack = new ArrayList();

  public FF()
  {
    iw = width;
    ih = height;
    imagePixels = pixels; // Assume loadPixels have been done before
  }

  public FF(PImage imageToProcess)
  {
    iw = imageToProcess.width;
    ih = imageToProcess.height;
    imagePixels = imageToProcess.pixels; // Assume loadPixels have been done before if sketch image
  }

  public void DoFill(int startX, int startY, color fc)
  {
    fillColor = fc;
    backColor = imagePixels[startX + startY * iw];
    // don't run if fill color is the same as background one
    if (fillColor == backColor)
      return;

    stack.add(new PVector(startX, startY));
    while (stack.size() > 0)
    {
      PVector p = (PVector) stack.remove(stack.size() - 1);
      // Go left
      FillScanLine((int) p.x, (int) p.y, -1);
      // Go right
      FillScanLine((int) p.x + 1, (int) p.y, 1);
    }
  }

  protected void FillScanLine(int x, int y, int dir)
  {
    // compute current index in pixel buffer array
    int idx = x + y * iw;
    boolean inColorRunAbove = false;
    boolean inColorRunBelow = false;

    // fill until boundary in current scanline...
    // checking neighbouring pixel rows
    while (x >= 0 && x < iw && imagePixels[idx] == backColor)
    {
      imagePixels[idx] = fillColor;
      if (y > 0) // Not on top line
      {
        if (imagePixels[idx - iw] == backColor)
        {
          if (!inColorRunAbove)
          {
            // The above pixel needs to be flooded too, we memorize the fact.
            // Only once per run of pixels of back color (hence the inColorRunAbove test)
            stack.add(new PVector(x, y-1));
            inColorRunAbove = true;
          }
        }
        else // End of color run (or none)
        {
          inColorRunAbove = false;
        }
      }
      if (y < ih - 1) // Not on bottom line
      {
        if (imagePixels[idx + iw] == backColor)
        {
          if (!inColorRunBelow)
          {
            // Idem with pixel below, remember to process there
            stack.add(new PVector(x, y + 1));
            inColorRunBelow = true;
          }
        }
        else // End of color run (or none)
        {
          inColorRunBelow = false;
        }
      }
      // Continue in given direction
      x += dir;
      idx += dir;
    }
  }
}
public class FloodFillWithBorder extends FF
{
  private color borderColor; // Color of border

  public FloodFillWithBorder()
  {
    super();
  }

  public FloodFillWithBorder(PImage imageToProcess)
  {
    super(imageToProcess);
  }

  public void DoFill(int startX, int startY, color fc, color bc)
  {
    // don't run if border color is the same as background one
    if (bc == backColor)
      return;
    borderColor = bc;
    DoFill(startX, startY, fc);
  }

  protected void FillScanLine(int x, int y, int dir)
  {
    // compute current index in pixel buffer array
    int idx = x + y * iw;
    boolean inColorRunAbove = false;
    boolean inColorRunBelow = false;
    int borderIdx = -1;

    // Particular case when start position is just on the left
    // of a boundary
    if (dir < 0 && x < iw - 1 &&
        imagePixels[idx] == backColor &&
        imagePixels[idx + 1] != backColor)
    {
      borderIdx = idx;
    }

    // fill until boundary in current scanline...
    // checking neighbouring pixel rows
    while (x >= 0 && x < iw && imagePixels[idx] == backColor)
    {
      // If we are at a color boundary (in the horizontal axis)
      if (dir < 0 && x > 0 && imagePixels[idx - 1] != backColor ||
          dir > 0 && x < iw - 1 && imagePixels[idx + 1] != backColor)
      {
        // We paint the pixel with the border color
        imagePixels[idx] = borderColor;
      }
      else
      {
        imagePixels[idx] = fillColor;
      }
      if (y > 0) // Not on top line
      {
        if (imagePixels[idx - iw] == backColor)
        {
          if (!inColorRunAbove)
          {
            // The above pixel needs to be flooded too, we memorize the fact.
            // Only once per run of pixels of back color (hence the inColorRunAbove test)
            stack.add(new PVector(x, y-1));
            inColorRunAbove = true;
          }
        }
        else // End of color run (or none)
        {
          inColorRunAbove = false;
          // If the above line is neither of fill color (we are on boundary)
          // nor of border color (it is an already painted border)
          if (imagePixels[idx - iw] != fillColor && imagePixels[idx - iw] != borderColor)
          {
            // We are on a boundary on the vertical axis, paint it
            imagePixels[idx] = borderColor;
          }
        }
      }
      if (y < ih - 1) // Not on bottom line
      {
        if (imagePixels[idx + iw] == backColor)
        {
          if (!inColorRunBelow)
          {
            // Idem with pixel below, remember to process there
            stack.add(new PVector(x, y + 1));
            inColorRunBelow = true;
          }
        }
        else // End of color run (or none)
        {
          inColorRunBelow = false;
          // Same as above with below line
          if (imagePixels[idx + iw] != fillColor && imagePixels[idx + iw] != borderColor)
          {
            imagePixels[idx] = borderColor;
          }
        }
      }
      // Continue in given direction
      x += dir;
      idx += dir;
    }
    if (borderIdx >= 0)
    {
      imagePixels[borderIdx] = borderColor;
    }
  }
}
