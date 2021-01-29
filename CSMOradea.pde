Carte[] carti=new Carte[12];
int time;
int[] trackClicked=new int[100];
int[] track=new int[100];
boolean keep=false;
int[] show=new int[12];
PImage coperta;
int nr_comb;
int highest_score;
void setup()
{
  nr_comb=0;
  time=0;
  fullScreen();
  //O lista cu numere pentru random la carti
  int[] lista_numere= {
    1, 2, 3, 4, 5, 6, 1, 2, 3, 4, 5, 6
  };
 
  randomize(lista_numere);//Facem random la lista
  for (int i=0; i<carti.length; i++)
  {
    carti[i]=new Carte(lista_numere[i]);
    carti[i].reveal=false;
    show[i]=0;
  }
  for (int i=0; i<100; i++)
  {
    trackClicked[i]=0;
    track[i]=0;
  }
}
//Amestecam cartile
void randomize(int[] a)
{
  int temp;
  for (int i=0; i<a.length; i++)
  {
    int pick=(int)random(a.length);
    temp=a[i];
    a[i]=a[pick];
    a[pick]=temp;
  }
}

void draw()
{
  background(209, 209, 224);
  rectMode(CENTER);
  int carti_ghicite=0;
  for (int i=0; i<carti.length; i++)
  {  
    if (carti[i].reveal==false)// Daca cartea este intoarsa incarcam spatele fiecarei carti
    {
        imageMode(CENTER);
        PImage back=loadImage("back.jpg");
        back.resize((int)(width/10.42),(int)(height/5.80));
        image(back, carti[i].x, carti[i].y);   
    }
    if (i<4)//Aranjam cartile in forma dorita
    {
      carti[i].x=(int)(width/9)*(i+1)-(width/64);
      carti[i].y=(int)(height/6);
    } else if (i>=4&&i<8)
    {
      carti[i].x=(int)(width/9)*(i-3)-(width/64);
      carti[i].y=(int)(height/2.7);
    } else
    {
      carti[i].x=(int)(width/9)*(i-7)-(width/64);
      carti[i].y=(int)(height/1.74);
    }
    noFill();

    if (carti[i].reveal==true)//Daca se da click pe carte
    {
      show[i]++;
      if (show[i]%3==0&&show[i]<23)
      {
        fill(255, 255, 0);//Efectul de tranzitie 
      } else
      {
        carti[i].imaginea_cartii.resize((int)(width/10.42),(int)(height/5.80));
        image(carti[i].imaginea_cartii, carti[i].x, carti[i].y); //afisare imagine jucator
      }
    } else
    {
      show[i]=0;
    }
   fill(0);
    if (carti[i].reveal==true)
    {
      carti_ghicite++;//Numarul de carti intoarse in acel moment
    }
  }

  if (time>1&&time%2!=0)
  {
    //intoarce cea de a3a carte si le intoarce inapoi pe celelalte doua in caz ca NU sunt identice
    if ((track[time-3]!= track[time-2]))
    {
      carti[trackClicked[time-3]].reveal=false;
     
      carti[trackClicked[time-2]].reveal=false;
     
    }
    //Cand doua carti sunt la fel ele raman intoarse pana la final
    else
    {
      carti[trackClicked[time-3]].reveal=true;
      carti[trackClicked[time-2]].reveal=true;
    }
  }
 
  fill(255);
  textSize((int)(height/21.6));
  fill(0);
  text("Alege două cărți identice", (int)(width/1.79), (int)(height/6));
  textSize((int)(height/36));
  fill(12,34,211);
  text("Apasă ESC pentru a ieși / Apasă R pentru RESET", (int)(width/1.79), (int)(height/4.69));
  text("Număr combinații: " +nr_comb/2+ "    / Highest SCORE: "+highest_score, (int)(width/1.79),(int)(height/4));

  textSize((int)(height/20));
  fill(255,0,0);
  text("Dezvoltator: Tanca Adela",90,950);

if(carti_ghicite%2!=0)
{
fill(255,0,0);
       textSize((int)(height/27));
      text("Alege altă carte identică cu aceasta!", (int)(width/1.79),(int)(height/3.37)); 
}
  reset();
  //daca toate cartile sunt intoarse se termina jocul si ai castigat
  if (carti_ghicite==carti.length)
  {
    gameOver();
  }
}
boolean over;
//cream cartile
class Carte
{
  int x;
  int y;
  PImage imaginea_cartii;
  boolean reveal;
  int numar;
  int latime_carte;
  int inaltime_carte;
  PImage[] images= {
    loadImage("S1.jpg"), loadImage("V1.png"), loadImage("N1.jpg"), loadImage("W1.jpg"), loadImage("K1.jpg"), loadImage("B1.jpg"),
  };
  Carte( int numar_carte)
  {
    reveal=false;
    latime_carte=60;
    inaltime_carte=60;
    numar=numar_carte;
    imaginea_cartii=images[numar-1];
  }
}

void mouseClicked()
{

  for (int i=0; i<carti.length; i++)
  {//mousel este deasupra unei carti
     if (mouseX<=carti[i].x+carti[i].latime_carte&&mouseX>=carti[i].x-carti[i].latime_carte&&mouseY>=carti[i].y-carti[i].inaltime_carte&&mouseY<=carti[i].y+carti[i].inaltime_carte&&carti[i].reveal==false)
    {           
      carti[i].reveal=true;
      time++;
      track[time-1]=carti[i].numar;
      trackClicked[time-1]=i;
     nr_comb++;
    }
  }
  //Resetam jocul atunci cand jucatorul a castigat si apasa click
  if (over==true)
  {
    //resetam toate variabilele
    setup();
    over=false;
  }
}
void gameOver()
{
  fill(255,0,0);
  textSize(50);
  text("Ai câștigat! Felicitări!", (int)(width/1.79), (int)(height/3.08));
  coperta=loadImage("Coperta.jpg");
  coperta.resize((int)(width/2.74),(int)(height/3.41));
  image(coperta,(int)(width/1.37), (int)(height/1.96));
  over=true;
}
void reset ()
{
  if(keyPressed)
  if(key == 'r' || key == 'R') {  
    if(highest_score==0)
      highest_score=nr_comb/2;
      else
        if(nr_comb/2<highest_score)
        highest_score=nr_comb/2;
   setup();
  }
}
