class ReviewsController < ApplicationController
    before_action :find_cocktail, only: %i[new create]

    def new
        @review = Review.new
    end

    def create
        @review = Review.new(review_params)
        @review.cocktail = @cocktail

        if @review.save
            redirect_to cocktail_path(@cocktail)
        else
            render :new
        end
    end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy

        redirect_to cocktail_path(@review.cocktail)
    end

    private 

    def review_params
        params.require(:review).permit(:content)
    end

    def find_cocktail
        @cocktail = Cocktail.find(params[:cocktail_id])
    end

end
