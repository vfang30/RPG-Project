import java.util.*;
abstract class Fighter{
  private String name;
  private int hp, maxHP;
  private int atk;
  private int mana;
  
  public Fighter(String name, int hp, int atk, int mana){
    this.name = name;
    maxHP = hp;
    this.hp = hp;
    this.atk = atk;
    this.mana = mana;
  }
  
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

  public String toString(){
    return this.getName();
  }

}
