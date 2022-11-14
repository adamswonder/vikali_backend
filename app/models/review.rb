class Review < ActiveRecord::Base
    belongs_to :user 
    belongs_to :product

    def self.create_review(params)
        Review.create(
            comment: params[:comment],
            rating: params[:rating],
            user_id: params[:user_id],
            product_id: params[:product_id]
        )
    end

    def self.delete_review(params)
        review = Review.find(params)
        review.destroy
    end

    def self.update_review(params)
        review = Review.find(params[:id])
        review.update(comment: params[:comment], rating: params[:rating])
    end
end