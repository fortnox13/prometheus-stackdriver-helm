# prometheus-stackdriver-helm
Terraform files to deploy prometheus + stackdriver sidecar using helm <br />
In yaml file: <br />
    containers: <br />
      - name: stackdriver-sidecar <br />
        image: gcr.io/stackdriver-prometheus/stackdriver-prometheus-sidecar:<SIDECAR_IMAGE_TAG> <br />
        imagePullPolicy: Always <br />
        args: <br />
          - --stackdriver.project-id=<GCP_PROJECT> <br />
          - --prometheus.wal-directory=<DATA_DIR>/wal <br />
          - --stackdriver.kubernetes.location=<GCP_REGION> <br />
          - --stackdriver.kubernetes.cluster-name=<KUBE_CLUSTER> <br />
          ports: <br />
          - name: stackdriver <br />
            containerPort: 9091 <br />
        volumeMounts: <br />
          - name:    <DATA> <br />
            mountPath: <DATA_DIR> <br />
   <br />
KUBE_NAMESPACE: Namespace to run the script against. <br />
KUBE_CLUSTER: Sidecar's cluster name parameter. <br />
GCP_REGION: Sidecar's Google Cloud region parameter. <br />
GCP_PROJECT: Sidecar's Google Cloud project parameter. <br />
DATA_DIR: Sidecar's data directory. This is the directory that houses the shared volume that your Prometheus server writes to. In the subsequent instructions, this variable is set to the value /data. <br />
DATA_VOLUME: Name of the shared volume in the DATA_DIR that contains Prometheus's data. In the subsequent instructions, this variable is set to data-volume. <br />
SIDECAR_IMAGE_TAG: Docker image version for the Prometheus sidecar. The latest release can be found in the Container registry. <br />
   <br />
   <br />
To find <DATA_DIR> --prometheus.wal-directory=: <br />
kubectl describe statefulset -n <KUBE_NAMESPACE> | grep "--storage.tsdb.path=" <br />
To find <DATA>: <br />
kubectl describe statefulset -n <KUBE_NAMESPACE> | grep "<DATA> from" <br />
   <br /> 
     <br />
