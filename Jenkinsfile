pipeline {
    agent any
    stages {
        stage('Instalar Dependências') {
            steps {
                sh 'npm install'
            }
        }
        stage('Executar Testes Cypress') {
            steps {
                sh 'npx cypress run --spec "cypress/e2e/1-getting-started/todo.cy.js"'
            }
        }
    }
}
