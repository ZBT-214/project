class Version < ApplicationRecord

  has_one_attached :image
  has_many_attached :screenshots
  belongs_to :app
  has_one_attached :apk
  

  def apk_on_disk
  	ActiveStorage::Blob.service.send(:path_for, apk.key)
  end

  def to_s
  	self.app.name
  	self.apk
  end

  validates :apk, presence: true
  validates :image, presence: true, blob: { content_type: :image }
  validates :screenshots, presence: true, blob: { content_type: :image }

end
