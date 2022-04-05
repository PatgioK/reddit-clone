class SubscriptionsController < ApplicationController

    def create
        @subscription = Subscription.new(subscription_params)
        @subscription.account_id = current_account.id
        @subscription.save
        redirection_to community_path(@subcription.community_id)
        end
    end
    
    def subscription_params
        params.require(:subscription).permit(:community_id)
end