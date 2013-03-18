class Server < ActiveRecord::Base
  belongs_to :device
  belongs_to :type
  belongs_to :service
  attr_accessible :ip, :name, :password, :port, :root_password, :sysadm, :user, :device_id, :type_id, :service_id
end
