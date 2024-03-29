# News

## v0.10.0

SCIP.jl was upgraded to MathOptInterface `v0.10`.
Removed `ManagedSCIP` as a logic layer. Memory management is now done at the `SCIP.Optimizer` layer.

## v0.9.8

Support for SCIP 7.0.2.
Automatic SCIP binary installation through [SCIP_jll](https://github.com/JuliaBinaryWrappers/SCIP_jll.jl)
built by BinaryBuilder [#177](https://github.com/scipopt/SCIP.jl/pull/177).

## v0.9.7

- support MOI user cut callbacks [#179](https://github.com/SCIP-Interfaces/SCIP.jl/pull/179)

## v0.9.6

- add local CEnum submodule to avoid version conflicts [#175](https://github.com/SCIP-Interfaces/SCIP.jl/pull/175)
- support SCIP 7.0.1 [#173](https://github.com/SCIP-Interfaces/SCIP.jl/pull/173)
- fix SCIP status bug when adding nonlinear constraints after solving [#171](https://github.com/SCIP-Interfaces/SCIP.jl/pull/171)

## v0.9.5

- implement MOI.DualStatus [#158](https://github.com/SCIP-Interfaces/SCIP.jl/pull/158)

## v0.9.4

- support SCIP 7.0.0 [#149](https://github.com/SCIP-Interfaces/SCIP.jl/pull/149)

## v0.9.3

- add support for VariablePrimalStart [#138](https://github.com/SCIP-Interfaces/SCIP.jl/pull/138)
- fix indicator constraints [#137](https://github.com/SCIP-Interfaces/SCIP.jl/pull/137)

## v0.9.2

- support (and require) MOI v0.9.5 [#134](https://github.com/SCIP-Interfaces/SCIP.jl/pull/134)
- implement more MOI methods to better support JuMP with `direct_model` [#133](https://github.com/SCIP-Interfaces/SCIP.jl/pull/133)

## v0.9.1

- Add a Julia wrapper for constraint handlers. [#109](https://github.com/SCIP-Interfaces/SCIP.jl/pull/109)

## v0.9.0

- support MOI v0.9 [#126](https://github.com/SCIP-Interfaces/SCIP.jl/pull/126)
- SCIP-specific MOI indicator constraint replaced by the new MOI definition [#121](https://github.com/SCIP-Interfaces/SCIP.jl/pull/121)

## v0.8.0

- support Windows [#122](https://github.com/SCIP-Interfaces/SCIP.jl/pull/122)
- switch from REQUIRE to Project.toml [#119](https://github.com/SCIP-Interfaces/SCIP.jl/pull/119)

## v0.7.4

- support indicator constraints: [#113](https://github.com/SCIP-Interfaces/SCIP.jl/pull/113)
- fix segfaults when accessing solution before solving: [#115](https://github.com/SCIP-Interfaces/SCIP.jl/pull/115)

## v0.7.3

- Support OS X: [#110](https://github.com/SCIP-Interfaces/SCIP.jl/issues/110).

## v0.7.2

- Fix handling of value types when setting parameters:
  [#15](https://github.com/SCIP-Interfaces/SCIP.jl/issues/15).

## v0.7.1

- Fix translation of coefficients in quadratic constraints:
  [#106](https://github.com/SCIP-Interfaces/SCIP.jl/issues/106).

## v0.7.0

- Major rewrite with Clang.jl generated wrapper of SCIP headers:
  [#76](https://github.com/SCIP-Interfaces/SCIP.jl/pull/76).
- Add support for MathOptInterface (and JuMP v0.19).
- Drop support for MathProgBase.
- Drop intermediate layer CSIP between SCIP.jl and SCIP.

## v0.6.1

- Last version to support MathProgBase and JuMP v0.18
