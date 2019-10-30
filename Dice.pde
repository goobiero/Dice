void setup()
{
	noLoop();
	size(800,800);
}

int[][][] deplacmentX = { {{-15,15},{-15,-15,15,15},{-15,15,-15,15,-15,15}} , {{0},{-15,0,15},{-15,15,0,-15,15}} };
int[][][] deplacmentY = { {{-15 ,15 },{-15,15,15,-15},{-15,-15, 0, 0, 15,15}} , {{0},{-15,0,15},{-15,-15,0,15,15}} };
int sum = 0;

void draw()
{
	//your code here
	for(int y = 0; y < 600; y = y + 80){
		for(int x = 0; x < 600; x = x + 80){
			rect(x + 100,y + 100,60,60);
			Die dice = new Die(x,y);
			int table[] = dice.roll();


			System.out.print(table[0] + " ");
			System.out.print(table[1] + " ");
			System.out.print(deplacmentX[table[0]][table[1]].length + " ");

			for( int i = 0; i < deplacmentX[table[0]][table[1]].length; i++){
				dice.show(deplacmentX[table[0]][table[1]][i], deplacmentY[table[0]][table[1]][i]); 
				System.out.print(deplacmentX[table[0]][table[1]][i]);
				}
			System.out.println();
			if (y == x){
					dice.sum(table[0],table[1],false);
			}
		}
	}
}

void mousePressed()
{
	sum = 0;
	fill(255,255,255);
	rect(481,740, 50, 50);
	redraw();

}



class Die //models one single dice cube
{
	//variable declarations here
	int myX,myY;
	int rollCount;
	
	Die(int x, int y) //constructor
	{
		//variable initializations here
		rollCount = 1;
		myX = x + 100;
		myY = y + 100;
	}


	int[] roll( )
	{
		//your code here
		int numType = (int)(Math.random()*2);
		int count = (int)(Math.random()*3);
		int[] table = {numType, count};
		sum(table[0],table[1],true);
		return table;
	}

	void sum(int numType,int count,boolean str){
		if(str == true){

			if(numType == 0){
				sum = sum + count*2;
			}else{
				sum = sum + count*2 - 1;
			}
		}else{
			fill(255,255,255);
			rect(380,740, 50, 24);
			System.out.println(sum);
			fill(0);
			text(sum,400,760);
			fill((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
		}
	}


	void show(int posX, int posY)
	{
		//your code here
		fill((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
		ellipse((myX + 30) + posX, (myY + 30) + posY , 10, 10);
		
	}
}
// 
