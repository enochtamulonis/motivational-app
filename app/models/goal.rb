class Goal < ApplicationRecord
  has_rich_text :text
  has_one_attached :wallpaper
end
