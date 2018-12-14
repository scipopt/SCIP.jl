using Clang

header_path = "/usr/include/scip"
all_headers = readdir(header_path)

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
    filter(h -> h != "type_var.h", top_types), # problem: `union SCIP_DomChg`
    filter(h -> startswith(h, "type_") && !in(h, top_types), all_headers),
    filter(h -> startswith(h, "scip_"), all_headers),
)
clang_includes = [
    "/usr/lib/llvm-6.0/lib/clang/6.0.0/include",
]

context = Clang.wrap_c.init(
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

Clang.run(context)
