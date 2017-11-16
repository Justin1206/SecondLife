class ChatController < ApplicationController
  before_action :authenticate_user!  
  skip_authorization_check
  


end
