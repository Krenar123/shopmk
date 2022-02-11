class ProionsController < ApplicationController
    def index
        @proions = Proion.all
    end
end
