require 'rails_helper'

feature 'Sign in', :devise do
  scenario 'user cannot sign in if not registred' do
    signin('person@example', 'password')
    expect(page).to have_content 'Invalid email or passwod'
  end
  
  scenario 'user can sign in with valid credentials' do
    user = FactoryGirl.create(:user)
    signin(user.email, user.password)
    expect(page).to have_content 'Signed in successfully.'
  end
  
  scenario 'user cannot sign in with invalid email' do
    user = FactoryGirl.create(:user)
    signin('invalid@email.com', user.password)
    expect(page).to have_content 'Invalid email or password.'
  end
  
  scenario 'user cannot sign in with invalid password' do
    user = FactoryGirl.create(:user)
    singin(user.email, 'invalidpass')
    expect(page).to have_content 'Invalid email or password'
  end
  
end


  