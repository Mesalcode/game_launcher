/*
MIT License

Copyright (c) 2020 Alexander Mertens

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/
class Camera{
  MesalAPI.Position position;
  Camera(MesalAPI.Position position){
    this.position = position;
  }
  void arrange(){ 
    api._camera(position);
  }
  void assignCenter(MesalAPI.Position newCenter){
    position = newCenter.y+displayHeight/2<=gWorldBorderY&newCenter.y-displayHeight/2>=0 ? newCenter.clone() : position;
  }
  
  void moveY(int by){
    position.changeCoordinatesBy(position.y+displayHeight/2+by<=gWorldBorderY&position.y-displayWidth/2+by>=0 ? by : 0, 0.0);
  }
}
