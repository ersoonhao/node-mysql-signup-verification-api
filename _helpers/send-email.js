const nodemailer = require('nodemailer');
const config = require('config.json');

module.exports = sendEmail;


// function below is using nodemailer configuration 
// other mailers includes PHPMailer , SwiftMailer 
// Receive Email is not working?? Problem with IMAP?? Not sure


// Create a Nodemailer transporter using either SMTP or some other transport mechanism
// Set up message options (who sends what to whom)
// Deliver the message object using the sendMail() method of your previously created transporter


async function sendEmail({ to, subject, html, from = config.emailFrom }) {
    const transporter = nodemailer.createTransport(config.smtpOptions);
    console.log(transporter);
    await transporter.sendMail({ from, to, subject, html });
}