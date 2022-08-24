public class File {
	define open;
	
	public File()
		ensures + !open
	{
		assume + !open;
	}
	
	public void open()
		requires + !open
		ensures + open
	{
		assume + open; 
	}
	
	public void write(int b)
		requires + open
		ensures + open
	{ }
	
	public int read()
		requires + open
		ensures + open
	{ return 0; }

	public void close()
		requires + open
		ensures + !open
	{ 
		assume + !open; 
	}
	
	public pure void nothing() {}
	
	public static void main(String[] args) {
		File f = new File();
		f.open();
		f.nothing();
		f.nothing();
		f.close();
		f.nothing();
		f.open();
		f = f;
		//f.open(); // Fail as expected
		f.close();
		//f.close(); // Fail as expected
	}
}