RSpec.describe RubyWalker::Builtin::Object do
  describe '#class' do
    it { expect(::RubyWalker::Builtin::Object.new.class).to eq ::RubyWalker::Builtin::Object }
  end
end
