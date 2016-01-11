public class Vector2D {
  public float x;
  public float y;
  
  public Vector2D(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  
  public float distance(Vector2D to){
    return (float) sqrt(squareDistance(to));
  }
  
  public float squareDistance(Vector2D to){
    return (float) (pow(this.x - to.x, 2) + pow(this.y - to.y, 2));
  }
  
  public Vector2D addScalar(float quantity){
    return new Vector2D(this.x + quantity, this.y + quantity);
  }
  
  public Vector2D addVector(Vector2D vector){
    return new Vector2D(this.x + vector.x, this.y + vector.y);
  }
  
  public Vector2D multiplyScalar(float quantity){
    return new Vector2D(this.x * quantity, this.y * quantity);
  }
  
  public float magnitude(){
    return (float) sqrt(pow(this.x, 2) + pow(this.y, 2));
  }
  
  public Vector2D normalize(){
    float magnitude = this.magnitude();
    if(magnitude == 0){
      return new Vector2D(0, 0);
    }
    return new Vector2D(this.x/magnitude, this.y/magnitude/magnitude);
  }
  
  public float dotProduct(Vector2D vector){
    return (float) (this.x*vector.x + this.y*vector.y);
  }

  
  public boolean isEqual(Vector2D vector){
    return this.x == vector.x && this.y == vector.y;
  }     
  
  public Vector2D multiplyVector(Vector2D vector){
    return new Vector2D(this.x * vector.x, this.y*vector.y);
  }
}