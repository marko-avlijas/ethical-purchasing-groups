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
      .order(title: :asc)
      .to_a
  end
end
