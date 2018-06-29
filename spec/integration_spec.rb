RSpec.describe 'integration' do
  subject(:actual) { `bin/stray foo.rb` }

  let(:expected) { `ruby foo.rb` }

  it { is_expected.to eq expected }
end
