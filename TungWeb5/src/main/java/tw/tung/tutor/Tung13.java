package tw.tung.tutor;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Tung13")
public class Tung13 extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String src = "C:\\Users\\User\\eclipse-workspace\\TungWeb5\\src\\main\\webapp\\upload\\coffee.jpg";
		
		String str = request.getParameter("str");
				
		BufferedImage img = ImageIO.read(new File(src));
		Graphics2D g2d = img.createGraphics();
		
		
		g2d.setColor(Color.DARK_GRAY);
		Font font = new Font(null, Font.BOLD, 64);
		
		AffineTransform tran = new AffineTransform(); // 文字變形用，骨子裡在處理數學的東西
		for(int i = 0;i<str.length();i++) {
			String s = str.substring(i, i+1);
			double ang = Math.random()*60 - 30 ;
			tran.rotate(Math.toRadians(ang));
			Font font2 = font.deriveFont(tran);
			g2d.setFont(font2);
			g2d.drawString(s, 100+(i*40), 150);
			tran.rotate(Math.toRadians(ang*-1));
		}
		
		
		
		
		// 宣告為image格式
		response.setContentType("image/jpeg");
		
		// 網頁輸出
		ServletOutputStream out = response.getOutputStream();
		ImageIO.write(img, "jpeg", out);
		
		// 到本機資料夾
		FileOutputStream fout = new FileOutputStream("C:\\Users\\User\\eclipse-workspace\\TungWeb5\\src\\main\\webapp\\upload\\new.jpg");
		ImageIO.write(img, "jpeg", fout);
		fout.flush();
		fout.close();
		
		response.flushBuffer();
		
		
	}

}
