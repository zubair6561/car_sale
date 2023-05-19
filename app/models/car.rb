class Car < ApplicationRecord
  include PgSearch::Model
  multisearchable against: %i[carmodel city price enginedetail transmissiontype color milage
                              enginecapacity assemblytype]
end
