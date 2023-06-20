import java.util.*;
class Combat{
  
  PImage background;
  PImage battleInfo;
  PImage healthBar;
  PImage manaBar;
  
  ArrayList<Fighter> party;
  ArrayList<Fighter> enemies;
  
  int turn;
  int option;
  
  boolean top;
  boolean menu;
    boolean attack;
      boolean target;
      int targetTeamSize;
    boolean item;

  
  public Combat(ArrayList<Fighter> party, ArrayList<Fighter> enemies){
    this.party = party;
    this.enemies = enemies;
    
    background = loadImage("battle/"+"battlebackground.png");
    background.resize(1200, 900);
    turn = 1;
    
    battleInfo = loadImage("battle/"+"battleinfo.png");
    healthBar = loadImage("battle/"+"healthbar.png");
    manaBar = loadImage("battle/"+"manabar.png");
    
    option = 0;
    
    top = true;
    menu = true;
      attack = false;
        target = false;
      item = false;
  }
  
  void keyPressedCombat(){
    if (keyCode == UP){
      top = true;
      if (target){
      option -=1;
      }
    }
    if (keyCode == DOWN){
      top = false;
      if (target){
      option +=1;
      }
    }
    if (keyCode == LEFT && !target){
      option -=1;
    }
    if (keyCode == RIGHT && !target){
      option +=1;
    }
    if (keyCode == 'X'){
      
      if (option == 0 && menu){
      optionReset();
      menu = false;
      attack = true;
      }else if (option == 1 && menu) {
      optionReset();
      menu = false;
      item = true;
      }else if (attack) {
      optionReset();
      attack = false;
      target = true;
      targetTeamSize = enemies.size();
      }      
    }
    if (keyCode == 'Z'){
      if (attack){
        optionReset();
        attack = false;
        menu = true;
      }
      if (item){
        optionReset();
        item = false;
        menu = true;
      }
      if (target){
        optionReset();
        target = false;
        attack = true;
      }
    }
  }
  
  
  void run(){
    
    image(background, 0, 0);
    
    optionHover();
    drawMenu();


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
   
   void drawMenu(){
     
    if (menu){
      drawInfo();
      drawOptions();
    }
     
      if (attack){
       drawAttacks();
      }
      
        if (target){
          drawTargets(enemies);
        }
    
      if (item){
        drawItems();
      }
        
   }
   
   void drawOptions(){
     
     textSize(25);
     
     if (option == 0){
       fill(30);
     }else{
     fill(128);
     }
     rect(0, 600, 220, 50);
     
     if (option == 1){
       fill(30);
     }else{
     fill(128);
     }
     rect(440, 600, 220, 50);
     
     if (option == 2){
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
     rect(0, 650, 1200, 250);
     
     if (option == 0 && top){
       fill(30);
     }else{
     fill(128);
     }
     rect(110, 690, 400, 80); 
     
     if (option == 1 && top){
       fill(30);
     }else{
     fill(128);
     }
     rect(590, 690, 400, 80); 
     
     if (option == 0 && !top){
       fill(30);
     }else{
     fill(128);
     }
     rect(110, 810, 400, 80); 
     
     if (option == 1 && !top){
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
     rect(0, 650, 1200, 250);
   }
   
   void drawTargets(ArrayList<Fighter> targets){
     fill(0);
     rect(0, 650, 1200, 250);
     
       ////Option Highlighter
       noStroke();
       fill(255, 207, 64);
       //Top Rectangle
       rect(0, 660 + (option * 70), 1100, 10);
       
       //Left Rectangle
       rect(0, 660 + (option * 70), 10, 70);
       
       //Right Rectangle
       rect(1090, 660 + (option * 70), 10, 70);
       
       //Bottom Rectangle
       rect(0, 730 + (option * 70), 1100, 10);
     
     for (int i = 0; i < targets.size(); i +=1){
       
       //Health
       healthBar.resize((int)((float)targets.get(i).getHP()/targets.get(i).getMaxHP() * 300) , 35);
       image(healthBar, 400, (i * 60) + 686);
       
       //Mana
       manaBar.resize((int)((float)targets.get(i).getMana()/targets.get(i).getMaxMana() * 300) , 35);
       image(manaBar, 750, (i * 60) + 686);
       
       //Portrait
       PImage portrait = party.get(i).getPortrait().copy();
       portrait.resize(35, 0);
       image(portrait, 100, (i * 60) + 686);
       
       fill(255);
       textSize(25);
       text(party.get(i).getName(), 220, (i * 60) + 715);
       
     }
   }
   
   void drawInfo(){
     
     image(battleInfo, 0, 650);
     
     for (int i = 0; i < party.size(); i +=1){
      
       //Health
       healthBar.resize((int)((float)party.get(i).getHP()/party.get(i).getMaxHP() * 191) , 9);
       image(healthBar, (i * 400) + 181, 752);
       
       textSize(15);
       text(party.get(i).getHP() + " / " + party.get(i).getMaxHP() + " HP" , (i * 400) + 190, 790);
       
       //Mana
       manaBar.resize((int)((float)party.get(i).getMana()/party.get(i).getMaxMana() * 191) , 9);
       image(manaBar, (i * 400) + 181, 802);
       
       textSize(15);
       text(party.get(i).getMana() + " / " + party.get(i).getMaxMana() + " MANA" , (i * 400) + 190, 840);
      
       //Portrait
       image(party.get(i).getPortrait(), (i * 400) + 30, 685);
       
       //Level
       fill(255);
       textSize(20);
       text("LVL: "+party.get(i).getLevel(), (i * 400) + 90, 830);
       
       //Name
       fill(255);
       textSize(25);
       text(party.get(i).getName(), (i * 400) + 190, 710);

     }
   }
  
   void optionHover(){
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
    
    if (target){
      if (option > targetTeamSize - 1){
      option = targetTeamSize - 1;
      }
      if (option < 0){
      option = 0;
      }
    }
   
   }
   
   void optionReset(){
   top = true;
   option = 0;
   }
  
}
