# SCIP.jl

Julia interface to the [SCIP](http://scipopt.org) solver.

[![Build Status](https://github.com/scipopt/SCIP.jl/workflows/CI/badge.svg?branch=master)](https://github.com/scipopt/SCIP.jl/actions?query=workflow%3ACI)
[![codecov](https://codecov.io/gh/scipopt/SCIP.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/scipopt/SCIP.jl)
[![Genie Downloads](https://shields.io/endpoint?url=https://pkgs.genieframework.com/api/v1/badge/SCIP)](https://pkgs.genieframework.com?packages=SCIP)

See [NEWS.md](https://github.com/SCIP-Interfaces/SCIP.jl/blob/master/NEWS.md) for changes in each (recent) release.

## Update (April 2022)

Due to breaking changes, only SCIP 8 is supported by the wrapper on version 0.11 onwards.

## Update (August 2020)

On MacOS and Linux, it is no longer required to install the [SCIP](https://scipopt.org/) binaries using this package. There now exists a
[BinaryBuilder.jl](https://github.com/JuliaPackaging/BinaryBuilder.jl) generated
package [SCIP_jll.jl](https://github.com/JuliaBinaryWrappers/SCIP_jll.jl) and
[SCIP_PaPILO_jll.jl](https://github.com/JuliaBinaryWrappers/SCIP_PaPILO_jll.jl) which
is installed automatically as a dependency.

On Windows, the separate installation of SCIP is still mandatory, otherwise,
you can use this default installation:

```julia
pkg> add SCIP
```

If you use an older Julia version, Windows or want a custom SCIP installation, see below for the build steps.

## Custom SCIP installations.

If you prefer to link to your own installation of SCIP, please set the
environment variable `SCIPOPTDIR` to point to the **installation path**. That
is, either `$SCIPOPTDIR/lib/libscip.so`, `$SCIPOPTDIR/lib/libscip.dylib` or
`$SCIPOPTDIR/bin/scip.dll` should exist, depending on your operating system.

When this is set before you install this package, it should be recognized
automatically. Afterwards, you can trigger the build with

```julia
pkg> build SCIP
```

## Setting Parameters

There are two ways of setting the parameters
([all](https://scip.zib.de/doc-8.0.0/html/PARAMETERS.php) are supported). First,
using `MOI.set`:

```julia
using MOI
using SCIP

optimizer = SCIP.Optimizer()
MOI.set(optimizer, MOI.RawOptimizerAttribute("display/verblevel"), 0)
MOI.set(optimizer, MOI.RawOptimizerAttribute("limits/gap"), 0.05)
```

Second, as keyword arguments to the constructor. But here, the slashes (`/`)
need to be replaced by underscores (`_`) in order to end up with a valid Julia
identifier. This should not lead to ambiguities as none of the official SCIP
parameters contain any underscores (yet).

```julia
using MOI
using SCIP

optimizer = SCIP.Optimizer(display_verblevel=0, limits_gap=0.05)
```

Note that in both cases, the correct value type must be used
(here, `Int64` and `Float64`).

## Design Considerations

**Wrapper of Public API**: All of SCIP's public API methods are wrapped and
available within the `SCIP` package. This includes the `scip_*.h` and `pub_*.h`
headers that are collected in `scip.h`, as well as all default constraint
handlers (`cons_*.h`.) But the wrapped functions do not transform any data
structures and work on the *raw* pointers (e.g. `SCIP*` in C, `Ptr{SCIP_}` in
Julia). Convenience wrapper functions based on Julia types are added as needed.

**Memory Management**: Programming with SCIP requires dealing with variable and
constraints objects that use [reference
counting](https://scip.zib.de/doc-8.0.0/html/OBJ.php) for memory management.
The `SCIP.Optimizer` wrapper type collects lists of `SCIP_VAR*`
and `SCIP_CONS*` under the hood, and releases all reference when it is garbage
collected itself (via `finalize`).
When adding a variable (`add_variable`) or a constraint (`add_linear_constraint`),
an integer index is returned.
This index can be used to retrieve the `SCIP_VAR*` or `SCIP_CONS*`
pointer via `get_var` and `get_cons` respectively.

**Supported Features for MathOptInterface**: We aim at exposing many of SCIP's
features through MathOptInterface. However, the focus is on keeping the wrapper
simple and avoiding duplicate storage of model data.

As a consequence, we do not currently support some features such as retrieving
constraints by name (`VariableIndex`-set constraints are not stored as SCIP
constraints explicitly).

Support for more constraint types (quadratic, SOS1/2, nonlinear expression)
is implemented, but SCIP itself only supports affine objective functions, so we
will stick with that. More general objective functions could be implented via a
[bridge](https://github.com/JuliaOpt/MathOptInterface.jl/issues/529).

Supported operators in nonlinear expressions are as follows:

- unary: `-`, `sqrt`, `exp`, `log`, `abs`, `cos`, `sin`
- binary: `-`, `/`, `^`
- n-ary: `+`, `*`
