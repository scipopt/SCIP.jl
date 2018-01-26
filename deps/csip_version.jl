# required version and utilities in a single location
CSIP_VERSION = "0.5.0"

function vn2int(vn::VersionNumber)
    100*vn.major + 10*vn.minor + vn.patch
end

csip_required = VersionNumber(CSIP_VERSION)
csip_required_int = vn2int(csip_required)
