class VotersController < ApplicationController
  before_filter :restrict_access, except: :create

  def create
    v = Voter.create(name: params[:name], party: params[:party])
    v.access_token = ApiKey.create.access_token
    v.save ? (render json: v.to_json) : (render json: v.errors)
  end

  def show
    render json: Voter.find_by(access_token: params[:access_token])
  end

  def update
    v = Voter.find_by(access_token: params[:access_token])
    v.update_attribute(:name, params[:name]) unless params[:name]    == ""
    v.update_attribute(:party, params[:party]) unless params[:party] == ""
    render json: v.to_json
    # v.update_attributes(user_params) ? (render json: v.reload.to_json) : (render json: v.errors)
  end

  private

  def restrict_access
    api_key = ApiKey.find_by_access_token(params[:access_token])
    head :unauthorized unless api_key
  end

  def user_params
    params.permit(:name, :party)
end
end
