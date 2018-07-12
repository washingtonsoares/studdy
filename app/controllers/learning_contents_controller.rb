class LearningContentsController < ApplicationController
  before_action :set_learning_content, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:create]
  # GET /learning_contents
  # GET /learning_contents.json
  def index
    @learning_contents = LearningContent.all
  end

  # GET /learning_contents/1
  # GET /learning_contents/1.json
  def show
  end

  # GET /learning_contents/new
  def new
    @learning_content = LearningContent.new
  end

  # GET /learning_contents/1/edit
  def edit
  end

  # POST /learning_contents
  # POST /learning_contents.json
  def create
    @learning_content = LearningContent.new(learning_content_params)
    @learning_content.course_id = 1

    respond_to do |format|
      if @learning_content.save
        format.html { redirect_to course_path(@learning_content.course), notice: 'Learning content was successfully created.' }
        format.json { render :show, status: :created, location: @learning_content }
      else
        format.html { render :new }
        format.json { render json: @learning_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /learning_contents/1
  # PATCH/PUT /learning_contents/1.json
  def update
    respond_to do |format|
      if @learning_content.update(learning_content_params)
        format.html { redirect_to @learning_content, notice: 'Learning content was successfully updated.' }
        format.json { render :show, status: :ok, location: @learning_content }
      else
        format.html { render :edit }
        format.json { render json: @learning_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /learning_contents/1
  # DELETE /learning_contents/1.json
  def destroy
    @learning_content.destroy
    respond_to do |format|
      format.html { redirect_to learning_contents_url, notice: 'Learning content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_learning_content
        @learning_content = LearningContent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def learning_content_params
      params.require(:learning_content).permit(:nome, :description, :url, :course_id)
    end
end
