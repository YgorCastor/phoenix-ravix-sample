# PhoenixRavixExample

A simple example of Ravix using Phoenix

# Caveats

## Don't add the Ravix Ecto to the Phoenix Database Manager

```elixir
config :phoenix_ravix_example,
  ecto_repos: [PhoenixRavixExample.Repo, PhoenixRavixExample.RavenRepo ## DON'T]
```

If you do that, the `plug Phoenix.Ecto.CheckRepoStatus, otp_app: :phoenix_ravix_example` will try to validate migrations, leading to the error: 

```
** (Mix) Could not find migrations directory "priv/raven_repo/migrations"
for repo PhoenixRavixExample.RavenRepo.

This may be because you are in a new project and the
migration directory has not been created yet. Creating an
empty directory at the path above will fix this error.

If you expected existing migrations to be found, please
make sure your repository has been properly configured
and the configured path exists.
```

If you want to use RavenRepo as your main repo, just remove the plug and the `"ecto.migrate --quiet"` part from your mix file