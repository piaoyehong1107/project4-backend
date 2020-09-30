class UsersController < ApplicationController
    def index
        @users=User.all 
        render :json=> @users.as_json(
        )
    end
    def show
        @user=User.find(params[:id])
        render :json=> @user.as_json()
    end
    def create
        @user=User.create(user_params)
        payload = { user_id: @user.id}
        token = JWT.encode(payload,'123','HS256')
        render :json => { :auth_key => token }, :status => :ok
    end
    private
    def user_params
        params.require(:user).permit(:username,:password)
    end
end
