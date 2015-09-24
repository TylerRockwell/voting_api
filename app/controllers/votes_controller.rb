class VotesController < ApplicationController
  before_filter :restrict_access, except: :index

  def create
    vote = Vote.new
    vote.candidate_id = params[:candidate_id]
    vote.voter_id = params[:voter_id]
    vote.save ? (render json: vote.to_json) : (render json: vote.errors)
  end

  def destroy
    voter = Voter.find_by(access_token: params[:access_token])
    voter.vote.destroy
    render json: "Vote destroyed"
  end

  def index
  end

  private

  def restrict_access
    api_key = ApiKey.find_by_access_token(params[:access_token])
    head :unauthorized unless api_key
  end
end
