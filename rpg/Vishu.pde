
class Vishu extends Fighter{
  String attackPath = sketchPath("data\\attack");
  String[] attack = listFileNames(attackPath);
  
  public Vishu(){
    super("Vishu", 90, 80, 70, 80, 100);
    super.avatar = loadImage("idle/normal/"+"character.png");
    super.avatarIdle = loadImage("idle/normal/"+"characteridle.png");
    super.portrait = loadImage("portraits/"+"Vishuportrait.png");
    
    super.avatar.resize(125, 0);
    super.avatarIdle.resize(125, 0);
    
    super.idleCycle[0] = super.avatar;
    super.idleCycle[1] = super.avatarIdle;
    
    for (int i = 0; i < 8; i +=1){
      PImage image = loadImage("attack/"+attack[i]);
      super.atkCycle[i] = image;
    }
    
    Move slice = new Move("Slice", Move.ATTACKING, 30, 100, 5, 0);
    Move heavySlice = new Move("Heavy Slice", Move.ATTACKING, 50, 90, 8, 1);
    super.moveList[0] = slice;
    super.moveList[1] = heavySlice;

  }
}
