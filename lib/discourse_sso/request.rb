require 'Base64'
require 'rack'

class DiscourseSSO
  class Request
    attr_accessor :user, :sso, :sig

    def initialize(sso:, sig:)
      self.sso = sso
      self.sig = sig
    end

    def callback_url
      raise_error_if_sign_and_payload_diff

      set_up_url
    end

    private

      def set_up_url
        encoded_data = Base64.encode64(options_to_send)

        sig_to_send = encrypt_to_sha_256(encoded_data)

        "#{redirect_url}?#{Rack::Utils.build_query(sso: encoded_data, sig: sig_to_send)}"
      end

      def options_to_send
        Rack::Utils.build_query(user.merge(nonce: parsed_request_params['nonce']))
      end

      def raise_error_if_sign_and_payload_diff
        raise 'Payload and Sign must be uniq' if sign_and_payload_diff?
      end

      def sign_and_payload_diff?
        encrypt_to_sha_256(sso) != sig
      end

      def encrypt_to_sha_256(data)
        OpenSSL::HMAC.hexdigest("sha256", DiscourseSSO::Config.instance.secret, data)
      end

      def parsed_request_params
        @_parsed_request_params ||= Rack::Utils.parse_nested_query(decoded_payload)
      end

      def decoded_payload
        @_decoded_payload ||= URI.decode(Base64.decode64(sso))
      end

      def redirect_url
        @_redirect_url ||= parsed_request_params['return_sso_url']
      end
  end
end
