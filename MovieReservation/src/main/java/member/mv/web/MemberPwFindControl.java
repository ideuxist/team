package member.mv.web;

import java.io.IOException;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.mv.dao.MovieDAO;
import member.mv.vo.MovieVO;

public class MemberPwFindControl implements Control {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String recipient = request.getParameter("email");

		MovieDAO dao = new MovieDAO();
		MovieVO vo = dao.findPw(id, recipient);
		
		if (vo != null) {

			// 1. 발신자의 메일 계정과 비밀번호 설정
			final String user = "mv.yd.adm@gmail.com";
			final String password = "wndrks11";

			// 2. Property에 SMTP 서버 정보 설정
			Properties prop = new Properties();
			prop.put("mail.smtp.host", "smtp.gmail.com");
			prop.put("mail.smtp.port", 465);
			prop.put("mail.smtp.auth", "true");
			prop.put("mail.smtp.ssl.enable", "true");
			prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

			// 3. SMTP 서버정보와 사용자 정보를 기반으로 Session 클래스의 인스턴스 생성
			Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, password);
				}
			});

			// 4. Message 클래스의 객체를 사용하여 수신자와 내용, 제목의 메시지를 작성한다.
			// 5. Transport 클래스를 사용하여 작성한 메세지를 전달한다.

			MimeMessage message = new MimeMessage(session);
			try {
				message.setFrom(new InternetAddress(user));

				// 수신자 메일 주소
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));

				// Subject
				message.setSubject("비밀번호 확인 메일입니다");

				// Text
				message.setText("문의하신 비밀번호는 "+vo.getPasswd().toString() + "입니다.");

				Transport.send(message); // send message

			} catch (AddressException e) {
				e.printStackTrace();
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			
			request.setAttribute("result", "비밀번호가 메일로 전송되었습니다. 메일함을 확인해주세요");
			request.getRequestDispatcher("member.result/findPwOutput.jsp").forward(request, response);

		} else {
			request.setAttribute("error", "정보를 찾을 수 없습니다. 아이디나 이메일이 정확한지 다시 확인해주세요");
			request.getRequestDispatcher("member.result/findPwOutput.jsp").forward(request, response);
		}
	}

}
