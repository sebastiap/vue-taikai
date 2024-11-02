FROM node:16.17.1-alpine3.16

# instalar un simple servidor http para servir nuestro contenido estático
RUN npm install -g http-server

# hacer la carpeta 'app' el directorio de trabajo actual
WORKDIR /app

# copiar 'package.json' y 'package-lock.json' (si están disponibles)
COPY package*.json ./

# instalar dependencias del proyecto
RUN npm install

# copiar los archivos del directorio donde esta el dockerfile y carpetas del proyecto al directorio de trabajo actual (es decir, la carpeta 'app' en la imagen)
COPY . .

# construir aplicación para producción minificada
RUN npm run build

EXPOSE 8080
#Especifica los comando que queremos que corra
CMD [ "http-server", "dist" ]