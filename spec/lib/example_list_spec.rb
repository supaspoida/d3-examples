require 'spec_helper'

require 'group_examples'

describe GroupExamples do
  let(:files) do
    %w|
        source/examples/map/usa.html
        source/examples/map/europe.html
        source/examples/sunburst/timeline.html
      |
  end
  let(:example_groups) { described_class[files] }

  subject { example_groups }

  it { should have(2).groups }

  describe 'map examples' do
    subject { example_groups['map'] }

    it { should have(2).examples }
  end

  describe 'sunburst examples' do
    subject { example_groups['sunburst'] }

    it { should have(1).example }
  end
end

describe Example do
  let(:file_path) { 'source/examples/map-things/usa-map.html' }

  subject { described_class.new file_path }

  its(:file_path) { should == file_path }
  its(:name) { should == 'usa map' }
  its(:path) { should == 'examples/map-things/usa-map.html' }
  its(:type) { should == 'map things' }
end
