class TopicsController < ApplicationController
    def index
        @topics = Topic.all
    end

    def show
        @topic = Topic.find(params[:id])
        @topic_tutorials = @topic.tutorials
    end
    
    def new
        @topic = Topic.new

        if developer_signed_in?

        else
            redirect_to :controller => 'topics', :action => 'index'
        end
    end

    def create
        Topic.create(topic_params)

        redirect_to :controller => 'topics', :action => 'index'
    end

    def edit
        @topic = Topic.find(params[:id])

        if developer_signed_in?

        else
            redirect_to :controller => 'topics', :action => 'index'
        end
    end

    def update
        @topic = Topic.find(params[:id])
        @topic.update(topic_params)

        redirect_to :controller => 'topics', :action => 'index'
    end

    def destroy
        @topic = Topic.find(params[:id])
        @topic.destroy

        if developer_signed_in?

        else
            redirect_to :controller => 'topics', :action => 'index'
        end
    end

    private
    def topic_params
        params.require(:topic).permit(:title,:icon)
    end

end