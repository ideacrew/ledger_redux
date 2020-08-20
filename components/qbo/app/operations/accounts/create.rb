module Accounts
  class Create 
    send(:include, Dry::Monads[:result, :do])
    send(:include, Dry::Monads[:try])

    def call(params)
      values  = yield validate(params)
      account = yield create(values)

      Success(account)
    end

    private

    def validate(params)
      Try { Accounts::AccountContract.new.call(params) }
    end

    def create(values)
      api = ::QboApi.new(access_token: "eyJlbmMiOiJBMTI4Q0JDLUhTMjU2IiwiYWxnIjoiZGlyIn0..DWsMe5Rv8qJijtJ1b85tkg.2vR9OKybuhZqzwp97XcLjg5zwdHCP02b3R4wMsd-EnwRMI7J9RVIqi2eiXFn-gPJ2lQh1lQ13HmVOtdqM5shXCycO2FirtO7QZR1zn1_IQBNUx_l1WgqXKdhJwJd9LVNXaw8k4aci83sw4NIPvASllWmhnTNXAIWlWh3TD1bY2OGdaZWKJBKQHM26P-8uTc7R4imv40NUe7Y0iPL6Qjtl4UbB62zPIeUWBdEkDaknmWORfcJrLYTNnztUG2A8cyZlDgTZmV5OPHpSEmDmdLxq0e7al3RAlDIuVb-jy2zMk3O5TzYQKq5aN_uP9cv9E3xNMfTWLF5GhzgFCG8ow_-fu7t9Et4t1j68zUxAuLfY11NPF-XkDp-UXI7wZUsaCR7TBfi2IzsTeUntwiHDNH0rZdJs3GtgB2AnFDbVnOCdOkmoBkIHSBb_apf4NTjeVgc4HfZLe-rzmYa1tFqPB7MVPQ4Mb7KifflaLcYZ1c3IZXgp2x2Rsv_V1ZCsCL8gsvy-0O7FXvkp6bAuwDEgpxa_oLV8VmA9uHMQTv9TPbiWPMpaGOnotn1tTo2hDWTcnIWeF61Gqv7zLVhkUdYVFugWZKRmyXRQGdwd1C9J_vG8Q814leB3NLFQmYqE_j0hYs4S83nLZW0EfLNxBDnKki-qohpURdk4jAPqr5Qtv3Uifs6BpNri0hxH9Jmw8_jA54Zly0TBaGaiGKRhIhIJkQXrNFrxyq3Ko7YlyyiBi01tDkyweswXFvLoBiJ6QPFpffHyoTDbUqn2FJ_zvNBDkCHw3NCh6a3ZiVV9k6N7xmzFUMgBgsTm0fdvJFiMWr9lGRVNYQHXIqJSN5SzqHlrMiOOVxD6wlxgBoRc0WWYY7-DUwo-vI2aJg4yal-dRW0vIip.LKB6pQDT8g4LZGp1hIWs0w", realm_id: "4620816365064531070")
      response = Try { api.create(:account, payload: values.to_h) }
      response.to_result      
    end
  end
end
