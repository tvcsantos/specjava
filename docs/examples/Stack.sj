public class Stack {
	
	private Entry head;
	
	class Entry {
		public Entry(int x)
			requires x:pos
		{
			this(x, null);
		}
    
		public Entry(int x, Entry n)
			requires x:pos
		{
			this.x = x;
			this.next = n;
		}
    
		private int x;
		invariant x:pos;
		private Entry next;
    	
		public Entry getNext() {
			return next;
		}
    	
		public int getElement()
			ensures return:pos
		{
			return x;
		}
	}
	
	public Stack() {
		head = null;
	}
	
	public void push(int i)
		requires i:pos
		ensures + !head:null
	{
		head = new Entry(i, head);
	}
	
	public int pop()
		requires + !head:null
		ensures return:pos
	{
		int res = head.getElement();
		head = head.getNext();
		return res;
	}	
}
