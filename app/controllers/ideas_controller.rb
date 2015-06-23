class IdeasController < ApplicationController

   def new
      @idea = Idea.new
   end

   def create
    @idea = current_user.ideas.create(idea_params)

    if @idea.save
      flash[:notice] = "You've created an idea!"
      redirect_to idea_path(@idea)
    else
      render :new
    end
  end

    def index
     @idea = Idea.all
    end

    def show
      @idea = Idea.find(params[:id])
      @comment = Comment.new
      @comments = @idea.comments
    end

    def edit
      @idea = Idea.find(params[:id])
    end

    def update
      @idea  = Idea.find(params[:id])
      if @idea.update(idea_params)
        redirect_to @idea, notice: "You have updated your idea!"
      else
        render :edit
      end
    end

    def destroy
      @idea = Idea.find(params[:id])
      @idea.destroy
      redirect_to ideas_path
    end

end
