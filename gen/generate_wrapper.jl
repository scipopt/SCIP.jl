using Clang.Generators
using SCIP_jll

HEADER_BASE = "/usr/include" # using system-wide installation of SCIP
all_headers = readdir(joinpath(HEADER_BASE, "scip"))
scip_headers = vcat(
    filter(h -> startswith(h, "type_"), all_headers),
    filter(h -> startswith(h, "pub_"), all_headers),
    filter(h -> startswith(h, "scip_"), all_headers),
    "scipdefplugins.h",
    filter(h -> startswith(h, "cons_"), all_headers),
    "intervalarith.h",                                 # for nlpi/pub_expr
)
lpi_headers = ["type_lpi.h"]
nlpi_headers = ["type_expr.h", "type_nlpi.h", "type_exprinterpret.h", "pub_expr.h"]

headers = vcat(
    [joinpath(HEADER_BASE, "scip", h) for h in scip_headers],
    [joinpath(HEADER_BASE, "lpi", h) for h in lpi_headers],
    [joinpath(HEADER_BASE, "nlpi", h) for h in nlpi_headers],
)

options = load_options(joinpath(@__DIR__, "generator.toml"))

args = get_default_args()
push!(args, "-I$HEADER_BASE")

ctx = create_context(headers, args, options)

build!(ctx)