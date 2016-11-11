require 'rails_helper'

RSpec.describe Role, type: :model do
  it { should have_db_column(:title).of_type(:string).with_options(null: false) }
  it { should have_db_column(:offered_user).of_type(:string) }
  it { should belong_to(:idea) }
end
