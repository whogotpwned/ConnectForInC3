module myc3project;
import std::io;
import std::core::string;


fn void getBalken()
{
	for (int i = 0; i < 7; i++)
	{
		io::print("+---");
	}
	io::print("\n");
}


fn void getZeile(int[] werte)
{
	for (int i = 0; i < 7; i++)
	{
		io::print("|");
		io::print(" ");
		io::print(werte[i]);
		io::print(" ");
		io::print("");
	}
	io::print("|\n");
}

fn int? readNextInt()
{
    String? nextIntString = io::treadline();
	int? nextInt = -1;

    if (catch excuse = nextIntString) {
        return excuse?;
    } else {
		nextInt = String.to_int(nextIntString);
	}
    return nextInt;
}


fn void getBanner() 
{
	io::print("\n");
	io::print("\n");
	io::print("  ###  "  "  #   #  "  "  ###  "  " ####  "  "  ###\n");
	io::print(" #     "  "  #   #  "  " #     "  "     # "  " #   \n");
	io::print("#      "  "  #####  "  "#      "  "  ###  "  "#    \n");
	io::print(" #     "  "      #  "  " #     "  "     # "  " #   \n");
	io::print("  ###  "  "      #  "  "  ###  "  " ####  "  "  ###\n");
	io::print("\n");
	io::print("\n");
}


fn bool hasFreeSpace(int[7][6] matrix)
{
	for (int i = 0; i < 7; i++)
	{
		for (int j = 0; j < 6; j++)
		{
			if (matrix[j][i] == 0)
			{
				return true;
			}
		}
	}
	return false;
}

fn int getNextValidFreeRow(int[7][6] matrix, int column)
{


	for (int i = 5; i >= 0; i--)
	{

		if (matrix[i][column] == 0)
		{
			return i;
		}

	}
	return -1;

}

fn void printFeedbackTargetPosition(int zeile, int spalte)
{
	io::print("Eingegebene Spalte: ");
	io::print(spalte + 1);
	io::print("\n");
	io::print("Zeile: ");
	io::print(zeile + 1);
	io::print("\n");
}

fn int getFeedbackNextPlayer(int round) 
{
	int nextPlayer = (round % 2) + 1;
	io::print("Spieler ");
	io::print(nextPlayer);
	io::print(" ist am Zug.\n");

	return nextPlayer;
}

fn bool gewinntDiagonal(int[7][6] matrix, int zeile, int spalte, int player)
{

	for (int i = 0; i < 7; i++)
	{
		for (int j = 0; j < 6; j++)
		{

			// pruefe ob diese indizes ueberhaupt noch im matrix-bereich liegen
			if (i + 3 >= 7 || j + 3 >= 6)
			{
				continue;
			}

			// printe darueber welche werte verglichen werden
			io::print("Vergleiche: ");
			io::print(matrix[j][i]);
			io::print(" mit ");
			io::print(matrix[j+1][i+1]);
			io::print(", ");
			io::print(matrix[j+2][i+2]);
			io::print(", ");
			io::print(matrix[j+3][i+3]);
			io::print("\n");

		

			if (matrix[j][i] == player && matrix[j+1][i+1] == player && matrix[j+2][i+2] == player && matrix[j+3][i+3] == player)
			{
				return true;
			}
		}
	}


	return false;
}



fn int main(String[] args)
{

	int [7][6] matrix = {{0, 0, 0, 0, 0, 0, 0},
						 {0, 0, 0, 0, 0, 0, 0},
						 {0, 0, 0, 0, 0, 0, 0},
						 {0, 0, 0, 0, 0, 0, 0}, 
						 {0, 0, 0, 0, 0, 0, 0},
						 {0, 0, 0, 0, 0, 0, 0} 
						 };

	getBanner();
	for (int i = 0; i < 6; i++)
	{
		getBalken();
		getZeile(&matrix[i]);
		
	}
	getBalken();

	// Ab hier geht die eigentliche Logik los

	int round = 0;

	while (hasFreeSpace(matrix))
	{


		
		int nextPlayer = getFeedbackNextPlayer(round);

		io::print("Bitte geben Sie eine Zahl ein: ");
		int? naechsterWert = readNextInt();

		if (naechsterWert!! < 1 || naechsterWert!! > 7)
		{
			io::print("Ungültige Eingabe. Bitte geben Sie eine Zahl zwischen 1 und 7 ein.\n");
			continue;
		}

		int spalte = naechsterWert!! - 1;
		int zeile = getNextValidFreeRow(matrix, spalte);

		if (zeile == -1)
		{
			io::print("Die gewählte Spalte ist voll. Bitte wählen Sie eine andere Spalte.\n");
			continue;
		}

		printFeedbackTargetPosition(zeile, spalte);
		
		matrix[zeile][spalte] = nextPlayer;
		if (gewinntDiagonal(matrix, zeile, spalte, nextPlayer))
		{
			io::print("Spieler ");
			io::print(nextPlayer);
			io::print(" gewinnt!\n");
			break;
		}

		io::print("\n");
		for (int i = 0; i < 6; i++)
		{
			getBalken();
			getZeile(&matrix[i]);
		}
		getBalken();

		round += 1;

	}


	// io::print("Bitte geben Sie eine Zahl ein: ");
	// int? naechsterWert = readNextInt();
	// io::print("Der eingegebene Wert ist: ");
	// io::print(naechsterWert!!);
	// io::print("\n");
	

	return 0;


}
