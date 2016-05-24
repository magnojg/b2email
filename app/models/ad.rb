class Ad < ActiveRecord::Base
  belongs_to :ad_bar
  has_one :campaign, :through => :ad_bar
  has_one :company, :through => :campaign

  has_attached_file :image,
										:default_url => 'missing.jpg',
										:path => '/:company_folder/:campaign_folder/:id.:style.:filename',
                    :url => ":s3_domain_url"
                    # :s3_permissions
                    # :styles => { medium: '250x250>', thumb: '100x100>' }, # as imagens já são submetidas com o tamanho correto
										# :storage => :s3,
										# ,
										# :bucket => 'webmail-ad-content'
                    #,
                    # :s3_host_alias => 'dmalx1hpwzmdi.cloudfront.net',
										# :url => ':s3_alias_url',

  before_save :extract_dimensions
  serialize :dimensions

  validates_attachment :image,
												content_type: { content_type: /\Aimage\/.*\Z/ },
												size: { in: 0..1.megabytes }

  Paperclip.interpolates :company_folder do |attachment, style|
    "COMP#{attachment.instance.company.id}"
  end

  Paperclip.interpolates :campaign_folder do |attachment, style|
    "CAMP#{attachment.instance.campaign.id}"
  end

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
      self.dimensions = [geometry.width.to_i, geometry.height.to_i].join('x')
    end
  end
end
