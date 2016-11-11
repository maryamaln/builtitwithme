
require 'rails_helper'

RSpec.describe Idea, type: :model do
  it { should have_db_column(:title).of_type(:string).with_options(null: false) }
  it { should have_db_column(:description).of_type(:text).with_options(null: false) }
  it { should have_db_column(:skills_description).of_type(:text).with_options(null: false) }
  it { should have_db_column(:platform).of_type(:string).with_options(null: false) }
  it { should have_db_column(:help_needed).of_type(:string).with_options(null: false) }
  it { should have_many(:comments) }
  it { should belong_to(:user) }
end