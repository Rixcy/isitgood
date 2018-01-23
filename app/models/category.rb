class Category < ActiveRecord::Base
  has_attached_file :image, styles: { original: '600>x600>' }
  before_save :extract_dimensions
  serialize :dimensions

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_presence_of :name
  validates_uniqueness_of :name

  def width
    dimensions[0]
  end

  def height
    dimensions[1]
  end

  private
    def extract_dimensions
      return unless image?
      tempfile = image.queued_for_write[:original]
      unless tempfile.nil?
        geometry = Paperclip::Geometry.from_file(tempfile)
        self.dimensions = [geometry.width.to_i, geometry.height.to_i]
      end
    end
end
