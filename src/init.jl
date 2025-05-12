# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

import Libdl

const depsjl_path = joinpath(@__DIR__, "..", "deps", "deps.jl")
if isfile(depsjl_path)
    # User-provided SCIP library
    include(depsjl_path)
elseif Sys.iswindows()
    using SCIP_jll: libscip
else
    # Artifact from BinaryBuilder package
    # using SCIP_jll: libscip
    # import SCIP_PaPILO_jll
    # if SCIP_PaPILO_jll.is_available()
    using SCIP_PaPILO_jll: libscip
    # else
    # end
end

function __init__()
    config = LinearAlgebra.BLAS.lbt_get_config()
    if !any(lib -> lib.interface == :lp64, config.loaded_libs)
        LinearAlgebra.BLAS.lbt_forward(OpenBLAS32_jll.libopenblas_path)
    end
    major = SCIPmajorVersion()
    minor = SCIPminorVersion()
    patch = SCIPtechVersion()
    current = VersionNumber("$major.$minor.$patch")
    required = VersionNumber("9")
    upperbound = VersionNumber("10")
    if current < required || current >= upperbound
        @error(
            "SCIP is installed at version $current, " *
            "supported are $required up to (excluding) $upperbound."
        )
    end
    return
end
