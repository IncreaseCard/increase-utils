RSpec.describe Increase::Utils do
  describe '#retry' do
    it 'retries the number of tries passed' do
      retriable = double
      allow(retriable).to receive(:method).and_raise(StandardError)
      expect { described_class.retry(3) { retriable.method } }
        .to raise_error(StandardError)
      expect(retriable).to have_received(:method).exactly(4).times
    end

    it 'allows to retry only some exceptions' do
      retriable = double
      allow(retriable).to receive(:method).and_raise(StandardError)
      expect { described_class.retry(3, ArgumentError) { retriable.method } }
        .to raise_error(StandardError)
      expect(retriable).to have_received(:method).exactly(1).times
    end
  end
end
