class Post < ApplicationRecord

    mount_uploaders :image, ImageUploader

end
