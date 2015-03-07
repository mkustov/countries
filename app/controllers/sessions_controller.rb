class SessionsController < ApplicationController
  helper_method :resource
  def new
  end

  def create
    @user = authenticate(params)

    sign_in(@user) do |status|
      if status.success?
        redirect_back_or url_after_create
      else
        flash.now.notice = status.failure_message
        render 'sessions/new', status: :unauthorized
      end
    end
  end

  def destroy
    sign_out
    redirect_to url_after_destroy
  end

  protected

  def title_prefix
    'Authentication'
  end

  def resource
    @user
  end

  def url_after_create
    # Clearance.configuration.redirect_url
    root_url
  end

  def url_after_destroy
    root_url
  end

end
