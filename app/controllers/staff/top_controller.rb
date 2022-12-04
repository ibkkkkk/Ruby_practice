class Staff::TopController < Staff::Base
    def index
      # raise ActiveRecord::RecordNotFound
      render action: "index"
    end
end
