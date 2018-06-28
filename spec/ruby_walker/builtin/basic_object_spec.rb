RSpec.describe RubyWalker::Builtin::BasicObject do
  describe '#class' do
    subject { RubyWalker::Builtin::BasicObject.new }
    it { expect { subject.class }.to raise_error(::NotImplementedError) }
  end
end
