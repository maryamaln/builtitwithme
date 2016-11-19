require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "Idea should be created without title" do
  	idea = Idea.new(description: 'Sammy', skills_description: 'Sams', platform: 'lahore',help_needed:'ume',user_id: 1) 
    assert_not idea.save
  end

  test "Idea should be created without description" do
  	idea = Idea.new(title: 'Sammy', skills_description: 'Sams', platform: 'lahore',help_needed:'ume',user_id: 1) 
    assert_not idea.save
  end

  test "Idea should be created without skills_description" do
  	idea = Idea.new(title: 'Sammy', description: 'Sams', platform: 'lahore',help_needed:'ume',user_id: 1) 
    assert_not idea.save
  end

  test "Idea should be created without help_needed" do
  	idea = Idea.new(title: 'Sammy', description: 'Sams', platform: 'lahore',skills_description:'ume',user_id: 1) 
    assert_not idea.save
  end

  test "Idea should be created without platform" do
  	idea = Idea.new(title: 'Sammy', description: 'Sams', description: 'lahore',skills_description:'ume',user_id: 1) 
    assert_not idea.save
  end

  test "Idea should be created without user_id" do
  	idea = Idea.new(title: 'Sammy', description: 'Sams', description: 'lahore',skills_description:'ume',platform: "Pak") 
    assert_not idea.save
  end
end
