class TopicsController < ApplicationController
    def index
        @topics = Topic.all
    end

    def show
        @topic = Topic.find(params[:id])
    end
    
    def new
        before_action :authenticate_developer!

        @topic = Topic.new
    end

    def create
        before_action :authenticate_developer!

        Topic.create(topic_params)

        redirect_to :controller => 'topics', :action => 'index'
    end

    def edit
        before_action :authenticate_developer!

        @topic = Topic.find(params[:id])
    end

    def update
        before_action :authenticate_developer!

        @topic = Topic.find(params[:id])
        @ttopic.update(topic_params)

        redirect_to :controller => 'topics', :action => 'index'
    end

    def destroy
        before_action :authenticate_developer!
        
        @topic = Topic.find(params[:id])
        @topic.destroy
    end

    private
    def topic_params
        params.require(:topic).permit(:title,:icon)
    end

end