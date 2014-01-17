class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def log_page_view
    PageView.create(
      :referer     => request.referrer,
      :session     => request.session_options[:id],
      :ip_address  => request.remote_ip,
      :user_agent  => request.env["HTTP_USER_AGENT"],
      :created_at  => Time.current
      )

  end
end

# http://stackoverflow.com/questions/16103482/how-to-track-unique-visitors-and-page-views-in-rails-without-javascript

