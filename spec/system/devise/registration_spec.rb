require 'rails_helper'

RSpec.describe "Devises", type: :system do
  before do
    driven_by(SYSTEM_SPECS_DRIVER)
  end

  describe "user registration" do
    let(:user_data) do
      {
        name: 'John Smith',
        phone: '099/1234567',
        email: 'someone@example.com',
        password: '12345678',
        neighborhood: 'Manhattan',
      }
    end

    context "happy path" do
      def fill_required_fields
        fill_in 'Name', with: user_data[:name] 
        fill_in 'Phone', with: user_data[:phone] 
        fill_in 'Email', with: user_data[:email] 
        fill_in 'Password', with: user_data[:password]
        fill_in 'Password confirmation', with: user_data[:password]
        check 'user[terms_of_service]'
      end

      it "fills required fields only, creates user and sends email" do
        visit '/users/sign_up'
        fill_required_fields

        # expect user is created and email is sent
        expect do
          expect { click_on 'Sign up'; sleep 1 }.to change { User.count }.by(1)
        end.to change { ActionMailer::Base.deliveries.count }.by(1)

        # assert user is created with correct attributes
        user = User.find_by!(email: user_data[:email])
        expected_attributes = user_data.except(:password, :neighborhood)
        expect(user).to have_attributes(expected_attributes)
        expect(user.valid_password?(user_data[:password])).to be true
      end

      it "fills all fields, creates user and sends email" do
        visit '/users/sign_up'
        fill_required_fields
        fill_in 'Neighborhood', with: user_data[:neighborhood]

        # expect user is created and email is sent
        expect do
          expect { click_on 'Sign up'; sleep 1 }.to change { User.count }.by(1)
        end.to change { ActionMailer::Base.deliveries.count }.by(1)

        # assert user is created with correct attributes
        user = User.find_by!(email: user_data[:email])
        expected_attributes = user_data.except(:password, :neighborhood)
        expect(user).to have_attributes(expected_attributes)
        expect(user.valid_password?(user_data[:password])).to be true
      end
    end

    context "when registration is unsuccessful" do
      it "missing required field" do
        visit '/users/sign_up'

        # didn't fill in phone
        fill_in 'Name', with: user_data[:name] 
        fill_in 'Email', with: user_data[:email] 
        fill_in 'Password', with: user_data[:password]
        fill_in 'Password confirmation', with: user_data[:password]
        check 'user[terms_of_service]'

        # ensure user is not created and no email is sent
        expect do
          expect { click_on 'Sign up' }.not_to change { User.count }
        end.not_to change { ActionMailer::Base.deliveries.count }
      end

      it "didn't accept terms of service" do
        visit '/users/sign_up'

        fill_in 'Name', with: user_data[:name] 
        fill_in 'Email', with: user_data[:email] 
        fill_in 'Phone', with: user_data[:phone] 
        fill_in 'Password', with: user_data[:password]
        fill_in 'Password confirmation', with: user_data[:password]

        # ensure user is not created and no email is sent
        expect do
          expect { click_on 'Sign up' }.not_to change { User.count }
        end.not_to change { ActionMailer::Base.deliveries.count }
      end
    end
  end
end
