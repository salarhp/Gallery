class ApplicationController < ActionController::Base
    before_action :getCategoryNav
    protect_from_forgery with: :exception

    private
    def getCategoryNav
        @getCategoryNav= Category.all
    end
end
