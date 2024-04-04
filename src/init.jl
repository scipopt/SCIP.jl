# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

import Libdl

const depsjl_path = joinpath(@__DIR__, "..", "deps", "deps.jl")
if isfile(depsjl_path)
    # User-provided SCIP library
    include(depsjl_path)
else
    # Artifact from BinaryBuilder package
    if Sys.iswindows()
        @eval using Artifacts
        @eval const libscip = joinpath(
            artifact"libscip-windows.zip",
            "scip_install/bin/libscip.dll",
        )
    else
        import SCIP_PaPILO_jll
        if SCIP_PaPILO_jll.is_available() && !Sys.iswindows()
            using SCIP_PaPILO_jll: libscip
        else
            using SCIP_jll: libscip
        end
    end
end

function __init__()
    if VERSION >= v"1.9"
        config = LinearAlgebra.BLAS.lbt_get_config()
        if !any(lib -> lib.interface == :lp64, config.loaded_libs)
            LinearAlgebra.BLAS.lbt_forward(OpenBLAS32_jll.libopenblas_path)
        end
    end
    major = SCIPmajorVersion()
    minor = SCIPminorVersion()
    patch = SCIPtechVersion()
    current = VersionNumber("$major.$minor.$patch")
    required = VersionNumber("8")
    upperbound = VersionNumber("10")
    if current < required || current >= upperbound
        @error(
            "SCIP is installed at version $current, " *
            "supported are $required up to (excluding) $upperbound."
        )
    end
end
