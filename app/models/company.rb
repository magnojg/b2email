class Company < ActiveRecord::Base
  has_many :campaigns, :dependent => :destroy

  has_attached_file :logo_image,
										:default_url => "null",
										:path => "/:id.:style.:filename",
                    :url => ":s3_domain_url"

  before_save :extract_dimensions
  serialize :logo_dimensions

  validates_attachment :logo_image,
												content_type: { content_type: /\Aimage\/.*\Z/ },
												size: { in: 0..1.megabytes }

  # Paperclip.interpolates :company_folder do |attachment, style|
  #   "COMP#{attachment.instance.id}"
  # end

  # Helper method to determine whether or not an attachment is an image.
  # @note Use only if you have a generic asset-type model that can handle different file types.
  def image?
    image_content_type =~ %r{^(image|(x-)?application)/(bmp|gif|jpeg|jpg|pjpeg|png|x-png)$}
  end

  private

  # Retrieves dimensions for image assets
  # @note Do this after resize operations to account for auto-orientation.
  def extract_dimensions
    return unless image?
    tempfile = image.queued_for_write[:original]
    unless tempfile.nil?
      geometry = Paperclip::Geometry.from_file(tempfile)
      self.logo_dimensions = [geometry.width.to_i, geometry.height.to_i].join('x')
    end
  end
end
