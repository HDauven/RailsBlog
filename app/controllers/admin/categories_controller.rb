class Admin::CategoriesController < Admin::ApplicationController
  before_filter :verify_logged_in

  def new
    @page_title = 'Add Category'
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = 'Category Created'
      redirect_to admin_categories_path
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      flash[:notice] = "Category Updated"
      redirect_to admin_categories_path
    else
      render 'new'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    flash[:notice] = "Category Removed"

    redirect_to admin_categories_path
  end

  def index
    if params[:search]
      @categories = Category.search(params[:search]).all.order('created_at DESC').paginate(:per_page => 5, :page => params[:page])
    else
      @categories = Category.all.order('created_at DESC').paginate(:per_page => 5, :page => params[:page])
    end
  end

  private

    def category_params
      params.require(:category).permit(:name)
    end
end
