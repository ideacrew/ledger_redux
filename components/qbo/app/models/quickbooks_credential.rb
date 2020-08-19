module Qbo
    class QuickbooksCredential < ApplicationRecord

        def connect
            @handler ||= QboApi.new(access_token: self.access_token, realm_id: self.realm_id)
        end

        def api
            connect
        end

        def build_connection(url, headers: nil)
            Faraday.new(url: url) { |conn|
            conn.headers.update(headers) if headers
            yield conn if block_given?
            }
        end

        def refresh_token!
            connection = build_connection('https://oauth.platform.intuit.com', headers: { 'Accept' => 'application/json' }) do |conn|
                conn.basic_auth(self.client_id, self.client_secret)
                conn.request :url_encoded
                conn.use FaradayMiddleware::ParseJson, parser_options: { symbolize_names: true }
                conn.use Faraday::Response::RaiseError
            end
            raw_response = connection.post {|req|
                req.body = { grant_type: :refresh_token, refresh_token: "" }
                req.url '/oauth2/v1/tokens/bearer'
            }

            puts "New Token:"
            puts raw_response.body[:access_token]
        end
    end
end