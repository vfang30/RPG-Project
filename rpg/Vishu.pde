class Vishu extends Fighter{
  
  public Vishu(){
    super("Vishu", 20, 5, 20);
    super.avatar = loadImage("idle/normal/"+"character.png");
    super.avatar.resize(150, 0);
    super.avatarIdle = loadImage("idle/normal/"+"characteridle.png");
    super.avatarIdle.resize(150, 0);
    super.portrait = loadImage("Vishuportrait.png");
    super.portrait.resize(120, 0);
    
    super.idleCycle[0] = super.avatar;
    super.idleCycle[1] = super.avatarIdle;

  }
  
  public String attack(Fighter other){
    int damage = (int)(random(super.atk/2, super.atk * 2));
    other.applyDamage(damage);
    return (this + " attacked " + other + " for " + "\u001b[31m"+damage + " damage!"+"\u001b[0m");
  }
}
