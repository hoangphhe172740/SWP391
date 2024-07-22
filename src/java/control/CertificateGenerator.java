/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package control;

/**
 *
 * @author khanh
 */
import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.font.TextAttribute;
import java.awt.geom.RoundRectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.AttributedCharacterIterator;
import java.text.AttributedString;
import javax.imageio.ImageIO;
import java.util.Date;

public class CertificateGenerator {

    // Constants for dimensions, colors, and fonts
    private static final int WIDTH = 1200;
    private static final int HEIGHT = 800;
    private static final Color BACKGROUND_COLOR = new Color(255, 248, 220); // Ivory
    private static final Color TITLE_COLOR = new Color(51, 0, 102); // Dark purple
    private static final Color TEXT_COLOR = new Color(0, 0, 0);
    private static final Color MAIN_COLOR = new Color(67, 93, 125); // #435d7d
    private static final Color HIGHLIGHT_COLOR = new Color(102, 0, 153); // Purple
    private static final Font FONT_TITLE = new Font("Times New Roman", Font.BOLD, 48);
    private static final Font FONT_SUBTITLE = new Font("Times New Roman", Font.ITALIC, 24);
    private static final Font FONT_NAME = new Font("Times New Roman", Font.BOLD, 36);
    private static final Font FONT_TEXT = new Font("Times New Roman", Font.PLAIN, 36);
    private static final Font FONT_SIGNATURE = new Font("Great Vibes", Font.PLAIN, 18);

    public static void generateCertificate(String userName, String courseName) throws IOException {
        BufferedImage certificate = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
        Graphics2D g = certificate.createGraphics();
        g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

        // Background
        g.setColor(BACKGROUND_COLOR);
        g.fill(new RoundRectangle2D.Double(0, 0, WIDTH, HEIGHT, 30, 30));

        // Border
        g.setColor(TITLE_COLOR);
        g.setStroke(new BasicStroke(5));
        g.draw(new RoundRectangle2D.Double(5, 5, WIDTH - 10, HEIGHT - 10, 30, 30));
        // Seal
        BufferedImage seal = ImageIO.read(new File("D:\\Semester_5\\SWP391\\SWP391\\web\\img\\seal.png")); // Add your seal image path
        g.drawImage(seal, 100, 600, 200, 200, null);
        // Logo
        BufferedImage logo = ImageIO.read(new File("D:\\Semester_5\\SWP391\\SWP391\\web\\img\\logo.png")); // Replace with your badge image path
        g.drawImage(logo, 50, 50, 150, 150, null);

        // Title
        drawCenteredString(g, "CHỨNG NHẬN HOÀN THÀNH", FONT_TITLE, TITLE_COLOR, 150);

        // Subtitle
        drawCenteredString(g, "KHÓA HỌC", FONT_SUBTITLE, TITLE_COLOR, 200);

        // User Name
        drawCenteredString(g, userName.toUpperCase(), FONT_NAME, HIGHLIGHT_COLOR, 300);

        // Course Name
        AttributedString courseText = new AttributedString("Đã hoàn thành xuất sắc khóa học:");
        courseText.addAttribute(TextAttribute.FONT, FONT_TEXT);
        courseText.addAttribute(TextAttribute.FOREGROUND, TEXT_COLOR);
        AttributedString courseNameText = new AttributedString(courseName);
        courseNameText.addAttribute(TextAttribute.FONT, new Font("Times New Roman", Font.BOLD, 33)); // Make course name bold
        courseNameText.addAttribute(TextAttribute.FOREGROUND, MAIN_COLOR);
        AttributedCharacterIterator courseIterator = courseText.getIterator();
        AttributedCharacterIterator courseNameIterator = courseNameText.getIterator();
        g.drawString(courseIterator, (WIDTH - g.getFontMetrics().stringWidth(courseText.toString())) / 2, 380);
        g.drawString(courseNameIterator, (WIDTH - g.getFontMetrics().stringWidth(courseNameText.toString())) / 2, 420);

        // Signatures and Date
        g.setFont(FONT_SIGNATURE);
        g.setColor(TEXT_COLOR);
        // Cài đặt font hỗ trợ UTF-8
        g.drawString("NGUYỄN LAN ANH", 150, 550);
        g.drawString("Giám đốc khóa học", 150, 580);
        g.drawString("PHÚC YÊN", WIDTH - 300, 550);
        g.drawString("CEO & Nhà sáng lập", WIDTH - 300, 580);

        g.setFont(FONT_SIGNATURE);
        g.setColor(Color.GRAY);
        drawCenteredString(g, new Date().toString(), FONT_SIGNATURE, Color.GRAY, 650);

        g.dispose();

        // Save the certificate
        File outputfile = new File("certificate.png");
        ImageIO.write(certificate, "png", outputfile);
    }

    private static void drawCenteredString(Graphics2D g, String text, Font font, Color color, int y) {
        g.setFont(font);
        g.setColor(color);
        FontMetrics fm = g.getFontMetrics();
        int textWidth = fm.stringWidth(text);
        int x = (WIDTH - textWidth) / 2;
        g.drawString(text, x, y);
    }
}
