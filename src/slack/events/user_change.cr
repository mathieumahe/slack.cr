Slack::Event.register(Slack::Event::UserChange, "user_change")

class Slack
  class Event
    # Implments https://api.slack.com/events/user_change
    class UserChange < Slack::Event
      JSON.mapping(
        type: String,
        user: String,
        team_id: String,
        name: String,
        deleted: String,
        real_name: String,
        profile: JSON::Any,
      )

      # property user : String
      # property team_id : String
      # property name : String
      # property deleted : Bool
      # property real_name : String
      # @profile : JSON::Any?

      # def initialize(@raw : JSON::Any)
      #   super
      #   @name = "unknown"
      #   @user = "unknown"
      #   @team_id = "unknown"
      #   @real_name = "unknown"
      #   @deleted = false
      #   # puts "Initting..."
      #   # @profile = Slack::User::Profile.new
      #   # pp @raw["user"]?
      #   if u = @raw["user"]?
      #     # puts "U:"
      #     # pp u
      #     @user = u["id"].as_s
      #     @team_id = u["team_id"].as_s
      #     @real_name = u["real_name"].as_s
      #     @profile = u["profile"].dup
      #     # puts "profile"
      #     # pp @profile
      #     @deleted = u["deleted"].as_bool
      #   end
      # end

      def get_profile
        @profile
      end

      def self.build(raw : JSON::Any) : Slack::Event::UserChange?
      end

      def profile
      end
    end
  end
end
