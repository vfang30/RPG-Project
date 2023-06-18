class Vishu extends Fighter{
  
  public Vishu(){
    super("Vishu", 20, 5, 20);
    super.avatar = loadImage("idle/normal/"+"character.png");
    super.avatar.resize(150, 0);
    super.avatarIdle = loadImage("idle/normal/"+"characteridle.png");
  }
  
  public String attack(Fighter other){
    int damage = (int)(random(super.atk/2, super.atk * 2));
    other.applyDamage(damage);
    return (this + " attacked " + other + " for " + "\u001b[31m"+damage + " damage!"+"\u001b[0m");
  }
}
