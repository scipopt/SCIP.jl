# Copyright (c) 2018 Felipe Serrano, Miles Lubin, Robert Schwarz, and contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

function camel_case_to_snake_case(x::AbstractString)
    # from https://stackoverflow.com/questions/1175208/elegant-python-function-to-convert-camelcase-to-snake-case
    s1 = replace(x, r"(.)([A-Z][a-z]+)" => s"\1_\2")
    return lowercase(replace(s1, r"([a-z0-9])([A-Z])" => s"\1_\2"))
end

"""
    SCIP_versionnumber() -> VersionNumber

Current version of the SCIP binary
"""
function SCIP_versionnumber()
    major = SCIPmajorVersion()
    minor = SCIPminorVersion()
    patch = SCIPtechVersion()
    return VersionNumber(major, minor, patch)
end
