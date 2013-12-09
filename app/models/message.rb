class Message < ActiveRecord::Base
   attr_accessible :title, :from, :to, :content, :unread
end
