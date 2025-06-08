# 🧩 Orderly Composer

Este repositorio es el **módulo principal** de la plataforma **Orderly**, una arquitectura basada en microservicios y frontends desacoplados para gestionar pedidos en tiendas locales.

Coordina múltiples servicios y aplicaciones usando **Docker**, **Git submodules**, y una configuración centralizada.

---

## ✅ Requisitos para desarrollo

Antes de comenzar, asegurate de tener instaladas las siguientes herramientas en tu máquina:

- [Git](https://git-scm.com/downloads)
- [Node.js](https://nodejs.org/) (v20 o superior)
- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- Docker Compose (incluido con Docker Desktop)
- **En Windows**:
  - Tener habilitado **WSL2**
  - Activar la opción **"Plataforma de Máquina Virtual"**
  - Ver guía: https://aka.ms/enablevirtualization

---

## 🚀 Instalación rápida

Cloná este repositorio con los submódulos y levantá todo con un solo comando:

```bash
git clone --recurse-submodules https://github.com/diegodevitte/orderly-composer.git
cd orderly-composer
chmod +x setup.sh
./setup.sh
```

---

## 🧠 ¿Qué hace `setup.sh`?

Este script automatiza todo el flujo de instalación y ejecución de Orderly:

1. 🔥 Elimina contenedores, imágenes, redes y volúmenes **relacionados con Orderly**.
2. 🔁 Inicializa los submódulos (`git submodule update --init --recursive`).
3. 📦 Ejecuta `npm install` en todos los submódulos que tengan `package.json`.
4. 🐳 Construye los contenedores con Docker.
5. 🚀 Levanta toda la plataforma con `docker compose up`.

---

## 🧼 Modo limpieza solamente

Si solo querés limpiar todos los contenedores, imágenes, volúmenes y redes relacionadas con Orderly sin levantar nada, podés usar:

```bash
./setup.sh --clean-only
```

---

## 🧱 Estructura del proyecto

```
orderly-composer/
├── docker-compose.yml               # Orquestador de todos los servicios
├── setup.sh                         # Script de setup y limpieza
├── README.md                        # Este archivo
├── orderly-web/                     # Frontend web (Next.js)
├── orderly-microservice-auth/      # Microservicio de autenticación (Fastify + JWT)
└── ...                              # Otros microservicios y apps
```

---

## 🔗 Submódulos actuales

- orderly-web
- orderly-microservice-auth

---

## 🔄 Trabajando con submódulos

Cuando hacés cambios dentro de un submódulo:

```bash
cd orderly-web       # O cualquier submódulo
git commit -m "Cambios locales"
git push

cd ..
git add orderly-web  # Actualizás la referencia del submódulo
git commit -m "Update submodule reference"
git push
```

---

## 🛠 Contribución

Este repositorio es parte de un ecosistema de servicios desacoplados. Cada submódulo se puede desarrollar y testear por separado, pero el módulo principal (`orderly-composer`) sirve como entorno de integración completo.
