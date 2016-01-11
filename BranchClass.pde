public class Branch {
  Branch root;
  Line path;
  int numBranches;
  Branch[] branches;
  int level;
  int endLevel;
  int faces;
  
  public Branch(){
    float xPos = random(200, 1000);
    this.path = new Line(new Vector2D(xPos, 650), new Vector2D(xPos + random(-10, 10), 650-random(300, 400)));
    this.numBranches = 8;
    this.endLevel = 4;
    this.level = 1;
    this.branches = new Branch[numBranches];
    for(int i = 0; i < numBranches-1; i++){
      branches[i] = new Branch(this, false);
    }
    branches[numBranches-1] = new Branch(this, true);
  }
  
  public Branch(Branch root, boolean lastBranch){
    this.level = root.level+1;
    this.numBranches = root.numBranches-1;
    this.endLevel = root.endLevel;
    float branchY;
    if(lastBranch){
      branchY = root.path.end.y;
    }
    else{
      branchY = root.path.end.y - .8*random((root.path.end.y-(root.path.start.y)));
    }
    Vector2D branchStart = root.path.getPointWithThisY(branchY);
    float branchLength = .7*root.path.length-.4*root.path.start.distance(branchStart)+random(-.1*root.path.length, .1*root.path.length);
    float percentage = branchStart.distance(root.path.end)/root.path.length;
    float yNorm = -.8+percentage + random(-.2, .2);
    float pos = random(-1, 1);
    float xNorm;
    if(pos > 0){
      xNorm = 1 - pow(yNorm, 2);
    }
    else{
      xNorm = pow(yNorm, 2) - 1;
    }
    Vector2D branchEnd = branchStart.addVector(new Vector2D(xNorm, yNorm).normalize().multiplyScalar(branchLength));
    this.path = new Line(branchStart, branchEnd);
    if(this.level < this.endLevel){
      this.branches = new Branch[numBranches];
      for(int i = 0; i < numBranches-1; i++){
        branches[i] = new Branch(this, false);
      }
      branches[numBranches-1] = new Branch(this, true);
    }
  }
}