module Parameters
  class Entry
    def initialize(id:, time:, messaging: nil)
      @id = id
      @time = time
      @messagings = build_messagings(messaging) if messaging.present?
    end

    def build_messagings(messagings)
      messagings.map { |messaging| Messaging.new(messaging.symbolize_keys) }
    end
  end
end
