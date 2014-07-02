class SearchesController < ApplicationController
def show
 # @search_results = User.where(name: params[:q]) 
   @search_results = User.where("name LIKE ?", "%#{ params[:q]}%")
  
end

end
