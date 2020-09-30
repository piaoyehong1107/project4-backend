class FavoritesController < ApplicationController
    before_action :find_stock, only: [:destroy]
    before_action :authenticate!, only: [:index,:destroy]

    def index
            current_user_id = current_user
            logger.debug "=============> current user id"
            logger.debug current_user_id
            if current_user_id
                @stocks = Favorite.where(user_id: current_user_id)
                render :json => @stocks.as_json(
                        include: [:user, :stock],
                        ), :status => :ok
            else
                render :json => { :msg => "Login first.." }
            end
    end

    def create
                logger.debug "==============="
                current_user_id = current_user
            logger.debug favorite_params
            logger.debug current_user_id
            @favorite = Favorite.create(stock_id: favorite_params[:stock_id], user_id: current_user_id)
        #     @stock.user = current_user

            # if @stock.save
            # render :json => @stock.as_json(only: [:id, :title, :img]), :status => :ok
            # else
            # render :json => { :msg => "stock creation failed.." }, :status => :bad_request
            # end
    end

    def destroy
            current_user_id = current_user
            if @favorite.user_id == current_user_id
            @favorite.destroy
            render :json => { :msg => "stock was destroyed" }, :status => :ok
            else
            render :json => { :msg => "You ain't authorized." }, :status => :ok
            end
    end

    private
    def favorite_params
            params.require(:favorite).permit(:user_id,:stock_id)
    end

end
