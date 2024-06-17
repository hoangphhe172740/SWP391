/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
//czqn pyrq umwt srxu
public class Email {
    static final String from ="phamhaihoang50@gmail.com";
    static final String password ="jerf eeot qgzb empc";
    
    public void sendEmail(String to, String otp) {

        // Properties : Khai báo các thuộc tính
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP HOST
        props.put("mail.smtp.post", "465"); //TLS 587 SSL 465
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.auth", "true");

        //creat Authenticator
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        ;
        };
        
        //Phiên làm việc
        Session session = Session.getInstance(props, auth);

        // Gửi email
        MimeMessage msg = new MimeMessage(session);
        try {
            //Kiểu nội dung
            msg.addHeader("Content-type","text/html;charset = UTF-8");

            // Người gửi
            msg.setFrom(from);

            // Người nhận
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));

            // Tiêu đề email
            msg.setSubject("Mã OTP lấy lại mật khẩu","UTF-8");

            //msg Quy định ngày gửi
            msg.setSentDate(new Date());
            //Quy định email nhận phản hồi
//            msg.setReplyTo(InternetAddress.parse(to,false));

            //nội dung
            msg.setContent("<html>"
                    + "<body>"
                    + "<h1>"
                    + "Coursera"
                    + "</h1>"
                    + "Mã OTP lấy lại mật khẩu của bạn là: "
                    + "<b>" + otp + "</b>"
                    + "<p>Mã otp này sẽ tồn tại trong 5p</p>"
                    + "</body>"
                    + "</html>",
                    "text/html;charset = UTF-8");

            //Gửi email
            Transport.send(msg);
            System.out.println("Send mail success");

        } catch (MessagingException e) {
            System.out.println("Error send email");
            System.out.println(e);
        }
    }
}
