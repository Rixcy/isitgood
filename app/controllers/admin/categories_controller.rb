class Admin::CategoriesController < AdminController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, notice: t('categories.notices.create_success')
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    respond_to do |format|
      format.html do
        redirect_to admin_categories_path, notice: t('categories.notices.update_success')
      end
    end
  end

  def destroy
    @category = Category.find(params[:id])

    if @category.destroy
      redirect_to admin_categories_path, notice: t('categories.notices.destroy_success')
    else
      @category.deprecate
      redirect_to admin_categories_path, notice: @category.errors[:base].first.to_s
    end
  end

  def enable
    @category = Category.find(params[:id])
    @category.active = true

    if @category.save
      redirect_to admin_categories_path, notice: t('categories.notices.re_enabled_success')
    else
      redirecet_to admin_categories_path, notice: @category.errors[:base].first.to_s
    end
  end

  private
    def category_params
      params.require(:category).permit(:image, :name)
    end
end
