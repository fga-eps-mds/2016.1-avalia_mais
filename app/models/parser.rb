require 'csv'

class Parser < ActiveRecord::Base
	#file = '/public/csv/2016-02.csv'
	def self.save_data(file)
		CSV.foreach(file, :col_sep => ';', :headers =>true, :encoding => ':utf-8') do |row|
			segment_record = Segment.find_or_create_by(:name => row[12])
			company_record = segment_record.companies.find_or_create_by(:name => row[11])
			uf_record = Uf.find_or_create_by(:name => row[1])
			evaluation_record = company_record.evaluations.find_or_create_by(:response_time => row[10], :grade => row [22], 
				:resolved => row[21])

			#evaluation_record.update_attributes(:uf_id => row[1])
		end
	end
end
