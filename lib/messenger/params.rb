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
      params['entry'].map { |entry| Parameters::Entry.new(entry.symbolize_keys) }
    end
  end
end
