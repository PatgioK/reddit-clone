class ApplicationController < ActionController::Base

    def index
        @communities - Communities.all.limit(5)
    end



end
