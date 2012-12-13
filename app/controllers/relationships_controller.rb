class RelationshipsController < ApplicationController

  include SessionsHelper
  
  def show
    @relationship = Relationship.find(params[:id])
    @user = @relationship.user
    @child = @relationship.child
    @relation = @child.relationships.where(:user_id => current_user.id).map {|p| p.relation_type.name if p.relation_type }.to_sentence
    @gifts_by_user_pref = Gift.gift_by_pref_all_cat(@child, @relationship)
  end
  
  def create
    @relationship = Relationship.create(params[:relationship])
    @relationship.update_attributes(:user_id => current_user.id)
    redirect_to current_user
  end
  
  def update
    @relationship = Relationship.find(params[:id])
    if @relationship.update_attributes(params[:relationship])
      redirect_to :action => 'show'
    else
      render 'show'
    end
  end
    
end
