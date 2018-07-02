class Account < ApplicationRecord
  require 'csv'

 def self.import(file)
   i = 0
   CSV.foreach(file.path, headers: false, header_converters: lambda { |name| convert[name] }) do |row|
     i += 1
       if i > 1
         bach_no = rand(111...999)
         Account.create!(dep_acc: row[0], amount: row[1], phone: row[2], email: row[3], bach_no: bach_no, Date: Date.today)
       end
     end
 end

 def self.to_csv
    attributes = %w{dep_acc amount phone email}

    CSV.generate(headers: true) do |csv|
          csv << attributes
          all.each do |cbs_mobile|
            csv << attributes.map{ |attr| cbs_mobile.send(attr) }
          end
        end
end

end
