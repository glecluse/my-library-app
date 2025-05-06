# Utiliser une image Node.js légère comme base
FROM node:20-alpine

# Définir le répertoire de travail dans l'image
WORKDIR /app

# Copier tous les fichiers du projet local (.) dans le répertoire /app de l'image
COPY . .

# Installer les dépendances proprement via package-lock.json
RUN npm ci

# Lancer le build Next.js pour production
RUN npm run build

# Exporter le site en fichiers statiques dans /app/out
RUN npm run export

# Commande par défaut si on lance ce conteneur (pour tester l'image)
# Sert le contenu du dossier /app/out
CMD ["npx", "serve", "out"]