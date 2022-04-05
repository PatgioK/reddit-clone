class SubscriptionsController < ApplicationController

    def create
        @subscription = Subscription.new(subscription_params)
        @subscription.account_id = current_account.id
        @subscription.save
        redirect_to community_path(@subcription.community_id)
        # redirect_to community_path(params[:community_id])
        end
    end
    
    def subscription_params
        params.require(:subscription).permit(:community_id)
end