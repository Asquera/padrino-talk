require 'spec_helper'

describe "Posts Model" do
  let(:posts) { Posts.new }
  it 'can be created' do
    posts.should_not be_nil
  end
end
