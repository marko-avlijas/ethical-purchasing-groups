class Admin::Legacy::OffersController < AdminController
  before_action :set_offer, only: [:show]

  def index
    @users_for_select = User.producers
      .joins(:legacy_offers)
      .order(:name)
      .select("users.*, count(legacy_offers.*) as offers_count")
      .group("users.id")
      .to_a
      .map { |user| ["#{user.name} (#{user.offers_count} offers)", user.id] }
                        
    order = "legacy_offers.id desc"
    @offers = LegacyOffer
                .includes(:user)
                .left_outer_joins(:legacy_offer_items)
                .by_title(params[:title])
                .for_user(params[:user_id])
                .order(order)
                .select("legacy_offers.*, count(legacy_offer_items.*) as items_count")
                .group("legacy_offers.id")
                .to_a


  end

  def show
  end

  private

    def set_offer
      @offer = LegacyOffer.find(params[:id])
    end
end
