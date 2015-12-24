require 'test_helper'

class Html2mailTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Html2mail::VERSION
  end

  def test_it_should_convert_files_to_eml
    %w{rm test/files/*.eml}
    %x{bundle exec bin/html2mail convert test/files/*.html 2>&1 > /dev/null}

    Dir.glob('test/files/*.html').each do |f|
      eml = File.join(File.dirname(f), File.basename(f, File.extname(f)) + '.eml')
      assert File.exist?(eml)
      assert File.readable?(eml)
      assert File.size?(eml) >= File.size(f)
    end
  end

  def test_it_should_convert_files_to_eml_with_options
    skip "Should test command with options"
  end

  def test_it_should_prepare_files
    %w{rm -rf test/files/premailed}
    %x{bundle exec bin/html2mail prepare test/files/*.html 2>&1 > /dev/null}

    Dir.glob('test/files/premailed/*.html').each do |f|
      assert File.exist?(f)
      assert File.readable?(f)
      assert File.size?(f) > 100

      # Is this looks like html?
      content = File.read(f)
      assert content.include?('<')
      assert content.include?('>')
    end

    skip "Should test commant options"
  end

  def test_it_should_prepare_files_with_options
    skip "Should test command with options"
  end

  def test_it_should_send_emails
    skip
  end

  def test_it_should_send_emails_with_options
    skip
  end

  def test_it_should_bulksend_emails
    skip
  end


  def test_it_should_show_help
    skip
  end

  def test_it_should_store_settings
    skip
  end

  def test_it_should_test_mailer2
    skip
  end

  def test_it_should_convert_local_images_to_attachments
    skip
  end

  def test_it_should_leave_remote_image_urls
    skip
  end
end
