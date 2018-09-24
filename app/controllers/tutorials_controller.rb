class TutorialsController < ApplicationController
    def index
        @tutorials = Tutorial.all
    end
    
    def show
        @tutorial = Tutorial.find(params[:id])
        @subtopics = @tutorial.subjects
    end

    def new
        @tutorial = Tutorial.new
        @topics = Topic.all

        if developer_signed_in?

        else
            redirect_to :controller => 'topics', :action => 'index'
        end
    end

    def create
        Tutorial.create(tutorial_params)

        redirect_to :controller => 'tutorials', :action => 'index'
    end
    
    def edit
        @tutorial = Tutorial.find(params[:id])
        @topics = Topic.all

        if developer_signed_in?

        else
            redirect_to :controller => 'topics', :action => 'index'
        end
    end

    def update
        @tutorial = Tutorial.find(params[:id])
        @tutorial.update(tutorial_params)

        redirect_to :controller => 'tutorials', :action => 'index'
    end

    def destroy
        @tutorial = Tutorial.find(params[:id])
        @tutorial.destroy
    end

    private
    def tutorial_params
        params.require(:tutorial).permit(:title,:definition,:topic_id, :icon, figures: [])
    end
end