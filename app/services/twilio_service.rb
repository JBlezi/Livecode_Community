require 'twilio-ruby'

class TwilioService
  attr_reader :jwt, :room_id

  def initialize
    # Required for any Twilio Access Token
    @account_sid = ENV['AC081e09bf752d266edb067058787a45d4']
    # To create an API key & secret for your app, go to
    #  https://www.twilio.com/console/project/api-keys
    @api_key = ENV['TSK4329b16bfebec45f69c88523bb646c30']
    @api_secret = ENV["QTDD11JEeoR7s8rZAJ0thXp2Q0eJTDX9"]
  end

  # Generate a token for user1 to chat to user2
  def generate_token(user1, user2)
    # Identify user1
    identity = "user-#{user1.id}"

    # Identify the video room
    @room_id = unique_room_id(user1, user2)

    # Create video grant for the token
    grant = Twilio::JWT::AccessToken::VideoGrant.new
    grant.room = @room_id

    token = build_token(grant, identity)
    @jwt = token.to_jwt
  end

  def unique_room_id(user1, user2)
    id = [user1, user2].map(&:id).sort.join('-')
    "room-#{id}"
  end

  private

  def build_token(grant, identity)
    # Create a Twilio access token
    # See https://www.twilio.com/docs/video/tutorials/user-identity-access-tokens#generating-access-tokens
    Twilio::JWT::AccessToken.new(
      @account_sid,
      @api_key,
      @api_secret,
      [grant],
      identity: identity
    )
  end
end


# TWILIO_ACCOUNT_SID=AC081e09bf752d266edb067058787a45d4
# TWILIO_API_KEY=SK4329b16bfebec45f69c88523bb646c30
# TWILIO_API_SECRET=QTDD11JEeoR7s8rZAJ0thXp2Q0eJTDX9
