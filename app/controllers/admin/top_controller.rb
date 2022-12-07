class Admin::TopController < Admin::Base
  def index
    # raise Forbidden
    if current_administrator
      render action: "dashboard"
    else
      render action: "index"
    end
  end
end
