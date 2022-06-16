class Api::V1::ProductsController < ApplicationController
  # index renders all items in the products table
  def index
    products = Products.all
    render json: products, status: 200
  end

  # As the name implies this action lets us create a new product.
  # If the product saves correctly, we render the json data for the product.
  # If the product does not save correctly we render an error object.

  def create
    product = Product.new(
      name: prod_params[:name],
      name: prod_params[:brand],
      name: prod_params[:price],
      name: prod_params[:description],
    )

    if product.save
      render json: product, status: 200
    else
      render json: {error: "Error creating review."}
    end
  end

  # This method looks up the product by the id, if it found we render the json object
  # otherwise we render an error object
  def show
    product = Product.find_by(id: params[:id])
    if product
      render json: product, status: 200
    else
      render json: {error: "Product Not Found."}
    end
  end

  private
    def prod_params
      params.require(:product).permit([:name, :brand, :price, :description])
    end
end
