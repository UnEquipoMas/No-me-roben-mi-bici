class CommentsController < ApplicationController
  before_action :find_report
  before_action :find_comment, only: [:destroy]
  
  
  
  def create
     @comment = @report.comments.create(params[:comment].permit(:content))
     @comment.user_id = current_user.id
     @comment.save
     
     if @comment.save
      redirect_to report_path(@report)
    else
      render 'new'
     end
  end
  
  def destroy
    @comment.destroy
    redirect_to report_path(@report)
  end
  
  private
  
  def find_report
    @report= Report.find(params[:report_id])
  end
  
  def find_comment
  @comment= @report.comments.find(params[:id])
  end
  
end