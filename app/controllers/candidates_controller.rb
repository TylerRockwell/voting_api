class CandidatesController < ApplicationController
  def index
    render json: Candidate.all.to_json
  end

  def show
    render json: Candidate.find(params[:id])
  end
end
