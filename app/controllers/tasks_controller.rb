class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :mark_completion]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new(project_id: params[:id])
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      @task.files.attach(task_params[:files])
      if @task.update(task_params.except(:files))
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def mark_completion
    @task.complete!
    redirect_to task_path(@task)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(id_in_params)
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:name, :description, :priority, :project_id, files: [])
    end
    
    def id_in_params
      params[:id] || params[:task_id]
    end
end
