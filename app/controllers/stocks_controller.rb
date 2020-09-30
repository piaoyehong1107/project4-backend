class StocksController < ApplicationController
    def index
        @stocks=Stock.all 
        render :json=> @stocks.as_json(
        )
    end
    # def index
    #     # token = request.headers['Auth-Key']
    #     # puts token
    #     # user_id = JWT.decode(token,'123')[0]["user_id"]
    #     @stocks=User.find_by(id: 2).stocks
    #     render :json=> @stocks.as_json()
    # end
    def create 
        @stock=Stock.create(stock_params)
        render :json=> @stock.as_json(
        )
    end
    def destroy
        @stock=Stock.find(params[:id])
        @stock.destroy
    end

    private
    def stock_params
        params.require(:stock).permit(:name, :symbol, :sector, :price)
    end

end
