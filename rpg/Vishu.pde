class Vishu extends Fighter{

  public Vishu(){
    super("Vishu", 20, 5, 20);
  }
  
  public String attack(Fighter other){
    int damage = (int)(random(super.atk/2, super.atk * 2));
    other.applyDamage(damage);
    return (this + " attacked " + other + " for " + "\u001b[31m"+damage + " damage!"+"\u001b[0m");
  }
}
