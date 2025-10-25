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

fn int main(String[] args)
{

	int[7] werte = {1, 2, 3, 4, 5, 6, 7};

	getBalken();

	for (int i = 0; i < 6; i++)
	{
		getZeile(&werte);
		getBalken();
	}

	return 0;


}
