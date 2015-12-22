require "action_mailer"
require "action_mailer/base"
require 'premailer'

class Mailer2 < ActionMailer::Base

  def prepare_html(html_file)
    Premailer.new(html_file, :warn_level => Premailer::Warnings::SAFE).to_inline_css
  end

  def mail2(html_file, email, subject, from=nil)
    premailer = Premailer.new(html_file, :warn_level => Premailer::Warnings::SAFE)
    # STDOUT.puts premailer.to_inline_css
    doc = Nokogiri::HTML(premailer.to_inline_css)
    # doc = File.open(html_file) { |f| Nokogiri::XML(f) }

    doc.css('img').each do |img|
      path = img['src']
      STDERR.puts "Process img: #{path}"
      attachments.inline[File.basename(path)] = File.read(File.expand_path(path, File.dirname(html_file)))
      img['src'] = attachments.inline[File.basename(path)].url
    end

    head_title = doc.css('head title')
    subject ||= head_title.text  if head_title.present?
    subject ||= File.basename(html_file)

    html = doc.to_s.html_safe

    from ||= email

    m = mail from: from, to: email, subject: subject do |format|
      format.text { render plain: premailer.to_plain_text }
      format.html { render html: html }
    end

    return m
  end
end

