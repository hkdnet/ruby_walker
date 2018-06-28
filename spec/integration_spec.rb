RSpec.describe 'integration' do
  subject(:actual) { `ruby main.rb foo.rb` }

  let(:expected) { `ruby foo.rb` }

  it { is_expected.to eq expected }
end
