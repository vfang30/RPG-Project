import java.util.*;
class Combat{
  PImage background;
  ArrayList<Fighter> party;
  ArrayList<Fighter> enemies;
  
  public Combat(ArrayList<Fighter> party, ArrayList<Fighter> enemies){
    this.party = party;
    this.enemies = enemies;
    background = loadImage("battlebackground.png");
    background.resize(1100, 900);
  }
  
  void run(){
    image(background, 0, 0);
    drawInfo();
    for (int i = 0; i < party.size(); i +=1){
      image(party.get(i).idleCycle[(int)idle], 100, (i * 200) + 80);
    }
    for (int i = 0; i < enemies.size(); i +=1){
      image(enemies.get(i).idleCycle[(int)idle], 800, (i * 200) + 100);
    }
  }
    
   boolean aliveParty(ArrayList<Fighter> squad){
     boolean minOneAlive = false;
     for (int i = 0; i < squad.size(); i +=1){
       if (squad.get(i).getHP() > 0){
         minOneAlive = true;
       }
     }
     return minOneAlive;
   }
   
   void drawInfo(){
     fill(0);
     rect(0, 650, 1100, 250);
     
     for (int i = 0; i < party.size(); i +=1){
      
       //Health
       fill(255);
       rect((i * 300) + 200, 800, 200, 25);
       
       fill(255, 0, 0);
       rect((i * 300) + 200, 800, (float)party.get(i).getHP()/party.get(i).getMaxHP() * 200, 25);
      
       image(party.get(i).portrait, (i * 300) + 90, 680);
       textSize(35);
       text(party.get(i).getName(), (i * 300) + 250, 730);
       textSize(25);
       text(party.get(i).getHP() + " / " + party.get(i).getMaxHP(), (i * 300) + 240, 770);
     }
   }
  
  
}
