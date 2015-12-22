# Html2mail

Generates html/eml stuff for your newsletters from generic html (with images in separate files).


## Examples

Convert html with images to .eml

`bundle exec bin/html2mail convert /path/to/newsletter.html`

or all html files at once:

`bundle exec bin/html2mail convert /path/to/*.html`


Save "premailed" HTML files (convert css to inline styles):

`bundle exec bin/html2mail prepare /path/to/*.html`


Send test emails and use stored config for SMTP server:

`bundle exec bin/html2mail send /path/to/newsletters/*.html --to your@domain.com --domain=example.com --user=user@example.com --password=princess1 `

Init SMTP config:

> WARNING: Password stored as plain text in config file `.html2mail.yml` file in $HOME for Linux

`bundle exec bin/html2mail --domain=example.com --user=user@example.com --password=princess1 initconfig`

Send test emails and use stored config for SMTP server:

`bundle exec bin/html2mail send /path/to/newsletters/*.html --to your@domain.com`


## Based on gems

 * ActionMailer
 * premailer
 * GLI


### License

MIT License