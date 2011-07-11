class BlogController < ApplicationController
before_filter :authenticate

def new
        @title = "Create Blog"
        @blog = Blog.new
end

def create
        @blog = current_user.blog.build(params[:blog])
        if @blog.save
                flash[:success] = "Posted"
                redirect_to blog_index_path
        else
                @title = "Create Blog"
                @blog.title = nil
                @blog.content = nil
                render new_blog_path
        end
end


def show
       @title = "Blogs"
       @user= current_user
       @blog = current_user.blog.find(params[:id])
       @count = current_user.blog.count
end

def index
        @user = current_user
        @blog = @user.blog.all
end

def destroy
    @blog = current_user.blog.find(params[:id])
    @blog.destroy
    redirect_to blog_index_path
end

def closed_line 
        @blog = Blog.all
        @blog.each do |blog|
        a = blog.content.split
        b = a[0..10].join(' ')
end
end

   
end
