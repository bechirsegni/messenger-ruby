module Messenger
  describe Params do
    let(:params) do
      {
        "object" => "page",
        "entry" => [
          {
            "id" => "1234",
            "time" => 1460967453657,
            "messaging" => [
              {
                "sender" => { "id" => "5678" },
                "recipient" => { "id" => "9012" },
                "timestamp" => 1460967453610,
                "message" => { "mid" => "MID", "seq" => 1, "text" => "TEXT" }
              }
            ]
          }
        ]
      }
    end

    subject { described_class.new(params) }

    describe '#entries' do
      it 'returns array of Entry objects' do
        expect(subject.entries).to all(be_a(Parameters::Entry))
      end
    end

    describe '#first_entry' do
      it 'returns Messaging object' do
        expect(subject.first_entry).to be_a(Parameters::Messaging)
      end
    end

    describe '#new' do
      it 'assigns raw params to params attribute' do
        expect(subject.params).to eq(params)
      end
    end
  end
end
