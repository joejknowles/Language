class VerbsController < ApplicationController
  def index
    @verbs = VerbsHelper.get_verbs
  end
end
