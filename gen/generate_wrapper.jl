using Clang

HEADER_BASE = "/usr/include" # using system-wide installation of SCIP
all_headers = readdir(joinpath(HEADER_BASE, "scip"))
scip_headers = vcat(
    filter(h -> startswith(h, "type_"), all_headers),
    filter(h -> startswith(h, "pub_"), all_headers),
    filter(h -> startswith(h, "scip_"), all_headers),
    "scipdefplugins.h",
    filter(h -> startswith(h, "cons_"), all_headers),
)
lpi_headers = ["type_lpi.h"]
nlpi_headers = ["type_expr.h", "type_nlpi.h"]

headers = vcat(
    [joinpath(HEADER_BASE, "scip", h) for h in scip_headers],
    [joinpath(HEADER_BASE, "lpi", h) for h in lpi_headers],
    [joinpath(HEADER_BASE, "nlpi", h) for h in nlpi_headers],
)

context = Clang.init(
    headers=headers,
    common_file="commons.jl",
    output_dir="../src/wrapper",
    clang_includes=vcat(HEADER_BASE, LLVM_INCLUDE),
    clang_args = ["-I", HEADER_BASE],
    clang_diagnostics=true,
    header_wrapped=(header, cursorname) -> header == cursorname,
    header_library=header_name -> "libscip"
)
Clang.run(context)
