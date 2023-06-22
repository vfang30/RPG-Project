import java.util.*;
class Combat{
 
  PImage background;
  PImage turnDisplay;
  PImage battleInfo;
  PImage healthBar;
  PImage manaBar;
  
  PImage sel;
  PImage selTwo;
  PImage[] selCycle;
  float cycle;
  
  PImage atkButton;
  PImage rechargeButton;
  PImage itemButton;
  PImage runButton;
  
  ArrayList<Fighter> party;
  ArrayList<Fighter> enemies;
  ArrayList<Fighter> turnOrder;
  
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
    turnDisplay = loadImage("battle/"+"turnOrder.png");
    turn = 1;
    
    battleInfo = loadImage("battle/"+"battleinfo.png");
    healthBar = loadImage("battle/"+"healthbar.png");
    manaBar = loadImage("battle/"+"manabar.png");
    
    cycle = 0;
    sel = loadImage("battle/"+"selHand.png");
    selTwo = loadImage("battle/"+"selHand2.png");
    selCycle = new PImage[2];
    selCycle[0] = sel;
    selCycle[1] = selTwo;
    
    atkButton = loadImage("battle/"+"attack.png");
    rechargeButton = loadImage("battle/"+"recharge.png");
    itemButton = loadImage("battle/"+"item.png");
    runButton = loadImage("battle/"+"run.png");
    
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
      }else if (option == 2 && menu) {
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
    
    turnOrder();
    turnTest();
    
    cycle += 0.08;
    if ((int)cycle > 1){
    cycle = 0;
    }
    
    image(background, 0, 0);
    image(turnDisplay, 210, 0);
    
    optionHover();
    drawMenu();


    for (int i = 0; i < party.size(); i +=1){
      image(party.get(i).idleCycle[(int)idle], 150, (i * 130) + 120);
    }
    for (int i = 0; i < enemies.size(); i +=1){
      image(enemies.get(i).idleCycle[(int)idle], 900, (i * 130) + 120);
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
   
   void turnOrder(){
     turnOrder = new ArrayList<Fighter>();
     for (int i = 0; i < party.size(); i +=1){
       turnOrder.add(party.get(i));
     }
     for (int i = 0; i < enemies.size(); i +=1){
       turnOrder.add(enemies.get(i));
     }
     for (int keyIndex = 1; keyIndex < turnOrder.size(); keyIndex +=1){
       int prev = keyIndex - 1;
       Fighter compare = turnOrder.get(keyIndex);
       int keySpeed = compare.getSpeed();
       while (prev > -1 && keySpeed > turnOrder.get(prev).getSpeed()){
         Fighter prevF = turnOrder.get(prev);
         turnOrder.set(prev + 1, prevF);
         prev -=1;
       }
       turnOrder.set(prev + 1, compare);
     }
   }
   
   void turnTest(){
     String res = "";
     for (int i = 0; i < turnOrder.size(); i +=1){
       res += " " + turnOrder.get(i).getSpeed();
     }
     println(res);
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
     
     textSize(20);
     fill(255);
     
     
     if (option == 0){
     image(selCycle[(int)cycle], 105, 495 + (int)cycle * 20);
     image(atkButton, 0, 587);
     text("ATTACK", 75, 640);
     }else{
     image(atkButton, 0, 612);
     text("ATTACK", 75, 665);
     }
     
     if (option == 1){
     image(selCycle[(int)cycle], 410, 495 + (int)cycle * 20);
     image(rechargeButton, 310, 587);
     text("RECHARGE", 375, 640);
     }else{
     image(rechargeButton, 310, 612);
     text("RECHARGE", 375, 665);
     }
     
     if (option == 2){
     image(selCycle[(int)cycle], 720, 495 + (int)cycle * 20);
     image(itemButton, 632, 587);
     text("ITEMS", 712, 640);
     }else{
     image(itemButton, 632, 612);
     text("ITEMS", 712, 665);
     }
     
     if (option == 3){
     image(selCycle[(int)cycle], 1050, 495 + (int)cycle * 20);
     image(runButton, 944, 587);
     text("RUN", 1050, 640);
     }else{
     image(runButton, 944, 612);
     text("RUN", 1050, 665);
     }
     
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
     
     image(battleInfo, 0, 700);
     
     for (int i = 0; i < party.size(); i +=1){
      
       //Health
       healthBar.resize((int)((float)party.get(i).getHP()/party.get(i).getMaxHP() * 191) , 7);
       image(healthBar, (i * 400) + 181, 782);
       
       textSize(13);
       text(party.get(i).getHP() + " / " + party.get(i).getMaxHP() + " HP" , (i * 400) + 190, 810);
       
       //Mana
       manaBar.resize((int)((float)party.get(i).getMana()/party.get(i).getMaxMana() * 191) , 7);
       image(manaBar, (i * 400) + 181, 822);
       
       textSize(13);
       text(party.get(i).getMana() + " / " + party.get(i).getMaxMana() + " MANA" , (i * 400) + 190, 850);
      
       //Portrait
       image(party.get(i).getPortrait(), (i * 400) + 30, 715);
       
       //Level
       fill(255);
       textSize(18);
       text("LVL: "+party.get(i).getLevel(), (i * 400) + 90, 860);
       
       //Name
       fill(255);
       textSize(23);
       text(party.get(i).getName(), (i * 400) + 190, 760);

     }
   }
  
   void optionHover(){
     if (menu){
      if (option > 3){
        option = 3;
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
