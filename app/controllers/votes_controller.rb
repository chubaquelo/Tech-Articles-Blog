class VotesController < ApplicationController
  def create
    @vote = current_user.votes.build(vote_params)
    if @vote.save
      flash[:notice] = 'You voted up this article.'
      redirect_to article_path(params[:article_id])
    else
      flash[:notice] = 'Error ocurred when voting.'
      redirect_to article_path(params[:article_id])
    end
  end

  def destroy
    @vote = current_user.votes.find_by(vote_params)
    if @vote.destroy
      flash[:notice] = 'You unvoted this article.'
      redirect_to :root
    else
      flash[:notice] = 'Error ocurred when unvoting.'
      redirect_to article_path(params[:article_id])
    end
  end

  private

  def vote_params
    params.permit(:article_id)
  end
end
