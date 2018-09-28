RSpec.describe 'integration' do
  def exec(cmd)
    `#{cmd}`
    raise "fail: #{cmd}" if $?.exitstatus != 0
  end

  Dir[File.expand_path('./snippets/*.rb', __dir__)].each do |path|
    describe File.basename(path) do
      subject(:actual) { exec "bin/stray #{path}" }
      let(:expected) { exec "ruby #{path}" }

      it { is_expected.to eq expected }
    end
  end
end
