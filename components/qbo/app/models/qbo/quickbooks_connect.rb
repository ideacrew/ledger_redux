module Qbo
    class QuickbooksConnect
        def self.call
            credential = Qbo::QuickbooksCredential.first
            credential.api
        end
    end
end