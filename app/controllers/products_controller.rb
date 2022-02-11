class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    @product.product_variants.build
  end

  # GET /products/1/edit
  def edit
    @product.product_variants.build if @product.product_variants.blank?
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params.merge(producer: current_user))

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_url, notice: t("products.notices.created") }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to products_url, notice: t("products.notices.updated") }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: t("products.notices.destroyed"), status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product)
            .permit(:title, :note, :producer_id,
                    product_variants_attributes: [:id, :additional_note, :type, :unit, :price, :min_quantity_per_order, :min_weight, :max_weight])
    end
end
