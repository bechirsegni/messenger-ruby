module Messenger
  class Params
    attr_accessor :params

    def initialize(params)
      @params = params
    end

    def entries
      @entries_objects ||= build_entries
    end

    def first_entry
      entries[0].messagings[0]
    end

    private

    def build_entries
      entries_objects = []
      params['entry'].each do |entry|
        entries_objects << Messenger::Parameters::Entry.new({
          "id"=>entry["id"],
          "time"=>entry["time"],
          "messaging"=>entry["messaging"]
        }.symbolize_keys)
      end
      entries_objects
    end
  end
end
