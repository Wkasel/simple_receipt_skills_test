require 'sinatra'
require 'sinatra/json'
require 'json'

configure do
	set :erb, :layout => :layout
end

#checks to see if product type is excempt
#
def product_is_excempt(product)
  ['book','food','medical'].include? product['product_type']
end

def round_to_fivecents(num)
	((num*20).round.to_f/20).round(2)
end

def calc_item_tax_rate(sale_items)
  @sales_tax = 0.00
  @total = 0.00
  sale_items.each do |sale_item|

		if product_is_excempt(sale_item) then item_tax = (round_to_fivecents(sale_item['price']*0.1)).round(2) else item_tax = 0.00 end
		if sale_item['product'].include? "imported" then import_tax = (round_to_fivecents(sale_item['price']*0.05)).round(2) else import_tax = 0.00 end

    @sales_tax += (item_tax + import_tax)
    @total += round_to_fivecents(sale_item['price']+@sales_tax)
  end
	@sales_tax = round_to_fivecents(@sales_tax).round(2) # this is messy, I'll come back to it
	@total = round_to_fivecents(@total).round(2)
end

get "/" do
  erb :index
end

get '/receipts/1' do
	@items = JSON.parse(File.read("fixtures/input1.json"))
  calc_item_tax_rate(@items)
	erb :receipt
end

get '/receipts/2' do
	@items = JSON.parse(File.read("fixtures/input2.json"))
  calc_item_tax_rate(@items)
	erb :receipt
end

get '/receipts/3' do
	@items = JSON.parse(File.read("fixtures/input3.json"))
  calc_item_tax_rate(@items)
	erb :receipt
end
