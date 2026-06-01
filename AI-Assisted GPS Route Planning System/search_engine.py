from collections import deque
import heapq

#Build graph from knowledge base
def build_graph(edges, closed_edges, cost_multiplier, energy_per_km):
    graph = {}

    for (u, v, dist) in edges:

        #Skip closed edges
        if (u,v) in closed_edges or (v,u) in closed_edges:
            continue

        #Apply multiplier
        multiplier = cost_multiplier.get((u,v), 1)
        cost = dist * multiplier * energy_per_km

        #Undirected Graph Assembly
        graph.setdefault(u, []).append((v, dist, cost))
        graph.setdefault(v, []).append((u, dist, cost))

    return graph
    

def bfs(graph, start, goal):
    visited = set()
    queue = deque([(start, [start])])
    nodes_expanded = 0

    while queue:
        node, path = queue.popleft()
        nodes_expanded += 1

        if node == goal:
            #Goal found
            return path, nodes_expanded

        if node not in visited:
            visited.add(node)

            for neighbor, _, _ in graph.get(node, []):
                queue.append((neighbor, path + [neighbor]))

    #Goal not found
    return None, nodes_expanded


def dfs(graph, start, goal):
    stack = [(start, [start])]
    visited = set()
    nodes_expanded = 0

    while stack:
        node, path = stack.pop()
        nodes_expanded += 1


        if node == goal:
            return path, nodes_expanded

        if node not in visited:
            visited.add(node)

            for neighbor, _, _ in graph.get(node, []):
                stack.append((neighbor, path + [neighbor]))

    #Goal not found
    return None, nodes_expanded


def ucs(graph, start, goal):
    pq = [(0, start, [start])]
    visited = set()
    nodes_expanded = 0

    while pq:
        cost, node, path = heapq.heappop(pq)
        nodes_expanded += 1

        if node == goal:
            return path, cost, nodes_expanded

        if node not in visited:
            visited.add(node)

            for neighbor, _, edge_cost in graph.get(node, []):
                heapq.heappush(pq, (cost + edge_cost, neighbor, path + [neighbor]))

    #Goal not found
    return None, float("inf"), nodes_expanded

def compute_cost(graph, path):
    total = 0

    for i in range(len(path) - 1):
        u, v = path[i], path[i+1]

        for neighbor, _, cost in graph[u]:
            if neighbor == v:
                total += cost
                break

    return total

def compute_distance(graph, path):
    total = 0

    for i in range(len(path) - 1):
        u, v = path[i], path[i+1]

        for neighbor, dist, _ in graph[u]:
            if neighbor == v:
                total += dist
                break

    return total
