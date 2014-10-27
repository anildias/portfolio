class Photo < ActiveRecord::Base

	has_attached_file :image,
		:storage => :dropbox,
		:dropbox_credentials => { :app_key => "54gkoolq3sdnhpf",
			:app_secret => "ht6cgyn9h7e9qp1",
			:access_token => "3lmngnb1k4mgcdmo",
			:access_token_secret => "k2tzv1zfhhfdnar",
			:user_id => "93851919",
			:access_type => "app_folder"},
			:dropbox_visibility => 'public',
			:dropbox_options => {environment: ENV["RACK_ENV"]}
	validates_with AttachmentPresenceValidator, :attributes => :image
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	acts_as_taggable

end
