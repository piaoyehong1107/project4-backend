class ApplicationController < ActionController::API
  
    def login
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        payload = { user_id: @user.id }
        token = JWT.encode(payload,'123','HS256')
        render :json => { auth_key: token }
      else
        render :json => { :msg => "Login failed.. Try again" }
      end
    end
    def current_user
        auth_header = request.headers['Authorization']
        logger.debug "============> auth token"
        logger.debug auth_header
        token = auth_header.split(' ')[1]
        begin
          user_id = JWT.decode(token,'123')[0]["user_id"]
          @user = User.find_by(id: user_id)
          return user_id
        rescue
          nil
        end
    end
    
    def authenticate!
      unless current_user
        nil
      end
    end
end
