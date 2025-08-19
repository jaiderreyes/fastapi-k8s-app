# 🐳 FastAPI K8s App – Sistema Distribuido con Minikube By Jaider Reyes Herazo
![Arquitectura](./Fastapi.png)

Este proyecto implementa una arquitectura de microservicios distribuida usando **FastAPI**, **Redis**, **PostgreSQL**, y **Nginx**, desplegados sobre un clúster de **Kubernetes en Minikube**.

---

## 📦 Componentes del sistema

| Componente   | Función                                                  |
|--------------|----------------------------------------------------------|
| FastAPI + Uvicorn | API stateless con endpoints `/` y `/db`              |
| Redis        | Almacenamiento en caché y contador de visitas            |
| PostgreSQL   | Base de datos para persistencia                          |
| Nginx        | Balanceador de carga para múltiples réplicas             |

---

## 📁 Estructura del proyecto

```
fastapi_k8s_app/
├── app/
│   └── main.py                # Código de la API FastAPI
├── k8s/
│   ├── app.yaml               # Despliegue y servicio para FastAPI
│   ├── redis.yaml             # Redis deployment + service
│   ├── postgres.yaml          # PostgreSQL deployment + PVC + service
│   └── nginx.yaml             # Configuración balanceador Nginx
├── Dockerfile                 # Imagen personalizada para FastAPI
├── build_and_reload.sh        # Script de despliegue sin Docker Desktop
└── README.md                  # Este archivo
```

---

## 🚀 Cómo desplegar

### Requisitos:

- [ ] Docker Desktop (opcional)
- [x] Minikube
- [x] kubectl

### 1. Inicia Minikube

```bash
minikube start
```

### 2. Construye la imagen dentro de Minikube

```bash
minikube image build -t fastapi-app:latest .
```

> 💡 Si usas Docker Desktop y no estás en entorno multinodo, puedes usar `docker build` + `minikube image load`.

### 3. Despliega todos los servicios

```bash
kubectl apply -f k8s/
```

### 4. Verifica el estado de los pods

```bash
kubectl get pods
```

### 5. Obtén la URL pública para acceder a la app

```bash
minikube service nginx --url
```

---

## 🔄 Escalabilidad y tolerancia a fallos

### Escalar horizontalmente:

```bash
kubectl scale deployment fastapi-app --replicas=5
```

### Simular caída de una réplica:

```bash
kubectl delete pod <nombre-del-pod>
```

Nginx seguirá balanceando entre las réplicas disponibles.

---

## 📬 Endpoints disponibles

- `GET /` → Retorna mensaje y contador de visitas desde Redis
- `GET /db` → Verifica conexión con PostgreSQL

---

## 🧼 Limpieza

```bash
kubectl delete -f k8s/
```

---

## 👨‍💻 Autor

**Jaider Reyes** – DevOps & Cloud Enthusiast  
GitHub: [@jaiderreyes](https://github.com/jaiderreyes)

---

## ⚖️ Licencia

Este proyecto está bajo la licencia MIT.