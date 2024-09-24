require 'json'

class Client

  def initialize(file='clients.json')
    @file = JSON.parse(File.read(file))
  end

  def search(value, field='full_name')
    return error_response("Invalid search field") unless @file.flat_map{ |item| item.keys }.include?(field)

    result = @file.select{|record| record[field] == value}
    success_response(result)
  end

  def check_duplicates
    result = @file.group_by{|record| record['email']}.select { |_key, value| value.size > 1 }.values.flatten
    success_response(result)
  end

  private
    def success_response(data)
      {
        "status" => "success",
        "data" => data
      }
    end

    def error_response(msg)
      {
        "status" => "failed",
        "error" => msg
      }
    end
end
