require 'json'

desc "Loading Qbo customers"

task :load_qbo_customers => :environment do

  customers_csv = "./db/seed/quickbooks/qbo_customers.csv"
  customer_params = CSV.foreach(customers_csv, headers: true).collect do |row|
                    row.to_h.symbolize_keys.compact
                   end
  
  puts "processing #{customer_params.count} customers"
  customer_params.each do |params|
    result = Qbo::Customers::Create.new.call(params)
    
    if result.success?
      puts "created customer #{params[:DisplayName]}"
    else
      puts "Failed to create #{params[:DisplayName]} due to #{result.failure.fault[:error_body][0][:error_message]}"
    end
  end
end
