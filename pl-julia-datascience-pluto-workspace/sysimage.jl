using Pkg
Pkg.activate() # Use a different environment than our one for the class content.

Pkg.add(["PackageCompiler", "Pluto"])
using PackageCompiler

create_sysimage(:Pluto; sysimage_path="/jl_depot/sysimage.so",
    precompile_execution_file="/jl/precompile_exec.jl")