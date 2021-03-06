require_relative 'result'
require 'savon'

module Service
  class Management
    def self.client
      wsdl = 'http://www.webservicex.net/country.asmx?WSDL'
      Savon.client(
        wsdl: wsdl,
        log: true,
        open_timeout: 25,
        read_timeout: 25,
        pretty_print_xml: true,
        env_namespace: :urn,
        raise_errors: false)
    end

    def self.invoke(action, message = nil)
      transaction_status = 'Success'
      data = {}

      call_result = client.call(action, message: message)

      if call_result.soap_fault?
        transaction_status = 'Failed'
        data = call_result.body.inspect
      else
        data = Hash.from_xml(call_result.body["#{action}_response".to_sym]["#{action}_result".to_sym])['NewDataSet']
      end

      API::Result.new(transaction_status, data)
    end
  end
end
