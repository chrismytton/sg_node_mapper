require 'spec_helper'

describe SgNodeMapper do
  describe ".url_to_graph_node('http://twitter.com/google')" do
    subject { SgNodeMapper.url_to_graph_node('http://twitter.com/google') }
    it { should == 'sgn://twitter.com/?ident=google' }
  end

  describe ".parse_sgn_url('sgn://twitter.com/?ident=google')" do
    subject { SgNodeMapper.parse_sgn_url('sgn://twitter.com/?ident=google') }

    it "returns a hash" do
      subject.should be_a_kind_of(Hash)
      subject['domain'].should == 'twitter.com'
      subject['keyName'].should == 'ident'
      subject['value'].should == 'google'
    end
  end

  describe ".url_from_graph_node('sgn://twitter.com/?ident=google', 'profile')" do
    subject { SgNodeMapper.url_from_graph_node('sgn://twitter.com/?ident=google', 'profile') }
    it { should == 'http://twitter.com/google' }
  end
end
