# 🛠 Etapa de Construcción (Build Stage)
FROM node:20-alpine AS builder

# Definir el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar los archivos de dependencias primero para aprovechar la caché de Docker
COPY package.json package-lock.json ./

# Instalar todas las dependencias (incluyendo las de desarrollo necesarias para la compilación)
RUN npm ci

# Copiar el código fuente de la aplicación
COPY . .

# Construir la aplicación Next.js en modo standalone
RUN npm run build

# 🏗 Etapa de Producción (Final Image)
FROM node:20-alpine

# Definir el directorio de trabajo dentro del contenedor
WORKDIR /app

# Instalar solo las dependencias necesarias para producción
COPY package.json package-lock.json ./
RUN npm ci --omit=dev

# Copiar solo los archivos esenciales desde la etapa de construcción
COPY --from=builder /app/.next/standalone ./
COPY --from=builder /app/public ./public
COPY --from=builder /app/.next/static ./.next/static

# Exponer el puerto en el que se ejecutará la aplicación
EXPOSE 3000

# Iniciar la aplicación Next.js en modo standalone
CMD ["node", "server.js"]