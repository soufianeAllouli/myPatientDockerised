node{
    
    stage("clone the repository"){
        git 'https://github.com/soufianeAllouli/myPatientDockerised.git'
    }
    
    stage("maven clean package"){
        def mavenHome= tool name:"Maven3.8.1" , type:"maven"
        def mavenCMD="${mavenHome}/bin/mvn"
        sh "${mavenCMD} clean package"
    }
    
    stage("build image"){
        sh "docker build -t soufianeallouli/patient_app ."
    }
    
    stage("push to DockerHub"){
        withCredentials([string(credentialsId: 'DockerHub_Pass', variable: 'DockerHub_Pass')]) {
            sh "docker login -u soufianeallouli -p ${DockerHub_Pass}"
        }
        sh "docker push soufianeallouli/patient_app"
        
    }
    
    stage("deploy application"){
        sh "docker-compose down"
        sh "docker-compose up -d"
    }
    
    
 
}
