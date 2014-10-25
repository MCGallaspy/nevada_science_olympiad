class ResultsController < ApplicationController
  # There should be only one instance of the Result model
  before_action -> { @RESULT = Result.first }
  before_action :logged_in_user, except: :index

  def mercury_update
    @RESULT.content = params[:content][:content][:value]
    @RESULT.save
    render text: ""
  end

  def upload_results_file
    @RESULT.document = params[:result][:document]
    if @RESULT.save
      flash[:success] = "File uploaded."
    else
      flash[:danger] = "Unable to upload file."
    end
    redirect_to results_path
  end

  def delete_results_file
    @RESULT.document = nil
    @RESULT.save
    redirect_to results_path
  end

  def index
  end 
end
