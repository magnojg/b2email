require 'grape'
require 'json'

module API  
  class Base < Grape::API
    mount API::V1::Base
  end
end 