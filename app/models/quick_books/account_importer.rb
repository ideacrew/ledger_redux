class QuickBooks::AccountImporter
    def initialize(credentials: nil, accounts: [])
        @credentials = credentials
        @accounts = accounts
        @api = QboApi.new(access_token: credentials.access_token, realm_id: credentials.realm)
    end

    def build_payload(account)
        {
            "AcctNum": account["account_number"],
            "Name": account["account_name"],
            "AccountType": account["account_type"],
            "AccountSubType": account["account_subtype"]
        }
    end

    # Validate each account
    def validate
        # TODO
    end

    def api
        @api
    end

    def create!
        @accounts.each do |account|
           @api.create(:account, payload(account))
        end
    end
end
