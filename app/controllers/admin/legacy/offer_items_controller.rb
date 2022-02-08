class Admin::Legacy::OfferItemsController < AdminController
  def index
    @users_for_select = User.producers
      .joins(:legacy_offers)
      .order(:name)
      .select("users.*, count(legacy_offers.*) as offers_count")
      .group("users.id")
      .to_a
      .map { |user| ["#{user.name} (#{user.offers_count} offers)", user.id] }

    @offer_items = LegacyOfferItem
      .includes(legacy_offer: :user)
      .by_title(params[:title])
      .for_user(params[:user_id])
      .for_legacy_offer(params[:offer_id])
      .by_packaging(params[:packaging])
      .by_minimal_quantity_per_order(params[:minimal_quantity])
      .order(:title, :packaging, :unit_bulk, :unit_vario, :unit_package, :min_qty_per_order)
      .to_a

    if params[:user_id].present?
      @last_offer = LegacyOffer.where(user_id: params[:user_id]).order(:created_at).last
    end
  end

  def show
    @item = LegacyOfferItem.find params[:id]
    @offer = @item.legacy_offer
    @similar_items = LegacyOfferItem
      .similar_to(@item)
      .order(:title, :packaging, :unit_bulk, :unit_vario, :unit_package, :min_qty_per_order)
      .to_a
  end
end
