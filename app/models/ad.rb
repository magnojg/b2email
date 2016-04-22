class Ad < ActiveRecord::Base
  belongs_to :ad_bar

  has_attached_file 	:image,
											:styles => { thumb: '100x100' },
											:default_url => 'missing.jpg',
											:storage => :s3,
											:s3_region => 'us-west-2',
											:s3_host_alias => 'dmalx1hpwzmdi.cloudfront.net',
											:url => ':s3_alias_url',
											:path => '/:class/:attachment/:id.:style.:filename',
											:bucket => 'comunik-app'

	validates_attachment :image,
												content_type: { content_type: /\Aimage\/.*\Z/ },
												size: { in: 0..1.megabytes }
end
