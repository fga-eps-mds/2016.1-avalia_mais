require 'csv'

class Parser < ActiveRecord::Base
	#file = '/public/csv/2016-02.csv'
	def self.save_data(file)
		CSV.foreach(file, :col_sep => ';', :headers =>true, :encoding => 'Windows-1252') do |row|
			segment_record = Segment.find_or_create_by(:name => row[12])
			company_record = segment_record.companies.find_or_create_by(:name => row[11])
			uf_record = Uf.find_or_create_by(:name => row[1])
			evaluation_record = company_record.evaluations.find_or_create_by(:response_time => row[10], :grade => row [22], 
				:resolved => row[21])

			#evaluation_record.update_attributes(:uf_id => row[1])
		end
		@companies = Company.all
		@companies.each do |company|
			company.update_attributes(:response_time => (company.evaluations.sum(:response_time).to_f)/company.evaluations.size)
			company.update_attributes(:rate => (company.evaluations.sum(:grade).to_f)/company.evaluations.size)
		end
	end
	# def compute_size(evaluations)
	# 	quantity = 0
	# 	evaluations.each do |evaluation|
	# 		if evaluation.response_time != nil
	# 			quantity = quantity + 1
	# 		end
	# 	end
	# 	return quantity
	# end
end
