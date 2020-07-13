class Admin::CatelogiesController < ApplicationController
	def index
		@catelogies = Catelogy.all.paginate(page: params[:page], per_page: Settings.number)
	end

	def new
		@catelogy = Catelogy.new
	end

	def create
		@catelogy = Catelogy.new catelogy_params
	    if @catelogy.save
	      redirect_to admin_catelogies_path
	    else
	      flash[:error] = @catelogy.errors[:catelogy_id][0]
	      render 'new'
	    end
	end

	def destroy
		@catelogy = Catelogy.find params[:id]
	    @catelogy.destroy
	    redirect_to admin_catelogies_path
	end

	def update
		@catelogy = Catelogy.find params[:id]
	    if  @catelogy.update catelogy_params
	      redirect_to admin_catelogy_path params[:id]
	    else
	      render 'edit'
	    end
	end

	def show
		@catelogy = Catelogy.find params[:id]
	end

	def edit
		@catelogy = Catelogy.find params[:id]
	end

	private

	def catelogy_params
		params.require(:catelogy).permit(:name, :catelogy)
	end
end
