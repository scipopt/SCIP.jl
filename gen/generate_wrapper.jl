using Clang.Generators
using SCIP_jll

cd(@__DIR__)

const (HEADER_BASE, is_default) = if haskey(ENV, "SCIPDIR")
    (joinpath(ENV["SCIPDIR"], "src"), false)
else
    (joinpath(SCIP_jll.artifact_dir, "include"), true)
end

const SCIP_TYPES_H = filter(readdir(joinpath(HEADER_BASE, "scip"), join=true)) do f
    occursin("type", f) && endswith(f, ".h")
end
push!(SCIP_TYPES_H, joinpath(HEADER_BASE, "scip/def.h"))
push!(SCIP_TYPES_H, joinpath(HEADER_BASE, "scip/nlpi.h"))
push!(SCIP_TYPES_H, joinpath(HEADER_BASE, "scip/scipdefplugins.h"))

# add the generated config.h file, either from JLL or build dir
if is_default
    push!(SCIP_TYPES_H, joinpath(HEADER_BASE, "scip/config.h"))
end

const SCIP_PUB_H = filter(readdir(joinpath(HEADER_BASE, "scip"), join=true)) do f
    occursin("pub", f) && endswith(f, ".h")
end

const SCIP_MEM_H = filter(readdir(joinpath(HEADER_BASE, "blockmemshell"), join=true)) do f
    endswith(f, ".h")
end

const SCIP_LPI_H = filter(readdir(joinpath(HEADER_BASE, "lpi"), join=true)) do f
    endswith(f, ".h")
end

headers = append!(
    SCIP_TYPES_H,
    SCIP_PUB_H,
    SCIP_MEM_H,
    SCIP_LPI_H,
)

options = load_options(joinpath(@__DIR__, "generator.toml"))

args = get_default_args()
push!(args, "-I$HEADER_BASE")
if !is_default
    push!(args, "-I$SCIP_BUILD_DIR/scip")
end

ctx = create_context(headers, args, options)

build!(ctx)
