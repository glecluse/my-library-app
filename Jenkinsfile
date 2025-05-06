// Jenkinsfile (Nouvelle tentative propre - SANS FTP)
pipeline {
    // Dans Jenkinsfile
    agent {
        docker {
            image 'docker:latest'
            // Ajoute -u root ici pour spécifier l'utilisateur DANS le conteneur agent
            args '-u root -v /var/run/docker.sock:/var/run/docker.sock'
            reuseNode false // Optionnel: garde pour forcer un conteneur neuf
        }
    }
    
    stages {
        // PAS d'étape Checkout explicite ici

        stage('Build Docker Image') {
            steps {
                echo "Construction de l'image Docker pour l'application..."
                sh 'docker build -t my-library-app .'
            }
        }

        stage('Export Static') {
            steps {
                echo "Exportation des fichiers HTML statiques..."
                sh 'mkdir -p out'
                sh 'docker run --rm -v "$(pwd)/out:/app/out" my-library-app'
                // On vérifie que le dossier 'out' a été créé et contient des fichiers
                echo "Contenu du dossier 'out' exporté :"
                sh 'ls -la out/'
            }
        }

        // L'étape 'Deploy to FTP' a été supprimée

    } // Fin des stages
} // Fin du pipeline