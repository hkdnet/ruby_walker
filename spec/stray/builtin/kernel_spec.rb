RSpec.describe Stray::Builtin::Kernel do
  subject { klass.new }
  let(:klass) { Class.new(BasicObject) { include Stray::Builtin::Kernel } }

  describe '#exit' do
    context 'with no arg' do
      it { expect { subject.exit }.to raise_error(SystemExit)  }
    end

    context 'with 1' do
      it do
        begin
          subject.exit(1)
        rescue SystemExit => e
          expect(e.status).to eq 1
        end
      end
    end
  end
end
