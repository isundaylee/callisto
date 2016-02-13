class Fight < ActiveRecord::Base
  belongs_to :challenger, class_name: 'Robot'
  belongs_to :challengee, class_name: 'Robot'
end
