require 'open-uri'
require 'json'

module Translation
  class << self
    def translate_to_japanese(texts)
      api_url = "https://translation.googleapis.com/language/translate/v2?key=#{ENV['GOOGLE_API_KEY']}"
      params = {
        q: texts,
        target: 'ja'
      }.to_json

      uri = URI.parse(api_url)
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      request = Net::HTTP::Post.new(uri.request_uri)
      request['Content-Type'] = 'application/json'
      response = https.request(request, params)
      response_body = JSON.parse(response.body)

      if response_body['data']['translations']
        response_body['data']['translations'].map { |t| t['translatedText'] }
      else
        raise "Translation failed"
      end
    end
  end
end
