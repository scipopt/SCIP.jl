# SCIP.jl
Julia interface to [SCIP](http://scip.zib.de) solver.

[![Build Status](https://travis-ci.org/SCIP-Interfaces/SCIP.jl.svg?branch=master)](https://travis-ci.org/SCIP-Interfaces/SCIP.jl)
[![Coverage Status](https://coveralls.io/repos/github/SCIP-Interfaces/SCIP.jl/badge.svg?branch=master)](https://coveralls.io/github/SCIP-Interfaces/SCIP.jl?branch=master)
[![codecov](https://codecov.io/gh/SCIP-Interfaces/SCIP.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/SCIP-Interfaces/SCIP.jl)

This is a complete rewrite. We use
[Clang.jl](https://github.com/ihnorton/Clang.jl) to generate wrappers based on
the headers of the SCIP library. We aim to support
[JuMP](https://github.com/JuliaOpt/JuMP.jl) through
[MathOptInterface](https://github.com/JuliaOpt/MathOptInterface.jl). In this
first pass, only the
[LinQuadOptInterface](https://github.com/JuliaOpt/LinQuadOptInterface.jl) will
be implemented. This means that we will have a feature loss in the areas of
general nonlinear constraints as well as supported callbacks.
