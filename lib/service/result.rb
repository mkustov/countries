module API
  RESPONCE ||= Struct.new(:transaction_status, :data)
  class Result < RESPONCE
    def success?
      transaction_status == 'Success'
    end
  end
end

