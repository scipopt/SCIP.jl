
function include_heuristic(
    o::Optimizer,
    heuristic::HT;
    name="",
    description="",
    dispchar='_',
    priority=10000,
    frequency=1,
    frequency_offset=0,
    maximum_depth=-1,
    timing_mask=SCIP_HEURTIMING_BEFORENODE,
    usessubscip=false,
) where {HT}
    return include_heuristic(
        o.inner.scip[],
        heuristic,
        o.inner.heuristic_storage;
        name=name,
        description=description,
        dispchar=dispchar,
        priority=priority,
        frequency=frequency,
        frequency_offset=frequency_offset,
        maximum_depth=maximum_depth,
        timing_mask=timing_mask,
        usessubscip=usessubscip,
    )
end
