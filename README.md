# Mini Sistema Distribuido con FastAPI, Redis, PostgreSQL y Nginx
#Creado Por Ingeniero Jaider Reyes Herazo

Este proyecto demuestra un entorno distribuido usando **Minikube** y **Kubernetes**, con una arquitectura de microservicios que incluye:

- `FastAPI` + `Uvicorn`: API Stateless
- `Redis`: Caché y contador de hits
- `PostgreSQL`: Persistencia
- `Nginx`: Balanceador de carga
- Soporte para escalabilidad horizontal y tolerancia a fallos

---

## 📦 Estructura del Proyecto

```
.
├── app/
│   └── main.py
├── Dockerfile
└── k8s/
    ├── app.yaml
    ├── postgres.yaml
    ├── redis.yaml
    └── nginx.yaml
```

---

## 🚀 Despliegue Paso a Paso

### 1. Inicia Minikube

```bash
minikube start
```

### 2. Usa Docker dentro de Minikube

```bash
eval $(minikube docker-env)
```

### 3. Construye la imagen personalizada de la API

```bash
docker build -t fastapi-app:latest .
```

### 4. Aplica los archivos YAML

```bash
kubectl apply -f k8s/
```

### 5. Verifica que los pods estén corriendo

```bash
kubectl get pods
```

### 6. Accede al servicio Nginx (balanceador)

```bash
minikube service nginx --url
```

---

## ⚙️ Funcionalidad de la API

- `GET /` → Devuelve un mensaje de bienvenida y contador de visitas desde Redis
- `GET /db` → Verifica conectividad con PostgreSQL

---

## 📈 Escalabilidad y Tolerancia a Fallos

### Escalar horizontalmente:

```bash
kubectl scale deployment fastapi-app --replicas=5
```

### Simular fallo de réplica:

```bash
kubectl delete pod <nombre-del-pod>
```

Nginx seguirá respondiendo usando otras réplicas disponibles.

---

## ✅ Requisitos

- Docker
- Minikube
- kubectl

---

## 🧼 Limpieza

```bash
kubectl delete -f k8s/
```

---

## 📚 Créditos

Desarrollado como una demostración de arquitectura distribuida con Kubernetes.