# prometheus-stackdriver-helm
Terraform files to deploy prometheus + stackdriver sidecar using helm \n
In yaml file:
    containers:
      - name: stackdriver-sidecar
        image: gcr.io/stackdriver-prometheus/stackdriver-prometheus-sidecar:<SIDECAR_IMAGE_TAG>
        imagePullPolicy: Always
        args:
          - --stackdriver.project-id=<GCP_PROJECT>
          - --prometheus.wal-directory=<DATA_DIR>/wal
          - --stackdriver.kubernetes.location=<GCP_REGION>
          - --stackdriver.kubernetes.cluster-name=<KUBE_CLUSTER>
          ports:
          - name: stackdriver
            containerPort: 9091
        volumeMounts:
          - name:    <DATA>
            mountPath: <DATA_DIR>
  
KUBE_NAMESPACE: Namespace to run the script against.
KUBE_CLUSTER: Sidecar's cluster name parameter.
GCP_REGION: Sidecar's Google Cloud region parameter.
GCP_PROJECT: Sidecar's Google Cloud project parameter.
DATA_DIR: Sidecar's data directory. This is the directory that houses the shared volume that your Prometheus server writes to. In the subsequent instructions, this variable is set to the value /data.
DATA_VOLUME: Name of the shared volume in the DATA_DIR that contains Prometheus's data. In the subsequent instructions, this variable is set to data-volume.
SIDECAR_IMAGE_TAG: Docker image version for the Prometheus sidecar. The latest release can be found in the Container registry.
  
  
To find <DATA_DIR> --prometheus.wal-directory=:
kubectl describe statefulset -n <KUBE_NAMESPACE> | grep "--storage.tsdb.path="
To find <DATA>:
kubectl describe statefulset -n <KUBE_NAMESPACE> | grep "<DATA> from"
  
