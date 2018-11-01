module DigestAuthTimeoutExtension
  refine ActionController::HttpAuthentication::Digest do
    DIGEST_AUTH_TIMEOUT_SEC = 1.day.to_i

    class << ActionController::HttpAuthentication::Digest
      def validate_nonce(secret_key, request, value, seconds_to_timeout = 5 * 60)
        super(secret_key, request, value, DIGEST_AUTH_TIMEOUT_SEC)
      end
    end
  end
end
