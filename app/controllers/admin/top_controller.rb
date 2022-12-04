class Admin::TopController < Admin::Base
  def index
    # raise Forbidden
    render action: "index"
  end
end
