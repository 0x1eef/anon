## About

anon is a FreeBSD utility that can build, and spawn a
minimal FreeBSD jail that can run a single program via
an sshd instance that is accessible to the general public.

## What does the name mean?

The name is inspired by the OpenBSD project, and it stands
for "anonymous".

The OpenBSD project provides the general public with read-only
access to their source code via a CVS account known as `anoncvs`,
and it is open to the general public, hence the name `anon`.

## Why would I want to use this?

The anon project is intended to replace a shell with a custom
program (for example, a TUI application) that is launched in place
of the shell on login, and it runs in a restricted environment that
includes only what's required to run the program.

## License

0BSD.
