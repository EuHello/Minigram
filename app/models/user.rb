class User < ActiveRecord::Base
validates_presence_of :name, :email
validates_format_of   :email, with: /@/
validates_uniqueness_of   :name, :email
end
