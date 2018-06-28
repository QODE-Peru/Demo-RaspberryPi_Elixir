# Fw

**TODO: Add description**

## Targets

Nerves applications produce images for hardware targets based on the
`MIX_TARGET` environment variable. If `MIX_TARGET` is unset, `mix` builds an
image that runs on the host (e.g., your laptop). This is useful for executing
logic tests, running utilities, and debugging. Other targets are represented by
a short name like `rpi3` that maps to a Nerves system image for that platform.
All of this logic is in the generated `mix.exs` and may be customized. For more
information about targets see:

https://hexdocs.pm/nerves/targets.html#content

## Getting Started

To start your Nerves app:
  * `export MIX_TARGET=my_target` or prefix every command with
    `MIX_TARGET=my_target`. For example, `MIX_TARGET=rpi3`
  * Install dependencies with `mix deps.get`
  * Create firmware with `mix firmware`
  * Burn to an SD card with `mix firmware.burn`

  iex --name me@0.0.0.0 --cookie ay6BjDnhU2gb0xPMTvF0AUizNkDzUn6PN3UDRU4e2dl5EXwXyOY1pxN0cGditTfT --remsh rpi@192.168.0.5
  mix firmware.push 192.168.0.5
  exit ssh  type   ~(ALt Gr +).

  ssh 192.168.0.5

  Host 192.168.0.5
      HostName 192.168.0.5
      User rpi
      IdentityFile ~/.ssh/id_rsa.pub

  RingLogger.tail

## Learn more

  * Official docs: https://hexdocs.pm/nerves/getting-started.html
  * Official website: http://www.nerves-project.org/
  * Discussion Slack elixir-lang #nerves ([Invite](https://elixir-slackin.herokuapp.com/))
  * Source: https://github.com/nerves-project/nerves
