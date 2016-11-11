require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  # let(:user) { User.new(first_name: 'Sammy', last_name: 'Sams', email: 'sammy@sams.com', password: 'sammyisinhere', address: 'lahore',user_name:'ume') }

  describe 'create a new user' do
    before { User.delete_all }
    context 'valid parameters' do
      before do
        User.create(first_name: 'Sammy', last_name: 'Sams', email: 'sammy@sams.com', password: 'sammyisinhere', address: 'lahore',user_name:'ume')  

      end
      it 'saves the user' do
        expect(User.all.size).to eq(1)
      end
    end
    context 'invalid parameters' do
      before do
        User.create(first_name: '', last_name: '', email: '', password: '', address: '',user_name:'')
      end
      it 'does not save the user' do
        expect(User.all.size).to eq(0)
      end
    end
  end

  describe 'user login' do
    let(:user) { User.new(first_name: 'Sammy', last_name: 'Sams', email: 'sammy@sams.com', password: 'sammyisinhere', address: 'lahore',user_name:'ume') }
    context 'valid parameters' do
      before do
        user.save
        post :create, params:{user: { email: user.email, password: user.password }}
        # expect(response).to redirect_to('/all_ideas') 
      end
      it 'authenticates the user' do
        expect(response.response_code).to eq(200) 
      end
    end
  end

  describe 'all_users' do
    let(:user) { User.new(first_name: 'Sammy', last_name: 'Sams', email: 'sammy@sams.com', password: 'sammyisinhere', address: 'lahore',user_name:'ume') }
    context 'valid parameters' do
      before do
        user.save
        get :index 
      end
      it 'authenticates the user' do
        expect(response).to render_template(:index) 
      end
    end
  end
end
