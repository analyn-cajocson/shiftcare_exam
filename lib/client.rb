require 'json'

class Client

  def initialize(file='clients.json')
    @file = JSON.parse(File.read(file))
  end

  def search(value, field='full_name')
    @file.select{|record| record['full_name'] == value}
  end

  def check_duplicates
    @file.group_by{|record| record['email']}.select { |_key, value| value.size > 1 }.values.flatten
  end
end
