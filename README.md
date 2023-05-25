# app-package-gpu

## Run on JupyterLab

```
mamba env create -f environment.yml 
```

```
cwltool --no-container app-package.cwl#gpu-assert 
```


## Run on K8s with Calrissian


```
calrissian \
    --stdout /calrissian/results.json \
    --stderr /calrissian/app.log \
    --max-ram 16G \
    --max-cores "8" \
    --tmp-outdir-prefix /calrissian/tmp/ \
    --outdir /calrissian/ \
    --usage-report /calrissian/usage-report.json \
    app-package.cwl#gpu-assert
```