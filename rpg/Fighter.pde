import java.util.*;
abstract class Fighter{
  private String name;
  private int hp, maxHP;
  private int atk;
  private int mana;
  private int xp;
  private int level;
  
  public Fighter(String name, int hp, int atk, int mana){
    this.name = name;
    maxHP = hp;
    this.hp = hp;
    this.atk = atk;
    this.mana = mana;
    this.xp = 0;
    this.level = 1;
  }
  
  //get methods
  public String getName(){
    return name;
  }
  
  public int getHP(){
    return hp;
  }
  
  public int getMaxHP(){
    return maxHP;
  }
  
  public int getAtk(){
    return atk;
  }
  
  public int getMana(){
    return mana;
  }
  
  public int getXP(){
    return xp;
  }
  
  public int level(){
    return level;
  }

  //set methods
  public void setHP(int health){
    hp = health;
  }
  
  public void setAtk(int attack){
    atk = attack;
  }
  
  public void setXP(int exp){
    xp = exp;
  }
  
  public void setLevel(int lvl){
    level = lvl;
  }

  public String toString(){
    return this.getName();
  }

}
