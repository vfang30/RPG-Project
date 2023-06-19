import java.util.*;
class Combat{
  PImage background;
  ArrayList<Fighter> party;
  ArrayList<Fighter> enemies;
  int turn;
  
  public Combat(ArrayList<Fighter> party, ArrayList<Fighter> enemies){
    this.party = party;
    this.enemies = enemies;
    background = loadImage("battlebackground.png");
    background.resize(1100, 900);
    turn = 1;
  }
  
  void run(){
    image(background, 0, 0);
    drawInfo();
    drawOptions();
    for (int i = 0; i < party.size(); i +=1){
      image(party.get(i).idleCycle[(int)idle], 100, (i * 150) + 70);
    }
    for (int i = 0; i < enemies.size(); i +=1){
      image(enemies.get(i).idleCycle[(int)idle], 800, (i * 150) + 70);
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
   
   void drawOptions(){
     
     textSize(40);
     fill(128);
     rect(0, 600, 220, 50);
     rect(440, 600, 220, 50);
     rect(880, 600, 220, 50);
     
     fill(255);
     text("ATTACK", 30, 640);
     text("ITEMS", 480, 640);
     text("RUN", 940, 640);
   }
   
   
   void drawInfo(){
     fill(0);
     rect(0, 650, 1100, 250);
     
     for (int i = 0; i < party.size(); i +=1){
      
       //Health
       fill(255);
       rect((i * 300) + 200, 770, 170, 25);
       
       fill(0, 255, 0);
       rect((i * 300) + 200, 770, (float)party.get(i).getHP()/party.get(i).getMaxHP() * 170, 25);
       
       textSize(20);
       text(party.get(i).getHP() + " / " + party.get(i).getMaxHP() + " HP" , (i * 300) + 210, 750);
       
       //Mana
       fill(255);
       rect((i * 300) + 200, 850, 170, 25);
       
       fill(0, 0, 255);
       rect((i * 300) + 200, 850, (float)party.get(i).getHP()/party.get(i).getMaxHP() * 170, 25);
              
       text(party.get(i).getMana() + " / " + party.get(i).getMaxMana() + " MANA" , (i * 300) + 210, 830);
      
        //Portrait
       image(party.get(i).portrait, (i * 300) + 80, 730);
       
       //Name
       fill(255);
       textSize(35);
       text(party.get(i).getName(), (i * 300) + 230, 710);

     }
   }
  
  
}
