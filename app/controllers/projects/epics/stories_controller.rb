class Projects::Epics::StoriesController < Projects::EpicsController
  before_filter :force_user
  before_filter :find_project
  before_filter :find_epic
  before_filter :find_story, except: [:new, :create, :index]


  def new
    @story = Story.new
  end

  def create
    @story = @epic.stories.create params[:story]
    redirect_to [@project, @epic, @story]
  end

  def update
    @story.update_attributes params[:story]
    redirect_to [@project, @epic] 
  end

  def destroy
    @story.destroy
    redirect_to [@project, @epic]
  end

private
  def find_story
    story_id = params[:story_id].present? ? params[:story_id] : params[:id]
    @story = Story.find(story_id)
  end
end