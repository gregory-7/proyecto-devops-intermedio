# 🛡️ Microservicios Orquestados con DevSecOps Pipeline

Este proyecto implementa una arquitectura de microservicios robusta y segura, diseñada bajo principios de **Infraestructura como Código (IoC)** y **Seguridad Operativa**. Utiliza un flujo de trabajo automatizado para garantizar que cada despliegue cumpla con estándares técnicos de ciberseguridad.

## 🚀 Características Técnicas

- **API REST:** Desarrollada en Node.js con Express y protegida con **Helmet** para hardening de cabeceras HTTP.
- **Base de Datos:** MongoDB con persistencia de datos mediante volúmenes de Docker.
- **Orquestación:** Configuración multi-contenedor con **Docker Compose**, definiendo redes privadas para el aislamiento de servicios.
- **Salud del Sistema:** Implementación de endpoints de `Health Check` para monitoreo de disponibilidad y conexión a DB.

## 🛡️ Seguridad y DevOps (Pipeline CI/CD)

El proyecto incluye un pipeline automatizado en **GitHub Actions** que ejecuta un escaneo de seguridad en cada `push`:

1. **SCA (Software Composition Analysis):** Auditoría automática de vulnerabilidades en dependencias de NPM.
2. **Dockerfile Linting:** Análisis estático con **Hadolint** para asegurar imágenes ligeras (Alpine) y ejecución con usuario no-root.
3. **Validación Bash:** Scripts automatizados para pruebas de integridad previas al despliegue.

## 🛠️ Requisitos e Instalación

Asegúrate de tener instalado [Docker](https://www.docker.com/) y [Docker Compose](https://docs.docker.com/compose/).

1. Clonar el repositorio:
   ```bash
   git clone [https://github.com/TU_USUARIO/nombre-del-repo.git](https://github.com/TU_USUARIO/nombre-del-repo.git)
   cd nombre-del-repo

   Levantar la arquitectura:
   docker-compose up --build -d

   📁 Estructura del Proyecto
api/: Código fuente, Dockerfile y configuración de la API.

tests/: Scripts de automatización de escaneo de seguridad.

.github/workflows/: Definición del Pipeline de CI/CD.

docker-compose.yml: Orquestador de servicios.

Autor: Gregory Arriagada - Especialista en Informática y Ciberseguridad.
