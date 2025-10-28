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
	for (int i = 0; i < 6; i++)
	{
		for (int j = 0; j < 7; j++)
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

	while (hasFreeSpace(matrix))
	{
		io::print("Bitte geben Sie eine Zahl ein: ");
		int? naechsterWert = readNextInt();

		if (naechsterWert!! < 1 || naechsterWert!! > 7)
		{
			io::print("Ungültige Eingabe. Bitte geben Sie eine Zahl zwischen 1 und 7 ein.\n");
			continue;
		}

		int spalte = naechsterWert!! - 1;
		int zeile = getNextValidFreeRow(matrix, spalte);

		io::print("Eingegebene Spalte: ");
		io::print(spalte + 1);
		io::print("\n");
		io::print("Zeile: ");
		io::print(zeile + 1);
		io::print("\n");

		if (zeile == 0)
		{
			io::print("Diese Spalte ist voll. Bitte wählen Sie eine andere Spalte.\n");
			continue;
		}
		
		matrix[zeile][spalte] = 1;

		io::print("\n");
		for (int i = 0; i < 6; i++)
		{
			getBalken();
			getZeile(&matrix[i]);
		}
		getBalken();

	}


	// io::print("Bitte geben Sie eine Zahl ein: ");
	// int? naechsterWert = readNextInt();
	// io::print("Der eingegebene Wert ist: ");
	// io::print(naechsterWert!!);
	// io::print("\n");
	

	return 0;


}
