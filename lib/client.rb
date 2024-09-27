require 'json'

class Client

  def initialize(json_file='./clients.json')
    @file = load_json_file(json_file)
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
    def load_json_file(file_path)
      json_data = read_json_file(file_path)
      JSON.parse(json_data)
    rescue JSON::ParserError => e
      raise JSON::ParserError, "Error parsing JSON: #{e.message}"
    rescue Errno::ENOENT
      raise Errno::ENOENT, "File not found or inaccessible: #{file_path}"
    end

    def read_json_file(file_path)
      File.read(file_path)
    end

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
