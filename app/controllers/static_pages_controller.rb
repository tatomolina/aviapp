
class StaticPagesController < ApplicationController
skip_before_action :authenticate_user!, :only => [:unauthenticated]
#skip_after_action :verify_authorized

  def unauthenticated
  end
end
