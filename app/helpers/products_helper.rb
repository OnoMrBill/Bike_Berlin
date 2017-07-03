module ProductsHelper
	
	def currency_to_number currency
 		currency.to_s.gsub(/[$,]/,'').to_f
	end

	def number_to_euro(amount)
	  number_to_currency(amount,:unit=>'€', format: "%n %u")
	end

end
