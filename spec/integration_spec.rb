RSpec.describe 'integration' do\
  Dir[File.expand_path('./snippets/*.rb', __dir__)].each do |path|
    describe File.basename(path) do
      subject(:actual) { `bin/stray #{path}` }
      let(:expected) { `ruby #{path}` }

      it { is_expected.to eq expected }
    end
  end
end
