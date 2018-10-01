class User < ActiveRecord::Base
has_many :playlist
has_many :song
end
