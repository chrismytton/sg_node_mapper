require 'spec_helper'

describe SgNodeMapper do
  describe ".url_to_graph_node('http://twitter.com/google')" do
    subject { SgNodeMapper.url_to_graph_node('http://twitter.com/google') }
    it { should == 'sgn://twitter.com/?ident=google' }
  end
end
