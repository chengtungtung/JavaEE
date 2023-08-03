package tw.tung.apis;

public class Tung19M {
	private int x, y;

	public Tung19M(String x, String y) throws Exception {
		this.x = Integer.parseInt(x);
		this.y = Integer.parseInt(y);
	}
	
	public int plus() {
		return x+y;
	}
	
}
