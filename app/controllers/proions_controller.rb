# frozen_string_literal: true

class ProionsController < ApplicationController
  def index
    @proions = Proion.all
    # except hottest, etcc.
    # kur ta trusin ni kategori qato i qel kejt
  end

  def show
    @proion = Proion.find(params[:id])

    render json: { html: render_to_string(partial: 'proions/proion_details', locals: { proion: @proion }) }
  end
end
