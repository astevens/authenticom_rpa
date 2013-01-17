require "authenticom_rpa/version"

module Authenticom
  class RPA
    attr_accessor :access_code, :client

    def initialize(access_code)
      self.access_code = access_code
      self.client = Savon.client(:wsdl => File.dirname(__FILE__) + "/authenticom_rpa/rpalookup.asmx.xml")
    end
    def lookup(phone_number, options = {})
      options = {:id => "ID01", :dealer => "DEALER01"}
      phone_number = phone_number.gsub(/[^0-9]/, "")


      response = client.request(:find_info3) do
        soap.body = {
          :prospect => {
            "accessCode" => access_code,
            "id" => options[:id],
            "requestdate" => DateTime.now
          },
          :provider => {
            "name" => "PROVIDER01",
            "service" => "SERVICE01"
          },
          :dealership => {
            "dealershipID" => options[:dealer],
            "dealershipName" => options[:dealer]
          },
          :request => {
            "sourceID" => "SOURCE01",
            "phoneNumber" => phone_number
          }
        }
      end

      response.body[:find_info3_response][:find_info3_result][:match]
    end
  end
end
