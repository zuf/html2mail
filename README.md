# Html2mail

Generates html/eml stuff for your newsletters from generic html (with images in separate files).


## Examples

Convert html with images to .eml

`bundle exec bin/html2mail convert /path/to/newsletter.html`

or all html files at once:

`bundle exec bin/html2mail convert /path/to/*.html`


Save "premailed" HTML files (convert css to inline styles):

`bundle exec bin/html2mail prepare /path/to/*.html`


Init SMTP config:

`bundle exec bin/html2mail --domain=example.com --user=user@example.com --password=princess1 initconfig`

Send test emails:

`bundle exec bin/html2mail send /path/to/newsletters/*.html --to your@domain.com`


## Based on gems

 * ActionMailer
 * premailer
 * GLI


### License

MIT License