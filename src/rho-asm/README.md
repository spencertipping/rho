# Rho-assembly implementation

Rho-assembly is a subset of Rho that is very easy to parse and execute. This is
the second layer in the three-layer bootstrapping process, and it is the
closest source form to represent the underlying bytecode that Rho programs are
compiled into prior to being run.

See `../boot/` for the base bytecode compiler and interpreter.

# Writing Rho assembly

## Supported constructs
The only construct supported in Rho-assembly is message-send-bind. This takes
the form `var = object.method arg`, where `arg` is a variable or numeric
constant. Beyond this, Rho-assembly supports line comments beginning with `#`,
but no uppercase-letter implied comments.

## Compilation process
This four-address code is compiled into a series of 32-byte bytecode messages:

    [var= key] [object key] [method key] [arg]          # [...] = 64 bits

The method is expected to know how to interpret `arg`, which is always an
untyped 64-bit number.
