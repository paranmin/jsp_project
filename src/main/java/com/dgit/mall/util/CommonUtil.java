package com.dgit.mall.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import com.dgit.mall.dto.Member;

public class CommonUtil {
	private static CommonUtil instance = new CommonUtil();

	public static CommonUtil getInstance() {
		return instance;
	}

	private CommonUtil() {
	}

	// 전화번호를 하이픈(-) 넣은 걸로 재생성해줌
	public String phoneNumberHyphenAdd(String num, boolean mask) {

		String formatNum = "";
		num = num.replaceAll("-", "");

		if (num.length() == 11) {
			if (mask) {
				formatNum = num.replaceAll("(\\d{3})(\\d{3,4})(\\d{4})", "$1-****-$3");
			} else {
				formatNum = num.replaceAll("(\\d{3})(\\d{3,4})(\\d{4})", "$1-$2-$3");
			}
		} else if (num.length() == 8) {
			formatNum = num.replaceAll("(\\d{4})(\\d{4})", "$1-$2");
		} else {
			if (num.length() == 9) {
				if (mask) {
					formatNum = num.replaceAll("(\\d{2})(\\d{3,4})(\\d{4})", "$1-****-$3");
				} else {
					formatNum = num.replaceAll("(\\d{2})(\\d{3,4})(\\d{4})", "$1-$2-$3");
				}
			} else {
				if (mask) {
					formatNum = num.replaceAll("(\\d{3})(\\d{3,4})(\\d{4})", "$1-****-$3");
				} else {
					formatNum = num.replaceAll("(\\d{3})(\\d{3,4})(\\d{4})", "$1-$2-$3");
				}
			}
		}
		return formatNum;
	}

	public String createRandomPassword() {
		return createRandomPassword(10);
	}

	public String createRandomPassword(int length) {
		char[] arrPwdWord = new char[] { '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a',
				'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
				'w', 'x', 'y', 'z', '!', '@', '#', '$', '%', '^', '&', '*', '(', ')' };

		StringBuilder returnPwd = new StringBuilder();

		for (int i = 0; i < length; i++) {
			int selectRndPwdWord = (int) (Math.random() * arrPwdWord.length);
			returnPwd.append(arrPwdWord[selectRndPwdWord]);
		}

		return returnPwd.toString();
	}

	private boolean sendMailBySSL(Map<String, String> mailContent) {
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");

		Session session = Session.getDefaultInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(mailContent.get("sendMailId"), mailContent.get("sendMailPwd"));
			}
		});

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(mailContent.get("sendMail"), mailContent.get("sendMailName"), "utf-8"));
			message.setRecipients(Message.RecipientType.TO, new InternetAddress[] {
					new InternetAddress(mailContent.get("toMail"), mailContent.get("toMailName"), "utf-8") });
			message.setSubject(mailContent.get("subject"));
			message.setText(mailContent.get("content"));
			message.setHeader("content-Type", "text/html");

			Transport.send(message);

			return true;

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return false;
	}

	public void sendFindPwdMail(Member member) {
		Map<String, String> mailContent = new HashMap<>();
		mailContent.put("sendMailId", "sendmail.yuma");
		mailContent.put("sendMailPwd", "eorndkdlxl3wh"); // 대구아이티3조
		mailContent.put("sendMail", "sendmail.yuma@gmail.com");
		mailContent.put("sendMailName", "SJ JEWELRY");
		mailContent.put("toMail", member.getEmail());
		mailContent.put("toMailName", member.getName());
		mailContent.put("subject", "[SJ JEWELRY] 임시 비밀번호 발송 메일!");

		StringBuilder mail = new StringBuilder();
		mail.append("<!DOCTYPE html>\r\n")
			.append("<html>\r\n")
			.append("<head>\r\n")
			.append("<meta charset=\"UTF-8\">\r\n")
			.append("<title>[SJ JEWELRY] 임시 비밀번호 발송 메일!</title>\r\n")
			.append("</head>\r\n")
			.append("<body>\r\n")
			.append("<div style=\"width:90%; margin:0 auto;\">\r\n")
			.append("    <header style=\"background-color: #333;\">\r\n")
			.append("        <h1 style=\"height: 80px;line-height: 80px;text-align: center;color: #fff;\">SJ JEWELRY</h1>\r\n")
			.append("    </header>\r\n")
			.append("    <section style=\"min-height: 300px;\">\r\n")
			.append("        <div style=\"border: 1px solid #eaeaea;width: 60%;margin: 50px auto;padding: 20px;\">\r\n")
			.append(String.format("            고객님의 비밀번호는 [%s]로 변경되었습니다.\r\n", member.getPwd()))
			.append("        </div>\r\n")
			.append("    </section>\r\n")
			.append("    <footer style=\"background-color: #e8e8e8;\">\r\n")
			.append("        <p style=\"height: 50px;line-height: 50px;text-align: center;\">copyright&copy; 2018</p>\r\n")
			.append("    </footer>\r\n")
			.append("</div>\r\n")
			.append("</body>\r\n")
			.append("</html>");
		mailContent.put("content", mail.toString());

		if (!sendMailBySSL(mailContent)) {
			System.err.println("관리자에게 문의!!");
		}
	}

	public void printMessageByJSON(HttpServletResponse response, Map<String, Object> jsonData) {
		response.setContentType("application/json;charset=utf-8");

		try {
			String json = new ObjectMapper().writeValueAsString(jsonData);
			PrintWriter out = response.getWriter();
			out.println(json);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
