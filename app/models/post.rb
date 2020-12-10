class Post < ApplicationRecord

    has_many_attached :image, :dependent => :destroy

end
