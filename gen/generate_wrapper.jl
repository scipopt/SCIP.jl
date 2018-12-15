using Clang

HEADER_BASE = "/usr/include" # using system-wide installation of SCIP
HEADER_DIR = "scip"
all_headers = readdir(joinpath(HEADER_BASE, HEADER_DIR))
headers = vcat(
    filter(h -> startswith(h, "type_"), all_headers),
    # filter(h -> startswith(h, "pub_"), all_headers),
    filter(h -> startswith(h, "scip_"), all_headers),
)

context = Clang.init(
    headers=[joinpath(HEADER_BASE, HEADER_DIR, h) for h in headers],
    common_file="commons.jl",
    output_dir="../src/wrapper",
    clang_includes=vcat(HEADER_BASE, LLVM_INCLUDE),
    clang_args = ["-I", HEADER_BASE],
    clang_diagnostics=true,
    header_wrapped=(header, cursorname) -> header == cursorname,
    header_library=header_name -> "libscip"
)
Clang.run(context)
