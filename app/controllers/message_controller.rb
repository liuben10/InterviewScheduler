class MessageController < ApplicationController
    def index
      @type = params[:type]
      @from = params[:id]
      @user = Recruiter.find_by_username(@from)
    end

    def create
      new_message_hash = {:title => params[:title], :from => params[:from], :to => params[:to], :content => params[:content]}
      Message.create! new_message_hash
      if params[:type] == "recruiter"
        redirect_to recruiter_mailbox_path(params[:from], "inbox")
      else
        redirect_to candidate_mailbox_path(params[:from], "inbox")
      end
    end

    def show
      @type = params[:type]
      @user = params[:user_id]
      @message = Message.find(params[:id])
    end

end
