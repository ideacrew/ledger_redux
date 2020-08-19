module Events
  class AccountsImporter
    XML_NS = { "cv" => "http://openhbx.org/api/terms/1.0" }

    def initialize(employer_xml)
      @xml = Nokogiri::XML(employer_xml)
    end

    def values
      hbx_id = @xml.xpath("//cv:organization/cv:id/cv:id", XML_NS).first.content.strip
      organization_name = @xml.xpath("//cv:organization/cv:name", XML_NS).first.content.strip
      dba = @xml.xpath("//cv:organization/cv:dba", XML_NS).first.content.strip
      fein = @xml.xpath("//cv:organization/cv:fein", XML_NS).first.content.strip

      {
        hbx_id: hbx_id,
        fein: fein,
        dba: dba,
        name: organization_name
      }
    end
  end
end
