require 'client'

describe Client do

  before do
    @client = Client.new('../clients.json')
  end

  describe '#search' do
    it 'returns the matched query' do
      expect(@client.search('Ava Taylor')).to eq({"status" => "success",
                                                  "data" => [{ "id" => 9,
                                                              "full_name" => "Ava Taylor",
                                                              "email" => "ava.taylor@mail.com"
                                                            }]
                                                })
    end

    it 'returns error if the field is not existing' do
      expect(@client.search('Ava Taylor', 'surname')).to eq({ "status" => "failed", "error" => "Invalid search field"})
    end
  end

  describe '#check_duplicates' do
    it 'returns all the duplicate emails' do
      expect(@client.check_duplicates).to eq({"status" => "success",
                                              "data" => [{"id" => 2,
                                                            "full_name" => "Jane Smith",
                                                            "email" => "jane.smith@yahoo.com"
                                                          },
                                                          {"id" => 15,
                                                            "full_name" => "Another Jane Smith",
                                                            "email" => "jane.smith@yahoo.com"
                                                          }]
                                              })
    end
  end
end
