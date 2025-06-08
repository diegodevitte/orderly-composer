# 🧩 Orderly Composer

Este repositorio es el módulo principal de la plataforma **Orderly**, una arquitectura basada en microservicios y aplicaciones frontend para gestionar pedidos en tiendas locales.

Orquesta múltiples servicios y frontends usando **Docker**, **submódulos Git** y configuración centralizada.

---

## ✅ Requisitos para desarrollar

Asegurate de tener instalado:

- Git
- Node.js (versión 20 o superior)
- Docker Desktop (con Docker Compose incluido)
- En Windows: tener habilitado WSL2 y la Plataforma de Máquina Virtual

---

## 🚀 Instalación rápida

1. Cloná este repositorio con submódulos:

```bash
git clone --recurse-submodules https://github.com/diegodevitte/orderly-composer.git
cd orderly-composer
```

2. Dale permisos de ejecución al script (solo Linux/macOS/WSL):

```bash
chmod +x setup.sh
```

3. Ejecutá el script:

```bash
./setup.sh
```

> En Windows podés usar Git Bash o WSL para ejecutar el script. (Próximamente: versión `.bat`)

---

## 🧠 ¿Qué hace `setup.sh`?

- Actualiza y clona todos los submódulos
- Instala dependencias (`npm install`) en cada subproyecto Node.js
- Construye los contenedores Docker
- Levanta la plataforma con `docker compose`

---

## 📦 Estructura del proyecto

```
orderly-composer/
├── docker-compose.yml               # Orquestador de contenedores
├── README.md                        # Este archivo
├── setup.sh                         # Script de instalación automatizada
├── orderly-web/                     # Frontend web en Next.js
├── orderly-microservice-auth/      # Microservicio de autenticación (Fastify + JWT)
└── ...                              # Otros microservicios y apps
```

---

## 🔗 Submódulos actuales

- orderly-web
- orderly-microservice-auth

---

## 📤 Clonar en otra máquina

```bash
git clone --recurse-submodules https://github.com/diegodevitte/orderly-composer.git
cd orderly-composer
chmod +x setup.sh
./setup.sh
```

---

## 🛠 Modo desarrollo con submódulos

Para trabajar en un submódulo:

```bash
cd orderly-web  # o cualquier otro
git commit -m "Cambios"
git push
```

Luego actualizá la referencia en el módulo principal:

```bash
cd ..
git add orderly-web
git commit -m "Update submodule reference"
git push
```
