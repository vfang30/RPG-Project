import java.util.*;
class Combat{
  PImage background;
  ArrayList<Fighter> party;
  ArrayList<Fighter> enemies;
  int turn;
  
  float option;
  float attackOption;
  
  boolean attack;
  boolean item;
  boolean top;
  
  boolean menu;
  
  public Combat(ArrayList<Fighter> party, ArrayList<Fighter> enemies){
    this.party = party;
    this.enemies = enemies;
    
    background = loadImage("battlebackground.png");
    background.resize(1100, 900);
    turn = 1;
    
    option = 0;
    attackOption = 0;
    
    menu = true;
    attack = false;
    item = false;
    top = true;
  }
  
  void keyPressedCombat(){
    if (keyCode == 'W'){
      top = true;
    }
    if (keyCode == 'S'){
      top = false;
    }
    if (keyCode == 'A'){
      option -=1;
    }
    if (keyCode == 'D'){
      option +=1;
    }
    if (keyCode == ENTER){
      if (option == 0 && menu){
        menu = false;
        attack = true;
      }
    }
  }
  
  
  void run(){
    
    image(background, 0, 0);
    
    boolean ent = keyboardInput.isPressed(Controller.ENT);
    boolean cancel = keyboardInput.isPressed(Controller.CANCEL);
    
    if (menu){
      if (option > 2){
        option = 2;
      }
      if (option < 0){
        option = 0;
      }
    }
    
    if (attack){
      if (option > 1){
        option = 1;
      }
      if (option < 0){
        option = 0;
      }
    }
    
    if (cancel){
      if (attack)
        attack = false;
      if (item)
        item = false;
    }
    
    
    if (ent && (int)option == 1 && menu){
      item = true;
      menu = false;
    }
    
    if (attack){
     drawAttacks();
    }
    
    if (item){
      drawItems();
    }
    
    if (ent && (int)option == 2 && menu){
      println("run");
    }
    

    
    if (!attack && !item){
      drawInfo();
      drawOptions();
    }
    
   
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
     
     if ((int)option == 0){
       fill(30);
     }else{
     fill(128);
     }
     rect(0, 600, 220, 50);
     
     if ((int)option == 1){
       fill(30);
     }else{
     fill(128);
     }
     rect(440, 600, 220, 50);
     
     if ((int)option == 2){
       fill(30);
     }else{
     fill(128);
     }
     rect(880, 600, 220, 50);
     
     fill(255);
     text("ATTACK", 30, 640);
     text("ITEMS", 480, 640);
     text("RUN", 940, 640);
   }
   
   void drawAttacks(){
     fill(0);
     rect(0, 650, 1100, 250);
     
     if ((int)option == 0 && top){
       fill(30);
     }else{
     fill(128);
     }
     rect(110, 690, 400, 80); 
     
     if ((int)option == 1 && top){
       fill(30);
     }else{
     fill(128);
     }
     rect(590, 690, 400, 80); 
     
     if ((int)option == 0 && !top){
       fill(30);
     }else{
     fill(128);
     }
     rect(110, 810, 400, 80); 
     
     if ((int)option == 1 && !top){
       fill(30);
     }else{
     fill(128);
     }
     rect(590, 810, 400, 80); 
   
     
     textSize(40);
     fill(255);
     
     text("Move1", 255, 745);
     text("Move2", 725, 745);  
     text("Move3", 255, 865);
     text("Move4", 725, 865);
   }
   
   void drawItems(){
     fill(0);
     rect(0, 650, 1100, 250);
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
