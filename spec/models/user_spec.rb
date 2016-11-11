require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_db_column(:first_name).of_type(:string).with_options(null: false) }
  it { should have_db_column(:last_name).of_type(:string).with_options(null: false) }
  it { should have_db_column(:email).of_type(:string).with_options(null: false) }
  it { should have_db_column(:user_name).of_type(:string).with_options(null: false) }
  it { should have_db_column(:address).of_type(:string).with_options(null: false) }
  it { should have_db_column(:is_admin).of_type(:boolean) }
  it { should have_db_column(:password_digest).of_type(:string) }
  it { should have_many(:ideas)}
  it { should have_many(:comments) }
end
