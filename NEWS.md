# News

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
