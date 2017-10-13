class CommentsController < ApplicationController
  before_action :find_report
  before_action :find_comment, only: [:destroy, :edit , :update,:comment_owner]
  before_action :comment_owner, only: [:destroy, :edit , :update]
  
  
  
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
  
  def edit
    
  end
  
  def update
    if @comment.update(params[:comment].permit(:content))
      redirect_to report_path(@report)
    else
      render 'edit'
    end
  end
  
  private
  
  def find_report
    @report= Report.find(params[:report_id])
  end
  
  def find_comment
  @comment= @report.comments.find(params[:id])
  end
  
  def comment_owner
    unless current_user == @comment.user
      flash[:notice] = 'No puedes acceder a esta sección'
      redirect_to @report
    end
    
  end
  
end