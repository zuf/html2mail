require "action_mailer"
require "action_mailer/base"
require 'premailer'

class Mailer2 < ActionMailer::Base
  def mail2(html_file, email, subject, from)
    premailer = Premailer.new(html_file, :warn_level => Premailer::Warnings::SAFE)
    doc = Nokogiri::HTML(premailer.to_inline_css)

    doc.css('img').each do |img|
      path = img['src']
      filesystem_path = File.expand_path(path, File.dirname(html_file))
      if File.readable?(filesystem_path)
        # STDERR.puts "Process img: #{path}"
        attachments.inline[File.basename(path)] = File.read(filesystem_path)
        img['src'] = attachments.inline[File.basename(path)].url
      end
    end

    head_title = doc.css('head title')
    subject ||= head_title.text if head_title.present?
    subject ||= File.basename(html_file, File.extname(html_file))

    html = doc.to_s.gsub('[%%FEmail%%]', email).html_safe

    # from ||= email

    mail from: from, to: email, subject: subject do |format|
      format.text { render plain: premailer.to_plain_text }
      format.html { render html: html }
    end
  end
end

