# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# 3rd-party users, it should be done in your "mix.exs" file.

# You can configure your application as:
#
#     config :test, key: :value
#
# and access this configuration in your application as:
#
#     Application.get_env(:test, :key)
#
# You can also configure a 3rd-party app:
#
#     config :logger, level: :info
#

# Keep the `key` name same as the adapter name
config :gringotts, Gringotts.Gateways.Stripe,
    adapter: Gringotts.Gateways.Stripe,
    api_key: "sk_test_vIX41hayC0BKrPWQerLuOMld",
    default_currency: "USD"

# Keep the `key` name same as the adapter name
config :gringotts, Gringotts.Gateways.Bogus,
    adapter: Gringotts.Gateways.Bogus,
    api_key: "sk_test_mnrVg6z2G0HeDzwy5gxJfmfP",
    default_currency: "USD"

config :kuber_hex, Kuber.Hex.Gateways.Paymill,
    adapter: Kuber.Hex.Gateways.Paymill,
    private_key: "8f16b021d4fb1f8d9263cbe346f32688",
    public_key: "72294854039fcf7fd55eaeeb594577e7"

config :kuber_hex, Kuber.Hex.Gateways.AuthorizeNet,
  adapter: Kuber.Hex.Gateways.AuthorizeNet,
  name: "64jKa6NA",
  transactionKey: "4vmE338dQmAN6m7B",
  default_currency: "USD"

config :gringotts, Gringotts.Gateways.WireCard,
    adapter: Gringotts.Gateways.WireCard,
    login:   "00000031629CA9FA",
    password: "TestXAPTER",
    signature: "00000031629CAFD5"

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#     import_config "#{Mix.env}.exs"
