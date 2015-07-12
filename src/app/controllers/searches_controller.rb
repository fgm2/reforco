class SearchesController < ApplicationController
    
    def search
        if (params[:model]=='users')
            @user = User.search params[:search]    
        end
        
    end
    
    def result
        if (params[:model]=='users')
            @users = User.search params[:search]
            render file: "layouts/_search_results.html"
        else
            redirect_to root_path
        end
        
    end
end
