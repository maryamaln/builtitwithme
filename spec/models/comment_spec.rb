require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should have_db_column(:body).of_type(:string).with_options(null: false) }
  it { should belong_to(:idea) }
  it { should belong_to(:user) }
end
