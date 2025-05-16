# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

using Clang.Generators
using SCIP_jll

const HEADER_BASE = joinpath(SCIP_jll.artifact_dir, "include")

headers = vcat(
    filter(readdir(joinpath(HEADER_BASE, "scip"); join=true)) do f
        return occursin("type", f) || occursin("pub", f)
    end,
    joinpath(HEADER_BASE, "scip/def.h"),
    joinpath(HEADER_BASE, "scip/nlpi.h"),
    joinpath(HEADER_BASE, "scip/scipdefplugins.h"),
    joinpath(HEADER_BASE, "scip/config.h"),
    readdir(joinpath(HEADER_BASE, "blockmemshell"); join=true),
    readdir(joinpath(HEADER_BASE, "lpi"); join=true),
)

build!(
    create_context(
        filter!(f -> endswith(f, ".h"), headers),
        vcat(get_default_args(), "-I$HEADER_BASE"),
        load_options(joinpath(@__DIR__, "generator.toml")),
    ),
)
