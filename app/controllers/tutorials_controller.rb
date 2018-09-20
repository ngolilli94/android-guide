class TutorialsController < ApplicationController
    def index
        @tutorials = Tutorial.all
    end
    
    def show
        @tutorial = Tutorial.find(params[:id])
    end

    def new
        before_action :authenticate_developer!

        @tutorial = Tutorial.new
        @topics = Topic.all
    end

    def create
        before_action :authenticate_developer!

        Tutorial.create(tutorial_params)

        redirect_to :controller => 'tutorials', :action => 'index'
    end
    
    def edit
        before_action :authenticate_developer!

        @tutorial = Tutorial.find(params[:id])
        @topics = Topic.all
    end

    def update
        before_action :authenticate_developer!

        @tutorial = Tutorial.find(params[:id])
        @tutorial.update(tutorial_params)

        redirect_to :controller => 'tutorials', :action => 'index'
    end

    def destroy
        before_action :authenticate_developer!
        
        @tutorial = Tutorial.find(params[:id])
        @tutorial.destroy
    end

    private
    def tutorial_params
        params.require(:tutorial).permit(:title,:definition,:topic_id, :icon, figures: [])
    end
end