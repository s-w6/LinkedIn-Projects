from google import genai

client = genai.Client(api_key="<Insert API Key>")

def query_gemini(prompt):
    response = client.models.generate_content(model = "gemini-3-flash-preview",contents=prompt)
    return response

#Prompt for Geographic Data
geo_prompt =  """
You are an AI that converts geographic street data into a graph.

Task:
- Extract intersections as nodes
- Extract streets as edges
- Assign approximate distances in km

Output ONLY Python code:

nodes = ["N1", "N2", "N3"]

edges = [
    ("N1","N2",0.3),
    ("N2","N3",0.5)
]

Rules:
- Keep graph small (50-100 nodes)
- Select nodes that would result in a STRONGLY CONNECTED graph
- Use the full_street_name value to name the nodes
- Ignore irrelevant metadata

GeoJSON:
<Provided Data>
"""

#Prompt for Bike Manual
bike_prompt = """
Extract the following bike specifications:

- Battery capacity (Wh)
- Max payload (kg)
- Estimate energy consumption per km

Output ONLY Python:

battery_capacity = ...
max_payload = ...
energy_per_km = ...

Bike Manual:
<Bike Manual Data>
"""

#Prompt for Traffic Advisory
traffic_prompt = """
You are modeling constraints for a delivery system.

Given:
- A graph of nodes and edges where the edges are assigned a weight that represents the approximate distance in km
- A traffic advisory

Tasks:
1. Identify closed streets
2. Identify conditions increasing cost (rain, construction, events)
3. Estimate an appropriate cost increase based on the indentified conditions
4. If advisory is weak, invent 3 realistic constraints
5. Create a single comment in the python code identifying all constraints indentified or created
6. Only identify constaints that would affect the provided graph

Output ONLY Python:

closed_edges = [("N1","N2")]

cost_multiplier = {
    ("N2","N3"): Estimated Cost Increase
}

Graph:
<Graph from geo_prompt>

Advisory:
<Traffic Information>
"""

#Output results to python files
graph_output = query_gemini(geo_prompt)
with open("graph.py", "w") as f:
    f.write(graph_output.text)
    
bike_output = query_gemini(bike_prompt)
with open("bike.py", "w") as f:
    f.write(traffic_output.text)
    
traffic_output = query_gemini(traffic_prompt)
with open("traffic.py", "w") as f:
    f.write(traffic_output.text)
