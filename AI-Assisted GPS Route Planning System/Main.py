import search_engine
import networkx as nx
import matplotlib.pyplot as plt

#Knowledge Base
battery_capacity = 672
max_payload = 125
energy_per_km = 12.0

nodes = ['W  119 ST & RIVERSIDE DR', 'W  119 ST & BROADWAY',
         'W  119 ST & AMSTERDAM AVE', 'W  119 ST & CONVENT AVE',
         'W  119 ST & ST NICHOLAS AVE', 'W  119 ST & FREDERICK DOUGLASS BLVD',
         'W  119 ST & ADAM CLAYTON POWELL JR BLVD', 'W  119 ST & LENOX AVE',
         'W  119 ST & 5 AVE', 'W  119 ST & MADISON AVE', 'W  120 ST & RIVERSIDE DR',
         'W  120 ST & BROADWAY', 'W  120 ST & AMSTERDAM AVE', 'W  120 ST & CONVENT AVE',
         'W  120 ST & ST NICHOLAS AVE', 'W  120 ST & FREDERICK DOUGLASS BLVD',
         'W  120 ST & ADAM CLAYTON POWELL JR BLVD', 'W  120 ST & LENOX AVE',
         'W  120 ST & 5 AVE', 'W  120 ST & MADISON AVE', 'W  121 ST & RIVERSIDE DR',
         'W  121 ST & BROADWAY', 'W  121 ST & AMSTERDAM AVE', 'W  121 ST & CONVENT AVE',
         'W  121 ST & ST NICHOLAS AVE', 'W  121 ST & FREDERICK DOUGLASS BLVD',
         'W  121 ST & ADAM CLAYTON POWELL JR BLVD', 'W  121 ST & LENOX AVE',
         'W  121 ST & 5 AVE', 'W  121 ST & MADISON AVE',
         'W  123 ST & RIVERSIDE DR', 'W  123 ST & BROADWAY',
         'W  123 ST & AMSTERDAM AVE', 'W  123 ST & CONVENT AVE',
         'W  123 ST & ST NICHOLAS AVE', 'W  123 ST & FREDERICK DOUGLASS BLVD',
         'W  123 ST & ADAM CLAYTON POWELL JR BLVD', 'W  123 ST & LENOX AVE',
         'W  123 ST & 5 AVE', 'W  123 ST & MADISON AVE', 'W  124 ST & RIVERSIDE DR',
         'W  124 ST & BROADWAY', 'W  124 ST & AMSTERDAM AVE',
         'W  124 ST & CONVENT AVE', 'W  124 ST & ST NICHOLAS AVE',
         'W  124 ST & FREDERICK DOUGLASS BLVD', 'W  124 ST & ADAM CLAYTON POWELL JR BLVD',
         'W  124 ST & LENOX AVE', 'W  124 ST & 5 AVE', 'W  124 ST & MADISON AVE']

edges = [('W  119 ST & RIVERSIDE DR', 'W  119 ST & BROADWAY', 0.2),
         ('W  119 ST & BROADWAY', 'W  119 ST & RIVERSIDE DR', 0.2),
         ('W  119 ST & RIVERSIDE DR', 'W  120 ST & RIVERSIDE DR', 0.08),
         ('W  120 ST & RIVERSIDE DR', 'W  119 ST & RIVERSIDE DR', 0.08),
         ('W  119 ST & BROADWAY', 'W  119 ST & AMSTERDAM AVE', 0.2),
         ('W  119 ST & AMSTERDAM AVE', 'W  119 ST & BROADWAY', 0.2),
         ('W  119 ST & BROADWAY', 'W  120 ST & BROADWAY', 0.08),
         ('W  120 ST & BROADWAY', 'W  119 ST & BROADWAY', 0.08),
         ('W  119 ST & AMSTERDAM AVE', 'W  119 ST & CONVENT AVE', 0.2),
         ('W  119 ST & CONVENT AVE', 'W  119 ST & AMSTERDAM AVE', 0.2),
         ('W  119 ST & AMSTERDAM AVE', 'W  120 ST & AMSTERDAM AVE', 0.08),
         ('W  120 ST & AMSTERDAM AVE', 'W  119 ST & AMSTERDAM AVE', 0.08),
         ('W  119 ST & CONVENT AVE', 'W  119 ST & ST NICHOLAS AVE', 0.2),
         ('W  119 ST & ST NICHOLAS AVE', 'W  119 ST & CONVENT AVE', 0.2),
         ('W  119 ST & CONVENT AVE', 'W  120 ST & CONVENT AVE', 0.08),
         ('W  120 ST & CONVENT AVE', 'W  119 ST & CONVENT AVE', 0.08),
         ('W  119 ST & ST NICHOLAS AVE', 'W  119 ST & FREDERICK DOUGLASS BLVD', 0.2),
         ('W  119 ST & FREDERICK DOUGLASS BLVD', 'W  119 ST & ST NICHOLAS AVE', 0.2),
         ('W  119 ST & ST NICHOLAS AVE', 'W  120 ST & ST NICHOLAS AVE', 0.08),
         ('W  120 ST & ST NICHOLAS AVE', 'W  119 ST & ST NICHOLAS AVE', 0.08),
         ('W  119 ST & FREDERICK DOUGLASS BLVD', 'W  119 ST & ADAM CLAYTON POWELL JR BLVD', 0.2),
         ('W  119 ST & ADAM CLAYTON POWELL JR BLVD', 'W  119 ST & FREDERICK DOUGLASS BLVD', 0.2),
         ('W  119 ST & FREDERICK DOUGLASS BLVD', 'W  120 ST & FREDERICK DOUGLASS BLVD', 0.08),
         ('W  120 ST & FREDERICK DOUGLASS BLVD', 'W  119 ST & FREDERICK DOUGLASS BLVD', 0.08),
         ('W  119 ST & ADAM CLAYTON POWELL JR BLVD', 'W  119 ST & LENOX AVE', 0.2),
         ('W  119 ST & LENOX AVE', 'W  119 ST & ADAM CLAYTON POWELL JR BLVD', 0.2),
         ('W  119 ST & ADAM CLAYTON POWELL JR BLVD', 'W  120 ST & ADAM CLAYTON POWELL JR BLVD', 0.08),
         ('W  120 ST & ADAM CLAYTON POWELL JR BLVD', 'W  119 ST & ADAM CLAYTON POWELL JR BLVD', 0.08),
         ('W  119 ST & LENOX AVE', 'W  119 ST & 5 AVE', 0.2),
         ('W  119 ST & 5 AVE', 'W  119 ST & LENOX AVE', 0.2),
         ('W  119 ST & LENOX AVE', 'W  120 ST & LENOX AVE', 0.08),
         ('W  120 ST & LENOX AVE', 'W  119 ST & LENOX AVE', 0.08),
         ('W  119 ST & 5 AVE', 'W  119 ST & MADISON AVE', 0.2),
         ('W  119 ST & MADISON AVE', 'W  119 ST & 5 AVE', 0.2),
         ('W  119 ST & 5 AVE', 'W  120 ST & 5 AVE', 0.08),
         ('W  120 ST & 5 AVE', 'W  119 ST & 5 AVE', 0.08),
         ('W  119 ST & MADISON AVE', 'W  120 ST & MADISON AVE', 0.08),
         ('W  120 ST & MADISON AVE', 'W  119 ST & MADISON AVE', 0.08),
         ('W  120 ST & RIVERSIDE DR', 'W  120 ST & BROADWAY', 0.2),
         ('W  120 ST & BROADWAY', 'W  120 ST & RIVERSIDE DR', 0.2),
         ('W  120 ST & RIVERSIDE DR', 'W  121 ST & RIVERSIDE DR', 0.08),
         ('W  121 ST & RIVERSIDE DR', 'W  120 ST & RIVERSIDE DR', 0.08),
         ('W  120 ST & BROADWAY', 'W  120 ST & AMSTERDAM AVE', 0.2),
         ('W  120 ST & AMSTERDAM AVE', 'W  120 ST & BROADWAY', 0.2),
         ('W  120 ST & BROADWAY', 'W  121 ST & BROADWAY', 0.08),
         ('W  121 ST & BROADWAY', 'W  120 ST & BROADWAY', 0.08),
         ('W  120 ST & AMSTERDAM AVE', 'W  120 ST & CONVENT AVE', 0.2),
         ('W  120 ST & CONVENT AVE', 'W  120 ST & AMSTERDAM AVE', 0.2),
         ('W  120 ST & AMSTERDAM AVE', 'W  121 ST & AMSTERDAM AVE', 0.08),
         ('W  121 ST & AMSTERDAM AVE', 'W  120 ST & AMSTERDAM AVE', 0.08),
         ('W  120 ST & CONVENT AVE', 'W  120 ST & ST NICHOLAS AVE', 0.2),
         ('W  120 ST & ST NICHOLAS AVE', 'W  120 ST & CONVENT AVE', 0.2),
         ('W  120 ST & CONVENT AVE', 'W  121 ST & CONVENT AVE', 0.08),
         ('W  121 ST & CONVENT AVE', 'W  120 ST & CONVENT AVE', 0.08),
         ('W  120 ST & ST NICHOLAS AVE', 'W  120 ST & FREDERICK DOUGLASS BLVD', 0.2),
         ('W  120 ST & FREDERICK DOUGLASS BLVD', 'W  120 ST & ST NICHOLAS AVE', 0.2),
         ('W  120 ST & ST NICHOLAS AVE', 'W  121 ST & ST NICHOLAS AVE', 0.08),
         ('W  121 ST & ST NICHOLAS AVE', 'W  120 ST & ST NICHOLAS AVE', 0.08),
         ('W  120 ST & FREDERICK DOUGLASS BLVD', 'W  120 ST & ADAM CLAYTON POWELL JR BLVD', 0.2),
         ('W  120 ST & ADAM CLAYTON POWELL JR BLVD', 'W  120 ST & FREDERICK DOUGLASS BLVD', 0.2),
         ('W  120 ST & FREDERICK DOUGLASS BLVD', 'W  121 ST & FREDERICK DOUGLASS BLVD', 0.08),
         ('W  121 ST & FREDERICK DOUGLASS BLVD', 'W  120 ST & FREDERICK DOUGLASS BLVD', 0.08),
         ('W  120 ST & ADAM CLAYTON POWELL JR BLVD', 'W  120 ST & LENOX AVE', 0.2),
         ('W  120 ST & LENOX AVE', 'W  120 ST & ADAM CLAYTON POWELL JR BLVD', 0.2),
         ('W  120 ST & ADAM CLAYTON POWELL JR BLVD', 'W  121 ST & ADAM CLAYTON POWELL JR BLVD', 0.08),
         ('W  121 ST & ADAM CLAYTON POWELL JR BLVD', 'W  120 ST & ADAM CLAYTON POWELL JR BLVD', 0.08),
         ('W  120 ST & LENOX AVE', 'W  120 ST & 5 AVE', 0.2),
         ('W  120 ST & 5 AVE', 'W  120 ST & LENOX AVE', 0.2),
         ('W  120 ST & LENOX AVE', 'W  121 ST & LENOX AVE', 0.08),
         ('W  121 ST & LENOX AVE', 'W  120 ST & LENOX AVE', 0.08),
         ('W  120 ST & 5 AVE', 'W  120 ST & MADISON AVE', 0.2),
         ('W  120 ST & MADISON AVE', 'W  120 ST & 5 AVE', 0.2),
         ('W  120 ST & 5 AVE', 'W  121 ST & 5 AVE', 0.08),
         ('W  121 ST & 5 AVE', 'W  120 ST & 5 AVE', 0.08),
         ('W  120 ST & MADISON AVE', 'W  121 ST & MADISON AVE', 0.08),
         ('W  121 ST & MADISON AVE', 'W  120 ST & MADISON AVE', 0.08),
         ('W  121 ST & RIVERSIDE DR', 'W  121 ST & BROADWAY', 0.2),
         ('W  121 ST & BROADWAY', 'W  121 ST & RIVERSIDE DR', 0.2),
         ('W  121 ST & RIVERSIDE DR', 'W  123 ST & RIVERSIDE DR', 0.16),
         ('W  123 ST & RIVERSIDE DR', 'W  121 ST & RIVERSIDE DR', 0.16),
         ('W  121 ST & BROADWAY', 'W  121 ST & AMSTERDAM AVE', 0.2),
         ('W  121 ST & AMSTERDAM AVE', 'W  121 ST & BROADWAY', 0.2),
         ('W  121 ST & BROADWAY', 'W  123 ST & BROADWAY', 0.16),
         ('W  123 ST & BROADWAY', 'W  121 ST & BROADWAY', 0.16),
         ('W  121 ST & AMSTERDAM AVE', 'W  121 ST & CONVENT AVE', 0.2),
         ('W  121 ST & CONVENT AVE', 'W  121 ST & AMSTERDAM AVE', 0.2),
         ('W  121 ST & AMSTERDAM AVE', 'W  123 ST & AMSTERDAM AVE', 0.16),
         ('W  123 ST & AMSTERDAM AVE', 'W  121 ST & AMSTERDAM AVE', 0.16),
         ('W  121 ST & CONVENT AVE', 'W  121 ST & ST NICHOLAS AVE', 0.2),
         ('W  121 ST & ST NICHOLAS AVE', 'W  121 ST & CONVENT AVE', 0.2),
         ('W  121 ST & CONVENT AVE', 'W  123 ST & CONVENT AVE', 0.16),
         ('W  123 ST & CONVENT AVE', 'W  121 ST & CONVENT AVE', 0.16),
         ('W  121 ST & ST NICHOLAS AVE', 'W  121 ST & FREDERICK DOUGLASS BLVD', 0.2),
         ('W  121 ST & FREDERICK DOUGLASS BLVD', 'W  121 ST & ST NICHOLAS AVE', 0.2),
         ('W  121 ST & ST NICHOLAS AVE', 'W  123 ST & ST NICHOLAS AVE', 0.16),
         ('W  123 ST & ST NICHOLAS AVE', 'W  121 ST & ST NICHOLAS AVE', 0.16),
         ('W  121 ST & FREDERICK DOUGLASS BLVD', 'W  121 ST & ADAM CLAYTON POWELL JR BLVD', 0.2),
         ('W  121 ST & ADAM CLAYTON POWELL JR BLVD', 'W  121 ST & FREDERICK DOUGLASS BLVD', 0.2),
         ('W  121 ST & FREDERICK DOUGLASS BLVD', 'W  123 ST & FREDERICK DOUGLASS BLVD', 0.16),
         ('W  123 ST & FREDERICK DOUGLASS BLVD', 'W  121 ST & FREDERICK DOUGLASS BLVD', 0.16),
         ('W  121 ST & ADAM CLAYTON POWELL JR BLVD', 'W  121 ST & LENOX AVE', 0.2),
         ('W  121 ST & LENOX AVE', 'W  121 ST & ADAM CLAYTON POWELL JR BLVD', 0.2),
         ('W  121 ST & ADAM CLAYTON POWELL JR BLVD', 'W  123 ST & ADAM CLAYTON POWELL JR BLVD', 0.16),
         ('W  123 ST & ADAM CLAYTON POWELL JR BLVD', 'W  121 ST & ADAM CLAYTON POWELL JR BLVD', 0.16),
         ('W  121 ST & LENOX AVE', 'W  121 ST & 5 AVE', 0.2),
         ('W  121 ST & 5 AVE', 'W  121 ST & LENOX AVE', 0.2),
         ('W  121 ST & LENOX AVE', 'W  123 ST & LENOX AVE', 0.16),
         ('W  123 ST & LENOX AVE', 'W  121 ST & LENOX AVE', 0.16),
         ('W  121 ST & 5 AVE', 'W  121 ST & MADISON AVE', 0.2),
         ('W  121 ST & MADISON AVE', 'W  121 ST & 5 AVE', 0.2),
         ('W  121 ST & 5 AVE', 'W  123 ST & 5 AVE', 0.16),
         ('W  123 ST & 5 AVE', 'W  121 ST & 5 AVE', 0.16),
         ('W  121 ST & MADISON AVE', 'W  123 ST & MADISON AVE', 0.16),
         ('W  123 ST & MADISON AVE', 'W  121 ST & MADISON AVE', 0.16),
         ('W  123 ST & RIVERSIDE DR', 'W  123 ST & BROADWAY', 0.2),
         ('W  123 ST & BROADWAY', 'W  123 ST & RIVERSIDE DR', 0.2),
         ('W  123 ST & RIVERSIDE DR', 'W  124 ST & RIVERSIDE DR', 0.08),
         ('W  124 ST & RIVERSIDE DR', 'W  123 ST & RIVERSIDE DR', 0.08),
         ('W  123 ST & BROADWAY', 'W  123 ST & AMSTERDAM AVE', 0.2),
         ('W  123 ST & AMSTERDAM AVE', 'W  123 ST & BROADWAY', 0.2),
         ('W  123 ST & BROADWAY', 'W  124 ST & BROADWAY', 0.08),
         ('W  124 ST & BROADWAY', 'W  123 ST & BROADWAY', 0.08),
         ('W  123 ST & AMSTERDAM AVE', 'W  123 ST & CONVENT AVE', 0.2),
         ('W  123 ST & CONVENT AVE', 'W  123 ST & AMSTERDAM AVE', 0.2),
         ('W  123 ST & AMSTERDAM AVE', 'W  124 ST & AMSTERDAM AVE', 0.08),
         ('W  124 ST & AMSTERDAM AVE', 'W  123 ST & AMSTERDAM AVE', 0.08),
         ('W  123 ST & CONVENT AVE', 'W  123 ST & ST NICHOLAS AVE', 0.2),
         ('W  123 ST & ST NICHOLAS AVE', 'W  123 ST & CONVENT AVE', 0.2),
         ('W  123 ST & CONVENT AVE', 'W  124 ST & CONVENT AVE', 0.08),
         ('W  124 ST & CONVENT AVE', 'W  123 ST & CONVENT AVE', 0.08),
         ('W  123 ST & ST NICHOLAS AVE', 'W  123 ST & FREDERICK DOUGLASS BLVD', 0.2),
         ('W  123 ST & FREDERICK DOUGLASS BLVD', 'W  123 ST & ST NICHOLAS AVE', 0.2),
         ('W  123 ST & ST NICHOLAS AVE', 'W  124 ST & ST NICHOLAS AVE', 0.08),
         ('W  124 ST & ST NICHOLAS AVE', 'W  123 ST & ST NICHOLAS AVE', 0.08),
         ('W  123 ST & FREDERICK DOUGLASS BLVD', 'W  123 ST & ADAM CLAYTON POWELL JR BLVD', 0.2),
         ('W  123 ST & ADAM CLAYTON POWELL JR BLVD', 'W  123 ST & FREDERICK DOUGLASS BLVD', 0.2),
         ('W  123 ST & FREDERICK DOUGLASS BLVD', 'W  124 ST & FREDERICK DOUGLASS BLVD', 0.08),
         ('W  124 ST & FREDERICK DOUGLASS BLVD', 'W  123 ST & FREDERICK DOUGLASS BLVD', 0.08),
         ('W  123 ST & ADAM CLAYTON POWELL JR BLVD', 'W  123 ST & LENOX AVE', 0.2),
         ('W  123 ST & LENOX AVE', 'W  123 ST & ADAM CLAYTON POWELL JR BLVD', 0.2),
         ('W  123 ST & ADAM CLAYTON POWELL JR BLVD', 'W  124 ST & ADAM CLAYTON POWELL JR BLVD', 0.08),
         ('W  124 ST & ADAM CLAYTON POWELL JR BLVD', 'W  123 ST & ADAM CLAYTON POWELL JR BLVD', 0.08),
         ('W  123 ST & LENOX AVE', 'W  123 ST & 5 AVE', 0.2),
         ('W  123 ST & 5 AVE', 'W  123 ST & LENOX AVE', 0.2),
         ('W  123 ST & LENOX AVE', 'W  124 ST & LENOX AVE', 0.08),
         ('W  124 ST & LENOX AVE', 'W  123 ST & LENOX AVE', 0.08),
         ('W  123 ST & 5 AVE', 'W  123 ST & MADISON AVE', 0.2),
         ('W  123 ST & MADISON AVE', 'W  123 ST & 5 AVE', 0.2),
         ('W  123 ST & 5 AVE', 'W  124 ST & 5 AVE', 0.08),
         ('W  124 ST & 5 AVE', 'W  123 ST & 5 AVE', 0.08),
         ('W  123 ST & MADISON AVE', 'W  124 ST & MADISON AVE', 0.08),
         ('W  124 ST & MADISON AVE', 'W  123 ST & MADISON AVE', 0.08),
         ('W  124 ST & RIVERSIDE DR', 'W  124 ST & BROADWAY', 0.2),
         ('W  124 ST & BROADWAY', 'W  124 ST & RIVERSIDE DR', 0.2),
         ('W  124 ST & BROADWAY', 'W  124 ST & AMSTERDAM AVE', 0.2),
         ('W  124 ST & AMSTERDAM AVE', 'W  124 ST & BROADWAY', 0.2),
         ('W  124 ST & AMSTERDAM AVE', 'W  124 ST & CONVENT AVE', 0.2),
         ('W  124 ST & CONVENT AVE', 'W  124 ST & AMSTERDAM AVE', 0.2),
         ('W  124 ST & CONVENT AVE', 'W  124 ST & ST NICHOLAS AVE', 0.2),
         ('W  124 ST & ST NICHOLAS AVE', 'W  124 ST & CONVENT AVE', 0.2),
         ('W  124 ST & ST NICHOLAS AVE', 'W  124 ST & FREDERICK DOUGLASS BLVD', 0.2),
         ('W  124 ST & FREDERICK DOUGLASS BLVD', 'W  124 ST & ST NICHOLAS AVE', 0.2),
         ('W  124 ST & FREDERICK DOUGLASS BLVD', 'W  124 ST & ADAM CLAYTON POWELL JR BLVD', 0.2),
         ('W  124 ST & ADAM CLAYTON POWELL JR BLVD', 'W  124 ST & FREDERICK DOUGLASS BLVD', 0.2),
         ('W  124 ST & ADAM CLAYTON POWELL JR BLVD', 'W  124 ST & LENOX AVE', 0.2),
         ('W  124 ST & LENOX AVE', 'W  124 ST & ADAM CLAYTON POWELL JR BLVD', 0.2),
         ('W  124 ST & LENOX AVE', 'W  124 ST & 5 AVE', 0.2),
         ('W  124 ST & 5 AVE', 'W  124 ST & LENOX AVE', 0.2),
         ('W  124 ST & 5 AVE', 'W  124 ST & MADISON AVE', 0.2),
         ('W  124 ST & MADISON AVE', 'W  124 ST & 5 AVE', 0.2)]


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


#Build Graph
graph = search_engine.build_graph(edges, closed_edges, cost_multiplier, energy_per_km)

#Visualize Graph
def draw_components(edges):
    G = nx.Graph()

    for u, v, _ in edges:
        G.add_edge(u, v)

    components = list(nx.connected_components(G))

    colors = {}
    for i, comp in enumerate(components):
        for node in comp:
            colors[node] = i

    pos = nx.spring_layout(G)

    node_colors = [colors[n] for n in G.nodes]

    nx.draw(G, pos,
            with_labels=True,
            node_color=node_colors,
            node_size=500,
            cmap=plt.cm.Set3,
            font_size=6)

    plt.title("Connected Components (Islands in Graph)")
    plt.show()

#Display Graph
draw_components(edges)

#Select two furthest points
start = nodes[0]
goal = nodes[-1]

# BFS
bfs_path, bfs_nodes_expanded = search_engine.bfs(graph, start, goal)
bfs_cost = search_engine.compute_cost(graph, bfs_path)
bfs_distance = search_engine.compute_distance(graph, bfs_path)
if (bfs_cost > battery_capacity):
    print("Warning: Destination cannot be reached on a single charge")

# DFS
dfs_path, dfs_nodes_expanded = search_engine.dfs(graph, start, goal)
dfs_cost = search_engine.compute_cost(graph, dfs_path)
dfs_distance = search_engine.compute_distance(graph, dfs_path)
if (dfs_cost > battery_capacity):
    print("Warning: Destination cannot be reached on a single charge")

# UCS
ucs_path, ucs_cost, ucs_nodes_expanded = search_engine.ucs(graph, start, goal)
ucs_distance = search_engine.compute_distance(graph, ucs_path)
if (ucs_cost > battery_capacity):
    print("Warning: Destination cannot be reached on a single charge")

print("BFS")
print("Cost: ", bfs_cost, "Distance: ", bfs_distance)
print("DFS")
print("Cost: ", dfs_cost, "Distance: ", dfs_distance)
print("UCS")
print("Cost: ", ucs_cost, "Distance: ", ucs_distance)

#Example Constraint Satisfaction (Scheduling)
deliveries = [
    {"start": nodes[0], "end": nodes[35], "weight": 20},
    {"start": nodes[35], "end": nodes[10], "weight": 30},
    {"start": nodes[10], "end": nodes[-1], "weight": 40},
    {"start": nodes[-1], "end": nodes[18], "weight": 25}
]

#Physical Constraint
total_weight = sum(d["weight"] for d in deliveries)
if total_weight > max_payload:
    print("Payload Exceeded")

total_energy_consumed = 0
full_path = []

for d in deliveries:
    path, energy, _ = search_engine.ucs(graph, d["start"], d["end"])

    if path is None:
        #Temporal Constraint implemented in graph creation
        print("No path exists")
        exit()

    total_energy_consumed += energy
    full_path.extend(path)

#Energy Constraint
if total_energy_consumed > battery_capacity:
    print("Exceeds battery")

deliveries_distance = search_engine.compute_distance(graph, full_path)

print("Schedule")
print("Cost: ", total_energy_consumed, "Distance: ", deliveries_distance)
