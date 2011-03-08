require File.expand_path File.join(File.dirname(__FILE__), 'test_helper')

class PaymentManagerTest < Test::Unit::TestCase
  context "generating a new file" do
    setup {
      @manager = WellsFargo::PaymentManager.new('TestCompany')
    }
    context "with one simple element" do
      setup {
        @manager.file do |file|
          file.file_info_grp 'Content'
        end
      }
      should "print proper xml instruct" do
        assert @manager.to_xml =~ %r{<\?xml version="1.0" encoding="UTF-8"\?>}
      end
      should "nest file_info_grp under <File> tag" do
        assert @manager.to_xml =~ %r{<File.*>\n\s*<FileInfoGrp}
      end
      should "indent with two spaces" do
        assert_equal NESTED, @manager.to_xml
      end
    end
  end
  NESTED = <<-NESTED
<?xml version="1.0" encoding="UTF-8"?>
<File CompanyID="TestCompany" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <FileInfoGrp>Content</FileInfoGrp>
</File>
NESTED
end