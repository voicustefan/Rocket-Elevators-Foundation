class Model < ApplicationRecord
    has_many :model, :dependent => :delete_all 
    has_many :model, :dependent => :destroy
    has_many :model, :dependent => :nullify
end