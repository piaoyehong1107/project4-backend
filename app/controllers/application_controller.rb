class ApplicationController < ActionController::API
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
