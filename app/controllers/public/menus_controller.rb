class Public::MenusController < ApplicationController
  before_action :authenticate_user!
end
