require 'client'

describe Client do
  let(:valid_json_file) { './spec/fixtures/valid_clients.json' }
  let(:invalid_json_file) { './spec/fixtures/invalid_clients.json' }
  let(:nonexistent_json_file) { './spec/fixtures/nonexistent_clients.json' }

  context 'when using the default json file' do
    before do
      @client = Client.new
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

      it 'uses the additional field to query' do
        expect(@client.search('alex.johnson@hotmail.com', 'email')).to eq({"status" => "success",
                                                                  "data" => [{ "id" => 3,
                                                                              "full_name" => "Alex Johnson",
                                                                              "email" => "alex.johnson@hotmail.com"
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

  context 'when using other json file' do
    before do
      @client = Client.new(valid_json_file)
    end

    describe '#search' do
      it 'returns the matched query' do
        expect(@client.search('Sophia Brown')).to eq({"status" => "success",
                                                      "data" => [{ "id" => 4,
                                                                  "full_name" => "Sophia Brown",
                                                                  "email" => "sophia.brown@example.com"
                                                                }]
                                                    })
      end

      it 'uses the additional field to query' do
        expect(@client.search(7, 'id')).to eq({"status" => "success",
                                               "data" => [{ "id" => 7,
                                                          "full_name" => "Oliver Wilson",
                                                          "email" => "oliver.wilson@example.com"
                                                        }]
                                              })
      end

      it 'returns error if the field is not existing' do
        expect(@client.search('Garcia', 'surname')).to eq({ "status" => "failed", "error" => "Invalid search field"})
      end
    end

    describe '#check_duplicates' do
      it 'returns all the duplicate emails' do
        expect(@client.check_duplicates).to eq({"status" => "success",
                                                "data" => [{"id" => 5,
                                                              "full_name" => "Liam Davis",
                                                              "email" => "liam.davis@example.com"
                                                            },
                                                            {"id" => 8,
                                                              "full_name" => "Charlotte Taylor",
                                                              "email" => "liam.davis@example.com"
                                                            }]
                                                })
      end
    end
  end

  context 'validating the json file' do
    describe '#initialize' do
      context 'when loading a JSON file' do
        it 'loads valid JSON file successfully' do
          expect { Client.new(valid_json_file) }.not_to raise_error
        end
  
        it 'raises JSON::ParserError for invalid JSON format' do
          expect { Client.new(invalid_json_file) }.to raise_error(JSON::ParserError, /Error parsing JSON/)
        end
  
        it 'raises Errno::ENOENT for nonexistent JSON file' do
          expect { Client.new(nonexistent_json_file) }.to raise_error(Errno::ENOENT, /File not found or inaccessible/)
        end
      end
    end
  end
end
