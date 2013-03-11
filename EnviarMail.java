import javax.mail.*; 
import javax.mail.internet.*; 
import java.util.*; 


	
	
	public class EnviarMail { 
	public static void main(String[] args) { 
	try { 
	
		for(int i=0;i<80;i++){
		Properties p = new Properties();
		p.setProperty("un nombre", "un valor");
		p.setProperty("PI", "3.1416");


		Properties props = new Properties();

		// Nombre del host de correo, es smtp.gmail.com
		props.setProperty("mail.smtp.host", "smtp.gmail.com");

		// TLS si está disponible
		props.setProperty("mail.smtp.starttls.enable", "true");

		// Puerto de gmail para envio de correos
		props.setProperty("mail.smtp.port","587");

		// Nombre del usuario
		props.setProperty("mail.smtp.user", "ejemplo@gmail.com");

		// Si requiere o no usuario y password para conectarse.
		props.setProperty("mail.smtp.auth", "true");


		Session session = Session.getDefaultInstance(props);
		session.setDebug(true);




		
		
		MimeMessage message = new MimeMessage(session);


		// Quien envia el correo
		message.setFrom(new InternetAddress("bainileonardo@gmail.com"));

		// A quien va dirigido
		//String destinatario="carlos.nelson.jimenez@googlemail.com";
		String destinatario2="midtowncreek@gmail.com";
		message.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatario2));
		
		message.setSubject("Mails con java by LB");
		message.setText("Aprendí a mandar mails con java!!! disculpen las molestias ocasionadas, jajaja.");
		
		/*El siguiente código crearía el mismo mensaje, pero con texto html y algún adorno de negrita y cursiva

message.setText(
"Mensajito con Java Mail<br>" + "<b>de</b> los <i>buenos</i>." + "poque si",
"ISO-8859-1",
"html");

*/
		
		Transport t = session.getTransport("smtp");

		//Ahora debemos establecer la conexión, dando el nombre de usuario y password.

		t.connect("bainileonardo@gmail.com","contraseña");

		//y ahora simplemente enviamos el mensaje

		t.sendMessage(message,message.getAllRecipients());
		}

		
		
		
	} catch (Exception ex) { 
	ex.printStackTrace(); 
	} 
	} 
	}




