# html2mail

Console tool which generates html/eml stuff for your newsletters from html-files (support images in separate files)


## Examples

Show inline help:

General help: `html2mail help`
Hel for `send` command: `html2mail send --help`


Convert html with images to .eml

`html2mail convert /path/to/newsletter.html`

or all html files at once:

`html2mail convert /path/to/*.html`


Save "premailed" HTML files (convert css to inline styles):

`html2mail prepare /path/to/*.html`


Send test emails and use stored config for SMTP server:

`html2mail --smtp_address=mail.example.com --smtp_user_name=newsletter@example.com --smtp_password=princess1 send /path/to/newsletters/*.html --to your@domain.com --subj='Test mail'`


Init SMTP config:

> WARNING: Password stored as plain text in config file `.html2mail.yml` file in $HOME for Linux

`html2mail --smtp_address=mail.example.com --smtp_user_name=newsletter@example.com --smtp_password=princess1 initconfig`


Send test emails and use stored config for SMTP server:

`html2mail send /path/to/newsletters/*.html --to your@domain.com`


Send newsletter.html to all adresses from list.txt:

`html2mail bulksend -l list.txt newsletter.html`


## Based on gems

 * ActionMailer
 * premailer
 * nokogiri
 * GLI


### License

MIT License