class Proion < ApplicationRecord
    has_many :eikonas
    
    def main_image
        return false if !check_for_images
        eikonas.where(best: "true").pluck(:path_ref).first 
    end

    def check_for_images
        eikonas.present?
    end
end
