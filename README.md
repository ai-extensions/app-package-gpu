# app-package-gpu

## Run on JupyterLab

```
mamba env create -f environment.yml 
```

```
cwltool --no-container app-package.cwl#gpu-assert 
```
