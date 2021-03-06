#This file taken from HW3 as a base.

# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the (InterviewScheduler )?home\s?page$/ then '/welcome/index'
    when /^a candidate profile page$/ then '/candidates'
    when /^a recruiter profile page$/ then '/recruiters'
    when /^the "(.*)" (candidates|recruiters) page$/ then "/#{$2}/#{$1}"
    when /^the edit page for (candidate|recruiter) "(.*)"/ then "/#{$1}s/#{$2}/edit"
    when /^the list page for (candidate|recruiter) "(.*)"/ then "/#{$1}/#{$2}/list"
    when /^the "(.*)" calendar page&/ then "calendar"
    when /^the ForgotPassword page$/ then "/welcome/forgotpassword"
    when /^the edit event page for "(.*)"$/ then
      event = Event.find_by_name($1)
      "/event/show/#{event.id}"


    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
