class Stamp < ApplicationRecord
  enum type: { 面白い: 0, 目から鱗: 1, ゴリラ: 2 }

  self.inheritance_column = :_type_disabled
end
