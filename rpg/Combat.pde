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
  
  PImage moveIcon;
  PImage moveIconSel;
  
  ArrayList<Fighter> party;
  ArrayList<Fighter> enemies;
  ArrayList<Fighter> turnOrder;
  Fighter current;
  
  int turn;
  int option;
  
  boolean menu;
    boolean moves;
      boolean target;
      int targetTeamSize;
      boolean attack;
      float attackCycle;
      String atkMsg;
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
    
    moveIcon = loadImage("battle/"+"moveicon.png");
    moveIconSel = loadImage("battle/"+"moveiconsel.png");
    
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
    
    menu = true;
      moves = false;
        target = false;
        attack = false;
        attackCycle = 0;
      item = false;
  }
  
  void keyPressedCombat(){
    if (!enemyTurn() && !attack){
    if (keyCode == UP){
      if (target){
      option -=1;
      }
    }
    if (keyCode == DOWN){
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
      moves = true;
      
      }else if (option == 2 && menu) {
      optionReset();
      menu = false;
      item = true;
      
      }else if (moves) {
      optionReset();
      moves = false;
      target = true;
      
      targetTeamSize = enemies.size();
      }else if (target)  {
      target = false;
      attack = true;
      menu = true;
      }      
    }
    if (keyCode == 'Z'){
      if (moves){
        optionReset();
        moves = false;
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
        moves = true;
      }
    }
  }
 }
  
  
  void run(){
    
    image(background, 0, 0);
    turnOrder();
    current = turnOrder.get((turn - 1) % (party.size() + enemies.size()));
    textSize(50);
    fill(255);
    text(current.getSpeed(), 400, 400);
    text(turn, 500, 400);
    
    cycle += 0.08;
    if ((int)cycle > 1){
    cycle = 0;
    }
    
    optionHover();
    drawMenu();
    
    if (enemyTurn()){
      drawAttack();
    }
    
    if (attack){
      drawAttack();
    }
    


    for (int i = 0; i < party.size(); i +=1){
      party.get(i).pos = i;
      if (!party.get(i).attack){
          image(party.get(i).idleCycle[(int)idle], 150, (i * 130) + 120);
      }
    }
    for (int i = 0; i < enemies.size(); i +=1){
      if (enemies.get(i).getHP() > 0){
        enemies.get(i).pos = i;
        if (!enemies.get(i).attack){
      image(enemies.get(i).idleCycle[(int)idle], 900, (i * 130) + 120);
        }
      }else{
      enemies.remove(i);
      i -=1;
      }
    }
    
    if (!aliveParty(enemies)){
    textSize(50);
    text("enemies dead", 400, 200);
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
      image(turnDisplay, 210, 0);
     
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
   
   boolean enemyTurn(){
     boolean enemy = false;
     for (int i = 0; i < enemies.size(); i +=1){
       if (enemies.get(i) == current){
         enemy = true;
       }
     }
     return enemy;
   }
   
   void enemyAttack(){
     int target = (int)random(party.size());
     atkMsg = current.attack(party.get(target));
     println(atkMsg);
   }
   
   
   void drawMenu(){
     
    if (menu){
      drawInfo();
      
      if (!attack && !enemyTurn()){
        drawOptions();
      }
    }
     
      if (moves){
       drawMoves();
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
   
   void drawMoves(){
     fill(0);
     rect(0, 650, 1200, 250);
      
     for (int i = 0; i < 4; i +=1){
       if (option == i){
         image(moveIconSel, (i * 300), 720);
       }else{
         image(moveIcon, (i * 300), 720);
       }
     }
     
     textSize(40);
     fill(255);
     text("Move1", 80, 800);
     text("Move2", 370, 800);  
     text("Move3", 680, 800);
     text("Move4", 960, 800);
   }
   
   void drawItems(){
     fill(0);
     rect(0, 650, 1200, 250);
   }
   
   void drawTargets(ArrayList<Fighter> targets){
     fill(0);
     rect(0, 650, 1200, 250);
     
     int temp = 0;
     
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
       
       if (targets.get(i).getHP() > 0){
       //Health
       healthBar.resize((int)((float)targets.get(i).getHP()/targets.get(i).getMaxHP() * 300) , 35);
       image(healthBar, 400, (temp * 60) + 686);
       
       //Mana
       manaBar.resize((int)((float)targets.get(i).getMana()/targets.get(i).getMaxMana() * 300) , 35);
       image(manaBar, 750, (temp * 60) + 686);
       
       //Portrait
       PImage portrait = targets.get(i).getPortrait().copy();
       portrait.resize(35, 0);
       image(portrait, 100, (temp * 60) + 686);
       
       fill(255);
       textSize(25);
       text(targets.get(i).getName(), 220, (temp * 60) + 715);
       temp +=1;
       }
     }
   }
   
   void drawAttack(){
     current.attack = true;
     if (!enemyTurn()){
     image(current.atkCycle[(int)attackCycle], 150, (current.pos * 130) + 120);
     }
     if (enemyTurn()){
     image(current.atkCycle[(int)attackCycle], 900, (current.pos * 130) + 120);
     }
     attackCycle += 0.15;
     if ((int)attackCycle > 7){
       attackCycle = 0;
       turn +=1;
       current.attack = false;
       
       if (!enemyTurn()){
        atkMsg = current.attack(enemies.get(option));
        optionReset();
       }
       
       if (enemyTurn()){
         enemyAttack();
       }
       attack = false;
       menu = true;
     }
   }
   
   void drawInfo(){
     
     image(battleInfo, 0, 700);
     
     for (int i = 0; i < party.size(); i +=1){
      
       //Health
       if (party.get(i).getHP() > 0){
       healthBar.resize((int)((float)party.get(i).getHP()/party.get(i).getMaxHP() * 191) , 7);
       image(healthBar, (i * 400) + 181, 782);
       }
       
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
    
    if (moves){
      if (option > 3){
        option = 3;
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
   option = 0;
   }
  
}
