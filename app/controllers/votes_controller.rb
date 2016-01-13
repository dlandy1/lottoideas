class VotesController < ApplicationController
  respond_to :html, :js

  def new
    @vote = Vote.new
  end

  def vote
     @post = Post.find(params[:post_id])
     create_vote
  end

  private 

  def create_vote
    @post = Post.find(params[:post_id])
    if @post.votes.where(address: request.remote_ip).empty?
      @vote = @post.votes.create(address: request.remote_ip)
    else 
      @post.votes.where(address: request.remote_ip).each do |v|
        v.destroy
      end
    end

    @post.hot

  end
end
