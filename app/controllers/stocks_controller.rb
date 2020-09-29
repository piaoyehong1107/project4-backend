class StocksController < ApplicationController
    def index
        @stocks=Stock.all 
        render :json=> @stocks.as_json(
        )
    end
    def show
        @stock=Stock.find(params[:id])
    end
    def create 
        @stock=Stock.create(stock_params)
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
