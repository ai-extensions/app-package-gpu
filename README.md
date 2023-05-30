# app-package-gpu

## Run on JupyterLab

```
mamba env create -f environment.yml 
```

```
cwltool --no-container app-package.cwl#gpu-assert 
```

This will return:

```
jovyan@jupyter-fbrito-dev:~/app-package-gpu$ cwltool --no-container app-package.cwl#gpu-assert 
INFO /opt/conda/bin/cwltool 3.1.20230201224320
INFO Resolved 'app-package.cwl#gpu-assert' to 'file:///workspace/app-package-gpu/app-package.cwl#gpu-assert'
INFO [workflow ] start
INFO [workflow ] starting step node_gpu
INFO [step node_gpu] start
INFO [job node_gpu] /tmp/xarb38g6$ python \
    -m \
    app
['/device:CPU:0', '/device:GPU:0']
tf.Tensor(-0.84458923, shape=(), dtype=float32)
INFO [job node_gpu] Max memory used: 252MiB
INFO [job node_gpu] completed success
INFO [step node_gpu] completed success
INFO [workflow ] completed success
{}INFO Final process status is success
```


## Run on K8s with Calrissian


```
calrissian \
    --debug \
    --stdout /calrissian/results.json \
    --stderr /calrissian/app.log \
    --max-ram 16G \
    --max-cores "8" \
    --tmp-outdir-prefix /calrissian/tmp/ \
    --outdir /calrissian/ \
    --usage-report /calrissian/usage-report.json \
    app-package.cwl#gpu-assert
```
