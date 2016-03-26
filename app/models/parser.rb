require 'csv'

class Parser < ActiveRecord::Base
	#file = '/public/csv/2016-02.csv'
	def self.save_data(file)
		CSV.foreach(file, :col_sep => ';', :headers =>true, :encoding => 'windows-1251:utf-8') do |row|
			company_record = Company.find_or_create_by(:name => row[11], :segment => row[12])

		end
	end
end
