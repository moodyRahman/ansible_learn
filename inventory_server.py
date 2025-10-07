
#!/usr/bin/env python3
from flask import *
import docker


client = docker.from_env()
app = Flask(__name__)

@app.route("/")
def index():
    containers = filter(lambda x: "shigechi" in x.name, client.containers.list())
    out = {"d_containers":{"hosts":[x.name for x in containers]}}
    return out

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=80)