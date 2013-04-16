class Server < ActiveRecord::Base
  belongs_to :device
  belongs_to :category
  belongs_to :service
  attr_accessible :ip, :name, :password, :port, :root_password, :sysadm, :user, :device_id, :category_id, :service_id
end
