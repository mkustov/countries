class Manage
  def self.client
    wsdl = 'http://www.webservicex.net/country.asmx?WSDL'
    Savon.client(
      wsdl: wsdl,
      log: true,
      open_timeout: 5,
      read_timeout: 5,
      pretty_print_xml: true,
      env_namespace: :urn,
      raise_errors: false)
  end

  def self.invoke(action, message)
    transaction_status = 'Success'
    data = {}

    call_result = client.call(action, message: message)

    if call_result.soap_fault?
      transaction_status = 'Failed'
      data = call_result.body.inspect
    else
      data = call_result.body["#{action}_response".to_sym]
    end
  end
end
