# News

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
