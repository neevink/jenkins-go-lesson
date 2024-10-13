pipeline {
    agent any

    tools {
        go '1.23.2' // Версия Go, настроенная в Jenkins
    }

    parameters {
        choice(name: 'GOOS', choices: ['linux', 'windows', 'darwin'], description: 'Select the target OS')
        choice(name: 'GOARCH', choices: ['amd64', '386', 'arm64'], description: 'Select the target architecture')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Compile') {
            steps {
                script {
                    // Установка переменных окружения и запуск bash-скрипта
                    withEnv(["GOOS=${params.GOOS}", "GOARCH=${params.GOARCH}"]) {
                        sh 'bash build.sh'
                    }
                }
            }
        }
    }
}
