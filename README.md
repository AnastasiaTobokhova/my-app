
# Kubernetes Project with ArgoCD, Grafana, and Prometheus

## Project Overview
This project demonstrates the deployment and monitoring of applications in a Kubernetes cluster using ArgoCD, Grafana, and Prometheus.

### Key Features:
- **ArgoCD**: Continuous Delivery with application synchronization.
- **Grafana**: Monitoring and visualization dashboards.
- **Prometheus**: Metrics collection and alerting.

## Setup Instructions

### Prerequisites
1. Docker and Kubernetes installed.
2. A running Kubernetes cluster (e.g., `kind`).
3. Helm installed.

### Installation Steps
1. **Install ArgoCD:**
   ```bash
   kubectl create namespace argocd
   kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
   ```
2. **Install Prometheus and Grafana:**
   ```bash
   kubectl create namespace monitoring
   helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
   helm repo update
   helm install prometheus prometheus-community/kube-prometheus-stack -n monitoring
   ```

3. **Port Forwarding:**
   - ArgoCD: `kubectl port-forward svc/argocd-server -n argocd 8080:443`
   - Grafana: `kubectl port-forward -n monitoring svc/grafana 3000:80`
   - Prometheus: `kubectl port-forward -n monitoring svc/prometheus-kube-prometheus-prometheus 9090:9090`

4. **Login Information:**
   - **ArgoCD**: Default username: `admin`, password retrieved via:
     ```bash
     kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 --decode
     ```
   - **Grafana**: Default username: `admin`, password retrieved via:
     ```bash
     kubectl get secret --namespace monitoring grafana -o jsonpath="{.data.admin-password}" | base64 --decode
     ```

### Adding Applications in ArgoCD
1. Open ArgoCD UI at `http://localhost:8080`.
2. Login with the admin credentials.
3. Create a new application and provide the repository URL, target branch, and path to your Helm chart.

### Setting up Grafana Dashboards
1. Open Grafana at `http://localhost:3000`.
2. Add Prometheus as a data source.
3. Import a dashboard template or create custom dashboards.

### Alerts and Notifications
- Configure alert rules in Prometheus.
- Set up notifications in Grafana (e.g., email, Telegram).

## Project Screenshots
[Add screenshots here]

## Troubleshooting
- Check logs for ArgoCD or Grafana using:
  ```bash
  kubectl logs -n argocd <pod-name>
  kubectl logs -n monitoring <pod-name>
  ```
- Ensure correct port forwarding and namespace configurations.

## Future Improvements
- Enable persistence for Grafana and Prometheus.
- Automate deployment pipelines.

---

**Author**: A project by tg:@anastasssssssia
