class Admin::SessionsController < Admin::Base

  skip_before_action :authorize

  def new
    if current_administrator
      redirect_to :admin_root
    else
      @form = Admin::LoginForm.new
      render action: "new"
    end
  end

  def create
    @form = Admin::LoginForm.new(login_form_params)
    if @form.email.present?
      administrator = Administrator.find_by("LOWER(email) = ?", @form.email.downcase)
    end
    if Admin::Authenticator.new(administrator).authenticate(@form.password)
      if administrator.suspended?
        flash.now.alert = "停止しています"
        render action: "new"
      else session[:administrator_id] = administrator.id
        flash.notice = "login!"
        redirect_to :admin_root
      end
    else
      flash.now.alert = "cannot login"
      render action: "new"
    end
  end

  private def login_form_params
    params.require(:admin_login_form).permit(:email, :password)
  end

  def destroy
    session.delete(:administrator_id)
    flash.notice = "logout"
    redirect_to :admin_root
  end
end
