public class Math {
	
	private pure Math() { }
	
	public static pure int abs(int x)
		ensures !return:neg 
	{
		if (x > 0) return x;
		else return -x;
	}
	
	public static pure int sqr(int x)
		ensures !return:neg
	{
		return x * x;
	}
	
	public static pure int fact(int x)
		requires !x:neg
		ensures return:pos
	{
		if (x == 0) return 1;
		else {
			int z = x - 1;
			int y = fact(z);
			return x * y;
		}
	}
	
	public static pure int factI(int x)
		requires !x:neg
		ensures return:pos
	{
		int i = 1;
		while (x > 1)
			invariant i:pos
		{
			i = i * x;
			x = x - 1;
		}
		return i;
	}

	public static void main(String[] args) {
		int x = fact(4);
		int y = fact(5);
		sassert x:pos && y:pos;
		System.out.println(x);
		System.out.println(y);
	}
}
