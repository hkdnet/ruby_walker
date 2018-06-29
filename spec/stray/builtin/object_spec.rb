RSpec.describe Stray::Builtin::Object do
  describe '#class' do
    it { expect(::Stray::Builtin::Object.new.class).to eq ::Stray::Builtin::Object }
  end
end
