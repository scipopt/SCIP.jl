# SCIP.jl

[![Build Status](https://github.com/scipopt/SCIP.jl/workflows/CI/badge.svg?branch=master)](https://github.com/scipopt/SCIP.jl/actions?query=workflow%3ACI)
[![codecov](https://codecov.io/gh/scipopt/SCIP.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/scipopt/SCIP.jl)
[![Genie Downloads](https://shields.io/endpoint?url=https://pkgs.genieframework.com/api/v1/badge/SCIP)](https://pkgs.genieframework.com?packages=SCIP)

[SCIP.jl](https://github.com/scipopt/SCIP.jl) is a Julia interface to the [SCIP](https://scipopt.org) solver.

## Affiliation

This wrapper is maintained by the [SCIP project](https://www.scipopt.org/) with
the help of the JuMP community.

## License

`SCIP.jl` is licensed under the [MIT License](https://github.com/scipopt/SCIP.jl/blob/master/LICENSE).

The underlying solver, [scipopt/scip](https://github.com/scipopt/scip), is
licensed under the [Apache 2.0 license](https://github.com/scipopt/scip/blob/master/LICENSE).

## Installation

Install SCIP.jl using `Pkg.add`:
```julia
import Pkg
Pkg.add("SCIP")
```

On MacOS and Linux, installing the SCIP Julia package will work out of the box
and install the [`SCIP_jll.jl`](https://github.com/JuliaBinaryWrappers/SCIP_jll.jl) and
[`SCIP_PaPILO_jll.jl`](https://github.com/JuliaBinaryWrappers/SCIP_PaPILO_jll.jl)
dependencies.

On Windows, a separate installation of SCIP is still mandatory, as detailed in
the "Custom installation" section below.

## Custom installations

If you use an older Julia version, Windows, or you want a custom SCIP
installation, you must manually install the SCIP binaries.

Once installed, set the `SCIPOPTDIR` environment variable to point to the
installation path, that is, depending on your operating system,
`$SCIPOPTDIR/lib/libscip.so`, `$SCIPOPTDIR/lib/libscip.dylib`, or
`$SCIPOPTDIR/bin/scip.dll` must exist.

Then, install `SCIP.jl` using `Pkg.add` and `Pkg.build`:
```julia
ENV["SCIPOPTDIR"] = "/Users/Oscar/code/SCIP"
import Pkg
Pkg.add("SCIP")
Pkg.build("SCIP")
```

## Use with JuMP

Use SCIP with JuMP as follows:

```julia
using JuMP, SCIP
model = Model(SCIP.Optimizer)
set_attribute(model, "display/verblevel", 0)
set_attribute(model, "limits/gap", 0.05)
```

## Options

See the [SCIP documentation](https://scip.zib.de/doc-8.0.0/html/PARAMETERS.php)
for a list of supported options.

## MathOptInterface API

The SCIP optimizer supports the following constraints and attributes.

List of supported objective functions:

 * [`MOI.ObjectiveFunction{MOI.ScalarAffineFunction{Float64}}`](@ref)

List of supported variable types:

 * [`MOI.Reals`](@ref)

List of supported constraint types:

 * [`MOI.ScalarAffineFunction{Float64}`](@ref) in [`MOI.EqualTo{Float64}`](@ref)
 * [`MOI.ScalarAffineFunction{Float64}`](@ref) in [`MOI.GreaterThan{Float64}`](@ref)
 * [`MOI.ScalarAffineFunction{Float64}`](@ref) in [`MOI.Interval{Float64}`](@ref)
 * [`MOI.ScalarAffineFunction{Float64}`](@ref) in [`MOI.LessThan{Float64}`](@ref)
 * [`MOI.ScalarQuadraticFunction{Float64}`](@ref) in [`MOI.EqualTo{Float64}`](@ref)
 * [`MOI.ScalarQuadraticFunction{Float64}`](@ref) in [`MOI.GreaterThan{Float64}`](@ref)
 * [`MOI.ScalarQuadraticFunction{Float64}`](@ref) in [`MOI.Interval{Float64}`](@ref)
 * [`MOI.ScalarQuadraticFunction{Float64}`](@ref) in [`MOI.LessThan{Float64}`](@ref)
 * [`MOI.VariableIndex`](@ref) in [`MOI.EqualTo{Float64}`](@ref)
 * [`MOI.VariableIndex`](@ref) in [`MOI.GreaterThan{Float64}`](@ref)
 * [`MOI.VariableIndex`](@ref) in [`MOI.Integer`](@ref)
 * [`MOI.VariableIndex`](@ref) in [`MOI.Interval{Float64}`](@ref)
 * [`MOI.VariableIndex`](@ref) in [`MOI.LessThan{Float64}`](@ref)
 * [`MOI.VariableIndex`](@ref) in [`MOI.ZeroOne`](@ref)
 * [`MOI.VectorOfVariables`](@ref) in [`MOI.SOS1{Float64}`](@ref)
 * [`MOI.VectorOfVariables`](@ref) in [`MOI.SOS2{Float64}`](@ref)

List of supported model attributes:

 * [`MOI.NLPBlock()`](@ref)
 * [`MOI.ObjectiveSense()`](@ref)
 * [`MOI.UserCutCallback()`](@ref)

## Design considerations

### Wrapping the public API

All of the public API methods are wrapped and available within the `SCIP`
package. This includes the `scip_*.h` and `pub_*.h` headers that are collected
in `scip.h`, as well as all default constraint handlers (`cons_*.h`.) 

The wrapped functions do not transform any data structures and work on the *raw*
pointers (for example, `SCIP*` in C, `Ptr{SCIP_}` in Julia). Convenience wrapper
functions based on Julia types are added as needed.

### Memory management

Programming with SCIP requires dealing with variable and constraint objects that
use [reference counting](https://scip.zib.de/doc-8.0.0/html/OBJ.php) for memory
management.

The `SCIP.Optimizer` wrapper type collects lists of `SCIP_VAR*` and `SCIP_CONS*`
under the hood, and it releases all references when it is garbage collected
itself (via `finalize`).

When adding a variable (`add_variable`) or a constraint (`add_linear_constraint`),
an integer index is returned. This index can be used to retrieve the `SCIP_VAR*`
or `SCIP_CONS*` pointer via `get_var` and `get_cons` respectively.

### Supported nonlinear operators

Supported operators in nonlinear expressions are as follows:

 * `+`
 * `-`
 * `*`
 * `/`
 * `^`
 * `sqrt`
 * `exp`
 * `log`
 * `abs`
 * `cos`
 * `sin`
