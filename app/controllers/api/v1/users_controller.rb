class Api::V1::UsersController < ApplicationController
skip_before_action :authorized, only: [:create, :show]

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def index
    @users = User.all
    render json: @users
  end

  def create
  @user = User.create(user_params)

  if @user.valid?
    @token = JWT.encode({user_id: @user.id}, 'my_s3cr3t')
    render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
  else
    render json: { error: 'failed to create user' }, status: :not_acceptable
  end
end

def show
  @user = User.find(params[:id])
  render json: {user: @user}

end


def update
    @user = User.find(params[:id])
    @user.update(user_params)
    render json: @user
  end

def destroy
  @user = User.find(params[:id])
  @user.destroy
end

    private

    def user_params
      params.require(:user).permit(:username, :password, :avatar, :bio, :favorite )
    end
end
