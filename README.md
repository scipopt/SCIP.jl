# SCIP.jl

Julia interface to [SCIP](http://scip.zib.de) solver.

[![Build Status](https://travis-ci.org/SCIP-Interfaces/SCIP.jl.svg?branch=master)](https://travis-ci.org/SCIP-Interfaces/SCIP.jl)
[![Coverage Status](https://coveralls.io/repos/github/SCIP-Interfaces/SCIP.jl/badge.svg?branch=master)](https://coveralls.io/github/SCIP-Interfaces/SCIP.jl?branch=master)
[![codecov](https://codecov.io/gh/SCIP-Interfaces/SCIP.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/SCIP-Interfaces/SCIP.jl)

## Update (December 2018)

We have completely rewritten the interface from scratch, using
[Clang.jl](https://github.com/ihnorton/Clang.jl) to generate wrappers based on
the headers of the SCIP library.
The goal is to support [JuMP](https://github.com/JuliaOpt/JuMP.jl) (from version
0.19 on) through
[MathOptInterface](https://github.com/JuliaOpt/MathOptInterface.jl).

Currently, we support LP and MIP problems only.
This means we still have a feature loss in the areas as nonlinear constraints as
well as supported callbacks compared to previous versions (see below).

## Getting Started

To use SCIP.jl, you will need [SCIP](http://scip.zib.de) installed on your
system. [SCIP's license](https://scip.zib.de/index.php#license) does not allow
(automatic) redistribution, so please
[download](https://scip.zib.de/index.php#download) and install it yourself.

Only Linux is tested and officially supported. Contributions to supporting other
operating systems are welcome.

We recommend using one of the provided installers, e.g.,
`SCIPOptSuite-6.0.0-Linux.deb` for systems based on Debian. Adding the SCIP.jl
package should then work out of the box:

    pkg> add SCIP

If you [build SCIP from source](https://scip.zib.de/doc-6.0.0/html/CMAKE.php)
you should set the environment variable `SCIPOPTDIR` to point the the
**installation path**. That is, `$SCIPOPTDIR/lib/libscip.so` should exist.

## Design Considerations

**Wrapper of Public API**: All of SCIP's public API methods are wrapped and
available within the `SCIP` package. This includes the `scip_*.h` and `pub_*.h`
headers that are collected in `scip.h`, as well as all default constraint
handlers (`cons_*.h`.) But the wrapped functions do not transform any data
structures and work on the *raw* points (e.g. `SCIP*`). Convenience wrapper
functions based on Julia types are added as needed.

**Memory Management**: Programming with SCIP requires dealing with variable and
constraints objects that use [reference
counting](https://scip.zib.de/doc-6.0.0/html/OBJ.php) for memory management.
SCIP.jl provides a wrapper type `ManagedSCIP` that collects lists of `SCIP_VAR*`
and `SCIP_CONS*` under the hood, and releases all reference when it is garbage
collected itself (via `finalize`). When adding a variable (`add_variable`) or a
constraint (`add_linear_constraint`), an integer index is returned. This index
can be used to retrieve the `SCIP_VAR*` or `SCIP_CONS*` pointer via `get_var`
and `get_cons` respectively.

`ManagedSCIP` does not currently support deletion of variables or constraints.

**Supported Features for MathOptInterface**: We aim at exposing many of SCIP's
features through MathOptInterface. However, the focus is on keeping the wrapper
simple and avoiding duplicate storage of model data.

As a consequence, we do not currently support some features such as retrieving
constraints by name (`SingleVariable`-set constraints are not stored as SCIP
constraints explicitly).

Support for more constraint types (quadratic/SOC, SOS1/2, nonlinear expression)
is planned, but SCIP itself only supports affine objective functions, so we will
stick with that. More general objective functions could be implented via a
[bridge](https://github.com/JuliaOpt/MathOptInterface.jl/issues/529).

## Old Interface Implementation

A previous implementation of SCIP.jl supported
[JuMP](https://github.com/JuliaOpt/JuMP.jl) (up to version 0.18) through
[MathProgBase](https://github.com/JuliaOpt/MathOptInterface.jl). It did not
interface SCIP directly, but went through
[CSIP](https://github.com/SCIP-Interfaces/CSIP), a simplified C wrapper.

Back then, the interface support MINLP problems as well as solver-indepentent
callbacks for lazy constraints and heuristics.

To use that version, you need to pin the version of SCIP.jl to `v0.6.1` (the
last release before the rewrite):

    pkg> add SCIP@v0.6.1
    pkg> pin SCIP
