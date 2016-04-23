class Ad < ActiveRecord::Base
  belongs_to :ad_bar
  has_one :campaign, :through => :ad_bar
  has_one :company, :through => :campaign

  has_attached_file :image,
										:styles => { medium: '250x250>', thumb: '100x100>' },
										:default_url => 'missing.jpg',
										:storage => :s3,
										:s3_region => 'us-west-2',
										:path => '/:company_folder/:campaign_folder/:id.:style.:filename',
										:bucket => 'webmail-ad-content',
                    :access_key_id => 'AKIAJFSOK243CTBL4SLA',
                    :secret_access_key => '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'

                    # :s3_host_alias => 'dmalx1hpwzmdi.cloudfront.net',
										# :url => ':s3_alias_url',
										

	validates_attachment :image,
												content_type: { content_type: /\Aimage\/.*\Z/ },
												size: { in: 0..1.megabytes }

  Paperclip.interpolates :company_folder do |attachment, style|
    "COMP#{attachment.instance.company.id}"
  end

  Paperclip.interpolates :campaign_folder do |attachment, style|
    "CAMP#{attachment.instance.campaign.id}"
  end
end
