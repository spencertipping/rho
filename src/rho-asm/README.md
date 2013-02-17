# Rho-assembly source

Rho-assembly is a subset of Rho that is very easy to parse and execute. This is
the second layer in the three-layer bootstrapping process.

## Supported constructs

The only construct supported in Rho-assembly is message-send-bind. This takes
the form `var = object.method arg`, where `arg` is an optional variable or
numeric constant. Beyond this, Rho-assembly supports line comments beginning
with `#`, but no uppercase-letter implied comments.
