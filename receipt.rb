require 'sinatra'
require 'sinatra/json'
require 'json'

configure do
	set :erb, :layout => :layout
end

#checks to see if product type is excempt
#
def product_is_excempt(product_type)
  ['book','food','medical'].include? product_type
end


def calc_item_tax_rate(array)
  
end

get "/" do
  erb :index
end

get 'receipts/1' do
  @input1 = JSON.parse(File.read("fixtures/input1.json"))

end

get 'receipts/2' do
  @input2 = JSON.parse(File.read("fixtures/input2.json"))
end

get 'receipts/3' do
  @input3 = JSON.parse(File.read("fixtures/input3.json"))
end
