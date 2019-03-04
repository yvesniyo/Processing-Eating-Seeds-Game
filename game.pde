float right[] ={radians(45),radians(360)};
float left[] ={radians(180),radians(495)};
float up[] ={radians(315),radians(630)};
float down[] ={radians(135),radians(450)};

String position="right";

int xPos=100;
int yPos=100;

boolean loose=false;
boolean win=false;

float foodX=random(50,750);
float foodY=random(50,450);

int foodEaten=0;
void setup(){
 size(800,500);
 background(108,108,0);
}

void generateFood(){
  foodX=random(50,750);
  foodY=random(50,400);
}

float speed=5;
String level="Level 1";

void draw(){
    
  if(win){
    position="right";
    background(138,138,160);
    textSize(64);
    textAlign(CENTER);
    text("You Won The Game.",400,200);
    fill(255,100,100);
    rect(300,270,190,50);
    fill(255);
    textSize(31);
    textAlign(CENTER);
    text("Restart.",400,305);   
    fill(255);
    if(mousePressed){
      if(mouseX>=300 && mouseX<=490 && mouseY>=270 && mouseY<=330){
        win=false;
      }
    }
  }
  
   if(!loose && !win){
     
        background(208,208,200);
        
       
        
        fill(255);
        rect(0,450,800,50);
        
        fill(0);
        textSize(20);
        textAlign(CENTER);
        text("Total Food : "+ foodEaten +"",120,480);
        textSize(18);
        fill(255,0,0);
        text("Level : "+ level +"",650,480);
        
        fill(255,0,0);
        ellipse(foodX,foodY,20,20);
        
        fill(0,0,255);
        noStroke();
        if(position=="right"){
          xPos+=speed;
          float mouth=random(0.01,0.90);
          arc(xPos,yPos,40,40,right[0]-mouth,right[1]);
        }else if(position=="left"){
          xPos-=speed;
          float mouth=random(0.01,0.90);
          arc(xPos,yPos,40,40,left[0],left[1]+mouth);
        }else if(position=="down"){
          yPos+=speed;
          float mouth=random(0.01,0.90);
          arc(xPos,yPos,40,40,down[0]-mouth,down[1]);
        }else if(position=="up"){
          yPos-=speed;
          float mouth=random(0.01,0.90);
          arc(xPos,yPos,40,40,up[0]-mouth,up[1]);
        }
        
        
        
        if(keyPressed && (key==CODED)){
          if(keyCode==RIGHT && position!="left"){
            position="right";
          }else if(keyCode==LEFT && position!="right"){
            position="left";
          }else if(keyCode==DOWN && position!="up"){
            position="down";
          }else if((keyCode==UP || keyCode==SHIFT)  && position!="down"){
            position="up";
          } 
        }// End of key pressing
        
        if(xPos>=foodX-20 && yPos>=foodY-20 && xPos<=foodX+20 && yPos<=foodY+20 ){
          foodEaten+=1;
          
          if(foodEaten<=10){
            speed=5;
            level="Level 1";
          }
          if(foodEaten>=11){
            speed=5.5;
            level="Level 2";
          }
          if(foodEaten>=21){
            speed=6;
            level="Level 3";
          }
          if(foodEaten>=31){
            speed=7;
            level="Level 4";
          }
          if(foodEaten>=41){
            speed=7.5;
            level="Level 5";
          }
          if(foodEaten==50){
            win=true;
            fill(0);
            textSize(80);
            textAlign(CENTER);
            text("You  WIN!",400,250);
          }
          

          generateFood();
        }
        
        
        
        if(xPos<=18 || xPos>=780 || yPos<=18 || yPos>=432){
          loose=true;
          level="level 1";
          speed=5.00;
          foodEaten=0;
          xPos=300;
          yPos=100;
          position="right";
          
        }
        
  }
  
  if(loose){
    background(108,108,160);
    textSize(64);
    textAlign(CENTER);
    text("You Lost The Game.",400,200);
    fill(200,100,100);
    rect(300,270,190,50);
    fill(0);
    textSize(31);
    textAlign(CENTER);
    text("Try Again.",400,305);   
    fill(255);
    
    if(mousePressed){
      if(mouseX>=300 && mouseX<=490 && mouseY>=270 && mouseY<=330){
        generateFood();
        loose=false;
      }
    }
  }

  
  
}