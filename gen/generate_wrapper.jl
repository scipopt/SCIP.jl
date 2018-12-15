using Clang

HEADER_BASE = "/usr/include" # using system-wide installation of SCIP
HEADER_DIR = "scip"
all_headers = readdir(joinpath(HEADER_BASE, HEADER_DIR))
top_types = [
    "type_retcode.h",
    "type_result.h",
    "type_clock.h",
    "type_misc.h",
    "type_timing.h",
    "type_paramset.h",
    "type_event.h",
    "type_lp.h",
    "type_nlp.h",
    "type_var.h",
    "type_prob.h",
    "type_tree.h",
    "type_scip.h",
]
headers = vcat(
    top_types,
    filter(h -> startswith(h, "type_") && !in(h, top_types), all_headers),
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
