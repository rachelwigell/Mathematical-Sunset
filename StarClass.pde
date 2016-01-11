public class Star{
  Vector2D position;
  float size;
  
  public Star(){
    this.position = new Vector2D(random(-600, 600), random(-600, 600));
    this.size = random(1, 6);
  }
}