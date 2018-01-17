using BinDeps

if VERSION >= v"0.7.0-DEV.3382"
    using Libdl
end

include("csip_version.jl")

CSIP_URL = "https://github.com/SCIP-Interfaces/CSIP/archive/v$(CSIP_VERSION).zip"
CSIP_LIB = "libcsip"
CSIP_UNPACKED = "CSIP-$(CSIP_VERSION)"

@BinDeps.setup

@assert haskey(ENV, "SCIPOPTDIR") "Environment variable `SCIPOPTDIR` not set!"

function validate_csip(name, handle)
    csip_version = ccall(Libdl.dlsym(handle, :CSIPgetVersion), Cint, ())
    csip_version == csip_required_int
end

csipdep = library_dependency(CSIP_LIB, validate=validate_csip)

provides(Sources, Dict(URI(CSIP_URL) => csipdep),
                 unpacked_dir=CSIP_UNPACKED)

src_dir = joinpath(BinDeps.srcdir(csipdep), CSIP_UNPACKED)
scipopt_dir = ENV["SCIPOPTDIR"]

provides(SimpleBuild,
   (@build_steps begin
        GetSources(csipdep)
        @build_steps begin
            ChangeDirectory(joinpath(BinDeps.srcdir(csipdep), CSIP_UNPACKED))
            `make`
            `gcc -std=c99 -Wall -pedantic -I$(src_dir)/lib/include -I$(src_dir)/include -c $(src_dir)/src/csip.c -L$(src_dir)/lib -Wl,-rpath,$(scipopt_dir)/lib/ $(scipopt_dir)/lib/libscipopt.dylib -fPIC -o $(src_dir)/src/csip.o`
            `   gcc -std=c99 -Wall -pedantic $(src_dir)/src/csip.o -L$(src_dir)/lib -Wl,-rpath,$(scipopt_dir)/lib/ $(scipopt_dir)/lib/libscipopt.dylib -fPIC -shared -dynamiclib -o $(src_dir)/lib/libcsip.dylib`
            `mkdir -p $(libdir(csipdep))`
            `install lib/libcsip.dylib $(libdir(csipdep))`
        end
   end), csipdep, os = :Darwin)


provides(SimpleBuild,
    (@build_steps begin
         GetSources(csipdep)
         @build_steps begin
             ChangeDirectory(joinpath(BinDeps.srcdir(csipdep), CSIP_UNPACKED))
             `make`
             `mkdir -p $(libdir(csipdep))`
             `install lib/libcsip.so $(libdir(csipdep))`
         end
    end), csipdep, os = :Unix)


@BinDeps.install Dict(:libcsip => :libcsip)
