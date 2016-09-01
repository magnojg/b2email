class Company < ActiveRecord::Base
  has_many :campaigns, :dependent => :destroy

  has_attached_file :logo_image,
										:default_url => "null",
										:path => "/:company_folder/:id.:style.:filename",
                    :url => ":s3_domain_url"

  validates_attachment :logo_image,
												content_type: { content_type: /\Aimage\/.*\Z/ },
												size: { in: 0..1.megabytes }

  Paperclip.interpolates :company_folder do |attachment, style|
    "COMP#{attachment.instance.company.id}"
  end
end
