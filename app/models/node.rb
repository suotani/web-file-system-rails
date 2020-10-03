class Node < ApplicationRecord

  has_many :nodes, class_name: "Node", foreign_key: 'parent_id'
  belongs_to :parent, class_name: "Node", foreign_key: 'parent_id', optional: true


  validates :name, presence: true
  def parent_list
    node = self
    list = []
    while(node.parent != nil)
      list.unshift(node.parent)
      node = node.parent
    end
    list
  end

  def file?
    node_type == "file"
  end
end
