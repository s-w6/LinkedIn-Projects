# Constraints:
#1. CLOSED: W 121 ST between Broadway and Amsterdam AVE due to emergency gas line repairs.
#2. CONSTRUCTION: W 123 ST between Riverside DR and Broadway increases travel cost by 50% (1.5x).
#3. EVENT: A community street fair on W 124 ST between Lenox AVE and 5 AVE increases travel cost by 100% (2.0x).
#4. WEATHER: Localized heavy rain and pooling on the incline of W 119 ST between Riverside DR and Broadway increases travel cost by 30% (1.3x).

closed_edges = [
    ("W  121 ST & BROADWAY", "W  121 ST & AMSTERDAM AVE"),
    ("W  121 ST & AMSTERDAM AVE", "W  121 ST & BROADWAY")
]

cost_multiplier = {
    ("W  123 ST & RIVERSIDE DR", "W  123 ST & BROADWAY"): 1.5,
    ("W  123 ST & BROADWAY", "W  123 ST & RIVERSIDE DR"): 1.5,
    ("W  124 ST & LENOX AVE", "W  124 ST & 5 AVE"): 2.0,
    ("W  124 ST & 5 AVE", "W  124 ST & LENOX AVE"): 2.0,
    ("W  119 ST & RIVERSIDE DR", "W  119 ST & BROADWAY"): 1.3,
    ("W  119 ST & BROADWAY", "W  119 ST & RIVERSIDE DR"): 1.3
}
