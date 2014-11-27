class Concert 
  extend ActiveModel::Naming 
  include ActiveModel::Conversion

  attr_accessor :username
  def initialize
    @username = ''
  end

  def persisted?
    false
  end
end
