module ProductsHelper
	
  def cache_key_for_products
    count          = Product.count
    max_updated_at = Product.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "products/all-#{count}-#{max_updated_at}"
  end	
	
	def currency_to_number currency
 		currency.to_s.gsub(/[$,]/,'').to_f
	end

	def number_to_euro(amount)
	  number_to_currency(amount,:unit=>'€', format: "%n %u")
	end

end
