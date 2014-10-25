class FormsController < ApplicationController
  before_action :logged_in_user, only: ['edit', 'new', 'create', 'update', 'destroy']

  def edit
    @form = Form.find(params[:id])
  end
  
  def new
    @form = Form.new
  end

  def create
    # Leaving the upload form blank results in the ActionController::ParameterMissing error
    begin
      @form = Form.new(form_params)
    rescue ActionController::ParameterMissing => e
      flash[:danger] = "No file chosen."
      redirect_to(:action => :new) and return
    end
    if @form.save
      flash[:success] = "Document uploaded."
      redirect_to forms_path
    else
      redirect_to "new"
    end
  end

  def update
    # Leaving the upload form blank results in the ActionController::ParameterMissing error
    if form_params.blank?
      flash[:danger] = "No file chosen."
      redirect_to(:action => :new) and return
    end

    @form = Form.find(params[:id])

    if @form.update_attributes(form_params)
      flash[:success] = "Document uploaded."
      redirect_to forms_path
    else
      redirect_to "edit"
    end
  end

  def index
    @forms = Form.all
  end

  def show
    @form = Form.find(params[:id])
  end

  def destroy
    @form = Form.find(params[:id])
    if @form.destroy
      flash[:success] = "Document deleted."
      redirect_to forms_path
    else
      flash[:danger] = "Unable to delete document."
      redirect_to @form
    end
  end

  private

    def form_params
      params.require(:form).permit(:document)
    end
end
