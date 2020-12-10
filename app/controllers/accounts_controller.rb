class AccountsController < ApplicationController
    #before_action :authenticate_account!
    
    def index
       #user dashboard - post feed
       @posts = Post.all
    end

    def show
        # user profile
    end

end
