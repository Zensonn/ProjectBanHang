package com.hcmute.team7.azshop.utils;

import com.hcmute.team7.azshop.entity.User;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

public class Email {

    // Hàm tạo code ngẫu nhiên
    public String getRandom() {
        Random random = new Random();
        int number = random.nextInt(999999);
        return String.format("%06d", number);
    }

    // Gửi mail đến user
    public boolean sendEmail(User user) {
        boolean test = false;

        String toEmail = user.getEmail();
        String fromEmail = "xxx";
        String password = "xxx";

        try {
            Properties properties = configEmail(new Properties());

            Session session = Session.getInstance(properties, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            Message message = new MimeMessage(session);
            message.setHeader("Context-Type", "text/plain; charset=UTF-8");

            message.setFrom(new InternetAddress(fromEmail));

            message.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));

            message.setSubject("Confirm Code");

            message.setText("Your code is: " + user.getCode());

            Transport.send(message);

            test = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return test;
    }

    public boolean emailSend(User user) {
        boolean test = false;

        String toEmail = user.getEmail();
        String fromEmail = "20133024@student.hcmute.edu.vn";
        String password = "Bang097776505621";

        try {
            Properties properties = configEmail(new Properties());

            Session session = Session.getInstance(properties, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            Message message = new MimeMessage(session);
            message.setHeader("Context-Type", "text/plain; charset=UTF-8");

            message.setFrom(new InternetAddress(fromEmail));

            message.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));

            message.setSubject("Password");

            message.setText("Your password is: " + user.getPassword());

            Transport.send(message);

            test = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return test;
    }


    // Cấu hình chung Mail server
    public Properties configEmail(Properties properties) {
        properties.setProperty("mail.smtp.host", "smtp.gmail.com");
        properties.setProperty("mail.smtp.port", "587");
        properties.setProperty("mail.smtp.auth", "true");
        properties.setProperty("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.socketFactory.port", "587");
        properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

        return properties;
    }
}
