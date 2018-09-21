class SubjectsController < ApplicationController    
    def show
        @subject = Subject.find(params[:id])
    end

    def new
        @subject = Subject.new
        @tutorials = Tutorial.all

        if developer_signed_in?

        else
            redirect_to :controller => 'topics', :action => 'index'
        end
    end

    def create
        subject.create(subject_params)

        redirect_to :controller => 'subjects', :action => 'show'
    end
    
    def edit
        @subject = Subject.find(params[:id])
        @tutorials = Tutorial.all

        if developer_signed_in?

        else
            redirect_to :controller => 'topics', :action => 'index'
        end
    end

    def update
        @subject = Subject.find(params[:id])
        @subject.update(subject_params)

        redirect_to :controller => 'subjects', :action => 'show'
    end

    def destroy
        @subject = Subject.find(params[:id])
        @subject.destroy
    end

    private
    def subject_params
        params.require(:subject).permit(:title,:definition,:tutorial_id, :icon, figures: [])
    end
end