<p align="center">
  <img width=150 height=150 src="anon.png">
</p>

Anon gives you a single `ssh` command that drops users straight into a
terminal application — no signup, no account required, publicly
accessible via SSH.

It builds a locked-down FreeBSD jail from source, populates it with only
what's needed to run your program behind sshd, and handles the SSH
configuration so the user's session is forced directly into your app via
`ForceCommand`. No shell access, no escape, minimal attack surface.

## Scenarios

| What it looks like | Example |
|---|---|
| `ssh robert@4.4bsd.dev` | An AI that teaches you FreeBSD |
| `ssh mud@example.com` | A multiplayer roguelike or MUD |
| `ssh paste@example.com` | A terminal-based paste service |
| `ssh status@example.com` | Live dashboards, weather, train times |
| `ssh play@example.com` | Games, puzzles, interactive fiction |

No signup. No account. Just SSH.

## Commands

#### Bootstrap

Bootstraps a new jail.

Options:

| Option | Description |
|---|---|
| `-p PATH` | The jail location |
| `-b BINARY` | The program to serve over sshd |
| `-u USER` | The username that logs into ssh |

#### Serve

Serves a new jail running sshd.

Options:

| Option | Description |
|---|---|
| `-n NAME` | The jail name |
| `-p PATH` | The jail location |

## How it works

#### bin/anon

The anon executable acts as dispatch for subcommands like `bootstrap`
and `serve` subcommands.

#### libexec/anon/bootstrap

`anon bootstrap` creates the jail directory tree, resolves shared libraries
for the target binary and sshd, generates config files from templates,
creates users account, and generates SSH host keys.

#### libexec/anon/serve

`anon serve` mounts devfs, boots a new jail, attaches the current
process to the jail, and starts sshd. The jail contains `/bin/sh`
but virtually no programs — just sshd and your program. Probably 1%
of a normal FreeBSD install is included.

## Network

For simplicity, the jail shares the host network and inherits its IPv4
address. The jail's sshd binds to port 22 for standard SSH access. The
host should run its own sshd on a different port (like 2222) so it
doesn't conflict.

## Quick start

```sh
git clone https://git.home.network/0x1eef/anon.git
cd anon
make
./bin/anon bootstrap -p /usr/local/jails/myapp -b /path/to/program -u appuser
./bin/anon serve -n myapp -p /usr/local/jails/myapp
```

Then `ssh appuser@host` lands in your app.

## Configuration

Config files live in `share/anon/etc/` and use `.tt` templates for
values like the username and binary path. They're copied into the jail
as-is after template substitution. Modify `rc.conf` or add your own
files there before building.



## License

0BSD.
