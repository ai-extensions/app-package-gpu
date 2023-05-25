

cwlVersion: v1.0

$namespaces:
  s: https://schema.org/
s:softwareVersion: 1.1.7
schemas:
- http://schema.org/version/9.0/schemaorg-current-http.rdf

$graph:
- class: Workflow

  id: gpu-assert
  label: assert GPU is available
  doc: assert GPU is available

  requirements: []
  
  inputs: []

  outputs: []
 
  steps:
    node_gpu:
      run: "#cli"
      in: []
      out: []

- class: CommandLineTool
  id: cli

  requirements:
    InlineJavascriptRequirement: {}
    EnvVarRequirement:
      envDef: 
        PATH: /opt/conda/envs/env_gpu/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
        PYTHONPATH: /workspaces/
    ResourceRequirement:
      coresMax: 1
      ramMax: 1024

  hints:
    DockerRequirement:
      dockerPull: gpu-assert:latest
  
  baseCommand: ["python", "-m", "app"]
  arguments: []
  inputs: []
  outputs: []

