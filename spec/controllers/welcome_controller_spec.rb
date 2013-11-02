require 'spec_helper'

describe WelcomeController do
	describe 'show' do
		it 'should call Recruiter.find' do
			Recruiter.should_receive(:find)
		end
		it 'should call Candidate.find' do
			Candidate.should_receive(:find)
		end
		context 'valid username and valid password' do
			mock_account = Recruiter.mock('mock recruiter')
			mock_account.stub(:email).and_return('password')
			Recruiter.stub(:find).and_return(mock_account)
			it 'should redirect to the user page' do
				post :show, {:userid=>'name', :passid=>'password'}
				response.should redirect_to(candidate_path('name'))
			end
		end
		context 'valid username and invalid password' do
			it 'should flash a message about an incorrect password' do
			end
			it 'should redirect to the home page' do
			end
		end
		context 'invalid username' do
			Recruiter.stub(:find).and_return(nil)
			it 'should flash a message saying user not found' do
			end
			it 'should redirect to the home page' do
			end
		end
	end
end
