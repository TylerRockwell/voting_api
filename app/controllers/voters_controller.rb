class VotersController < ApplicationController
  before_filter :restrict_access, except: :create

  def create
    v = Voter.new(name: params[:name], party: params[:party])
    v.save ? (render json: v.to_json) : (render json: v.errors)
  end

  def show
    render json: Voter.find_by(access_token: params[:access_token])
  end

  def update
    v = Voter.find_by(access_token: params[:access_token])
    v.name = params[:name] if params[:name]
    v.party = params[:party] if params[:party]
    v.save ? (render json: v) : (render json: v.errors)
  end

  private

  def restrict_access
    api_key = ApiKey.find_by_access_token(params[:access_token])
    head :unauthorized unless api_key
  end
end
