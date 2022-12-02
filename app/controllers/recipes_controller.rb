class RecipesController < ApplicationController
    before_action :authorize
    def index
        render json: Recipe.all
    end

    def create
        user  = User.find(session[:user_id]) 
        recipe = Recipe.create!(user_id:user.id,title:recipe_params[:title], instructions:recipe_params[:instructions], minutes_to_complete:recipe_params[:minutes_to_complete])
        render json: recipe, status: :created
    end

    private
    def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete)
    end

    def authorize
        return render json: {errors: ["Not authorized"]}, status: :unauthorized unless session.include? :user_id
    end
end
