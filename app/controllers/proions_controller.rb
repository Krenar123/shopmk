# frozen_string_literal: true

class ProionsController < ApplicationController
  def index
    @proions = Proion.all
    @categories = Category.all
  end
end
