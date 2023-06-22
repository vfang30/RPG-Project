
class Vishu extends Fighter{
  
  public Vishu(){
    super("Vishu", 20, 5, 10, 20);
    super.avatar = loadImage("idle/normal/"+"character.png");
    super.avatarIdle = loadImage("idle/normal/"+"characteridle.png");
    super.portrait = loadImage("portraits/"+"Vishuportrait.png");
    
    super.avatar.resize(125, 0);
    super.avatarIdle.resize(125, 0);
    
    super.idleCycle[0] = super.avatar;
    super.idleCycle[1] = super.avatarIdle;

  }
}
