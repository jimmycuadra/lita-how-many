module Lita
  module Handlers
    class HowMany < Handler
      config :lower_bound, type: Integer, required: true, default: 0
      config :upper_bound, required: true, default: 10

      route /^how\s+many\s.+\?*$/i, :how_many, command: true

      def how_many(response)
        if config.upper_bound <= config.lower_bound
          log.error(t("bound_error", upper: config.upper_bound, lower: config.lower_bound))
        else
          response.reply(rand(config.lower_bound...config.upper_bound).to_s)
        end
      end
    end

    Lita.register_handler(HowMany)
  end
end
