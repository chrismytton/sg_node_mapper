require 'spec_helper'

describe SgNodeMapper::Caching do
  let(:js_context) { double }
  before { SgNodeMapper.instance.stub(context: js_context) }

  describe "cache miss" do

    it "calls the javascript context" do
      js_context.should_receive(:call).with('nodemapper.urlToGraphNode', 'miss').and_return('fresh')
      SgNodeMapper.url_to_graph_node('miss')
    end
  end

  describe "cache hit" do
    before do
      js_context.stub(call: 'cached')

      # Prime the cache.
      SgNodeMapper.url_to_graph_node('hit')
    end

    it "doesn't call the javascript context" do
      js_context.should_not_receive(:call)
      SgNodeMapper.url_to_graph_node('hit').should == 'cached'
    end
  end
end
