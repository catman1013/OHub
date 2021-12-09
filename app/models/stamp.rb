class Stamp < ApplicationRecord
  enum type: [ :面白い, :目から鱗, :ゴリラ]

  self.inheritance_column = :_type_disabled
end
