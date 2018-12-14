using Clang

header_path = "/usr/include/scip"
all_headers = readdir(header_path)

headers = vcat(
    filter(h -> startswith(h, "scip_"), all_headers),
)
clang_includes = [
    "/usr/lib/llvm-6.0/lib/clang/6.0.0/include",
]

context = wrap_c.init(
    # header files we want wrapped
    headers=[joinpath(header_path, h) for h in headers],
    common_file="commons.jl",
    output_dir="../src/wrapper",
    clang_includes=clang_includes,
    clang_diagnostics=true,
    # do not wrap included headers
    header_wrapped=(header, cursorname) -> header == cursorname,
    header_library=header_name -> "libscip"
)

run(context)
