import java.util.*;
class Combat{
  ArrayList<Fighter> party;
  ArrayList<Fighter> enemies;
  
  public Combat(ArrayList<Fighter> party, ArrayList<Fighter> enemies){
    this.party = party;
    this.enemies = enemies;
  }
  
  void run(){
    for (int i = 0; i < party.size(); i +=1){
      image(party.get(i).idleCycle[(int)idle], 100, (i * 300) + 100);
    }
    for (int i = 0; i < enemies.size(); i +=1){
      image(enemies.get(i).idleCycle[(int)idle], 800, (i * 300) + 100);
    }
    
  }
  
}
