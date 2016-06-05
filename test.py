SERVER = "smtp.outlook365.com"
FROM = "17100189@lums.edu.pk"
TO = ["saqib.lums@gmail.com"] # must be a list
port = 587
SUBJECT = "Hello!"
TEXT = "This is a test of emailing through smtp in google."

# Prepare actual message
message = """From: %s\r\nTo: %s\r\nSubject: %s\r\n\

%s
""" % (FROM, ", ".join(TO), SUBJECT, TEXT)

# Send the mail
import smtplib
server = smtplib.SMTP(SERVER, port)
server.starttls()
server.login("17100189@lums.edu.pk", "ss@lsince2013")
server.sendmail(FROM, TO, message)
server.quit()