#!/bin/bash

# Harden Kubernetes Cluster

echo "🔐 Starting Kubernetes hardening process..."

# 1. Disable anonymous access
echo "Disabling anonymous access..."
kubectl patch --type merge -p '{"spec":{"authentication":{"anonymous":{"enabled":false}}}}' kubeapiserver

# 2. Enforce RBAC policies
echo "Enforcing RBAC..."
kubectl create clusterrolebinding secure-admin --clusterrole=cluster-admin --user=admin@example.com

# 3. Enable audit logging
echo "Configuring audit logging..."
mkdir -p /etc/kubernetes/audit
cat <<EOF > /etc/kubernetes/audit/audit-policy.yaml
apiVersion: audit.k8s.io/v1
kind: Policy
rules:
  - level: Metadata
EOF

# 4. Disable privileged containers
echo "Disabling privileged containers..."
kubectl apply -f - <<EOF
apiVersion: policy/v1
kind: PodSecurityPolicy
metadata:
  name: restricted
spec:
  privileged: false
  allowPrivilegeEscalation: false
  requiredDropCapabilities:
    - ALL
  runAsUser:
    rule: 'MustRunAsNonRoot'
  seLinux:
    rule: 'RunAsAny'
  volumes:
    - 'configMap'
    - 'emptyDir'
    - 'projected'
    - 'secret'
    - 'downwardAPI'
EOF

# 5. Set Network Policies
echo "Applying network policies..."
kubectl apply -f - <<EOF
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: default-deny-all
spec:
  podSelector: {}
  policyTypes:
  - Ingress
  - Egress
EOF

echo "✅ Kubernetes hardening complete!"
