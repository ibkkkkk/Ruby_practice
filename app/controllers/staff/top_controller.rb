class Staff::TopController < Staff::Base

  skip_before_action :authorize

  def index
    # raise ActiveRecord::RecordNotFound
    render action: "index"
  end
end
