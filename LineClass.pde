public class Line {
  Vector2D start;
  Vector2D end;
  float length;
  
  public Line(Vector2D start, Vector2D end){
    this.start = new Vector2D(start.x, start.y);
    this.end = new Vector2D(end.x, end.y);
    this.length = end.distance(start);
  }
  
  public void drawLine(PApplet visual){
    visual.line(start.x, start.y, end.x, end.y);
  }
  
  public Vector2D getPointWithThisY(float y){
    float percent = (y-start.y)/(end.y-start.y);
    float x = percent*(end.x-start.x)+start.x;
    return new Vector2D(x, y);
  }
}