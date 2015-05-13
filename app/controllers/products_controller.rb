class ProductsController < ApplicationController
  expose(:category)
  expose(:products)
  expose(:product)
  expose(:review) { Review.new }
  expose_decorated(:reviews, ancestor: :product)

  def index
  end

  def show
  end

  def new
  end

  def edit
    if (product.user != current_user && !current_user.admin?)
      redirect_to category_product_url(category, product), :flash => { :error => "You are not allowed to edit this product." }     
    end
  end

  def create
    self.product = current_user.products.new(product_params)
    
    if product.save
      category.products << product
      redirect_to category_product_url(category, product), notice: 'Product was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if product_params
      if (product.user == current_user || current_user.admin?)
        if self.product.update(product_params) 
          redirect_to category_product_url(category, product), notice: 'Product was successfully updated.'  
        else
          redirect_to category_product_url(category, product), :flash => { :error => "Product not saved." }                  
        end       
      else
        redirect_to category_product_url(category, product), :flash => { :error => "You are not allowed to edit this product." }
      end
    else
      redirect_to category_product_url(category, product), :flash => { :error => "Ooops. Something went wrong. Product not saved successfully."}
    end
  end

  # DELETE /products/1
  def destroy
    if (product.user == current_user || current_user.admin?)
      product.destroy
      redirect_to category_url(product.category), notice: 'Product was successfully destroyed.'
    else
        redirect_to category_product_url(category, product), :flash => { :error => "You are not allowed to destroy this product." }
    end  
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id)
  end
end
