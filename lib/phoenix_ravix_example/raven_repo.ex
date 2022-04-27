defmodule PhoenixRavixExample.RavenRepo do
  use Ecto.Repo,
    otp_app: :phoenix_ravix_example,
    adapter: Ravix.Ecto.Adapter
end
