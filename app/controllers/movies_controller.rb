class MoviesController < ApplicationController   
    def index   
       @movies = Movie.all   
    end  
    
    def show
        @movies = Movie.find(params[:id])
    end
       
    def new   
       @movies = Movie.new   
    end   
       
    def create   
       @movies = Movie.new(movie_params)   
          
       if @movies.save   
        #   redirect_to movie_path, notice: "Successfully uploaded."   

        redirect_to movie_path(@movies)
       else   
          render "new"   
       end   
          
    end   
       
    def destroy   
       @movies = Movie.find(params[:id])   
       @movies.destroy   
       redirect_to movies_path, notice:  "Successfully deleted."   
    end   



    def edit
        @movies = Movie.find(params[:id])
    end

    def update
        @movies = Movie.find(params[:id])
        if @movies.update(movie_params)
            flash[:notice] ="Todo updated successfully!"
            redirect_to movie_path(@movies)
        else
            render 'edit'
        end

    end
       
    private   
       def movie_params   
       params.require(:movie).permit(:title, :category, :year, :price, :attachment)   
    end   
       
  end  