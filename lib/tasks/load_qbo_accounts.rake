require 'json'

desc "Loading Qbo Accounts"

task :load_qbo_accounts => :environment do

  accounts_csv = "./db/seed/quickbooks/qbo_accounts.csv"
  account_params = CSV.foreach(accounts_csv, headers: true).collect do |row|
                    row.to_h.symbolize_keys.compact
                   end
  
  puts "processing #{account_params.count} accounts"
  account_params.each do |params|
    result = Accounts::Create.new.call(params)
    
    if result.success?
      puts "created account #{params[:Name]}"
    else
      puts "Failed to create #{params[:Name]} due to #{result.failure.fault[:error_body][0][:error_message]}"
    end
  end
end
