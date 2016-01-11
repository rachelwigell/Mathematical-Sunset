public class Star{
  Vector2D position;
  float size;
  
  public Star(){
    this.position = new Vector2D(random(-850, 850), random(-850, 850));
    this.size = random(1, 6);
  }
}