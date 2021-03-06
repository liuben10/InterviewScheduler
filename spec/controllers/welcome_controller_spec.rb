require 'spec_helper'

describe WelcomeController do
	describe 'show' do
		it 'should call Recruiter.find' do
			Recruiter.should_receive(:find_by_username)
			post :show
		end
		it 'should call Candidate.find' do
			Candidate.should_receive(:find_by_username)
			post :show
		end
		context 'valid username and valid password' do
			before (:each) do
				mock_account = mock("mock recruiter")
				mock_account.stub(:username).and_return('username')
				mock_account.stub(:password).and_return('password')
				Recruiter.stub(:find_by_username).and_return(mock_account)
			end
			it 'should redirect to the user page' do
				post :show, {:userid=>'username', :password=>'password'}
				response.should redirect_to(recruiter_path('username'))
			end
		end
		context 'valid username and invalid password' do
			it 'should flash a message about an incorrect password' do
			end
			it 'should redirect to the home page' do
			end
		end
		context 'invalid username' do
			before (:each) do
				Recruiter.stub(:find).and_return(nil)
			end
			it 'should flash a message saying user not found' do
			end
			it 'should redirect to the home page' do
			end
		end
	end
end
