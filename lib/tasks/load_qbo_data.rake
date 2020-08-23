require 'json'

desc "Loading Qbo data"

namespace :load_qbo_data do
  task :customers => :environment do

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

  task :accounts => :environment do

    accounts_csv = "./db/seed/quickbooks/qbo_accounts.csv"
    account_params = CSV.foreach(accounts_csv, headers: true).collect do |row|
                      row.to_h.symbolize_keys.compact
                     end

    puts "processing #{account_params.count} accounts"
    account_params.each do |params|
      result = Qbo::Accounts::Create.new.call(params)
      
      if result.success?
        puts "created account #{params[:Name]}"
      else
        puts "Failed to create #{params[:Name]} due to #{result.failure.fault[:error_body][0][:error_message]}"
      end
    end
  end

  task :vendors => :environment do

    vendors_csv = "./db/seed/quickbooks/qbo_vendors.csv"
    vendor_params = CSV.foreach(vendors_csv, headers: true).collect do |row|
                      row.to_h.symbolize_keys.compact
                     end
    
    puts "processing #{vendor_params.count} vendors"
    vendor_params.each do |params|
      result = Qbo::Vendors::Create.new.call(params)
      binding.pry
      if result.success?
        puts "created vendor #{params[:DisplayName]}"
      else
        puts "Failed to create #{params[:DisplayName]} due to #{result.failure.fault[:error_body][0][:error_message]}"
      end
    end
  end
end
