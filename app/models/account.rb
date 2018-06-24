class Account < ApplicationRecord
  require 'csv'

 def self.import(file)
   i = 0
   CSV.foreach(file.path, headers: false, header_converters: lambda { |name| convert[name] }) do |row|
     i += 1
       if i > 1
         Account.create!(dep_acc: row[0], amount: row[1], phone: row[2], email: row[3])
       end
     end
 end

end
