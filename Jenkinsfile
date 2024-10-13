groovy
pipeline {
    agent any

    parameters {
        choice(name: 'GOOS', choices: ['linux', 'windows', 'darwin'], description: 'Select the target OS')
        choice(name: 'GOARCH', choices: ['amd64', '386', 'arm64'], description: 'Select the target architecture')
    }

    stages {
        stage('Checkout') {
            steps {
                // Рассчитываем, что репозиторий содержит build.sh и main/main.go
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
        
        stage('Smoke Test') {
            steps {
                script {
                    def exe = "hello${params.GOOS == 'windows' ? '.exe' : ''}"
                    sh "./${exe}"
                }
            }
        }
    }
}
