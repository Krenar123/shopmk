# frozen_string_literal: true

class ProionsController < ApplicationController
  def index
    @proions = Proion.all
  end
end
