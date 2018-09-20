class TopicsController < ApplicationController
    def index
        @topics = Topic.all
    end

    def show
        @topic = Topic.find(params[:id])
    end
    
    def new
        @topic = Topic.new
    end

    def create
        Topic.create(topic_params)

        redirect_to :controller => 'topics', :action => 'index'
    end

    def edit
        @topic = Topic.find(params[:id])
    end

    def update
        @topic = Topic.find(params[:id])
        @ttopic.update(topic_params)

        redirect_to :controller => 'topics', :action => 'index'
    end

    def destroy
        @topic = Topic.find(params[:id])
        @topic.destroy
    end

    private
    def topic_params
        params.require(:topic).permit(:title,:icon)
    end

end