# microservices-with-db-on-dev-server
This repo was created for the article "Working with Microservices-1: Running a Java App that Consists of 10 Microservice on a Development Server".

In this article series, we working with a Springboot app consisting of 10 microservices. It is a Java-based web application developed by Spring company. We will run it on Development, Testing, Staging, and Production environments by using different DevOps tools (Jenkins, Kubernetes and Helm, Docker, Docker Compose, Terraform, Rancher, Nexus Repository, Maven, Ansible, Prometheus and Grafana, GitHub, Amazon Route 53, AWS Certificate Manager, AWS EKS, AWS RDS MySql Database, AWS S3 bucket, Selenium Jobs and Jacoco. ). We will create each environment and run our application in it, we will do all these step by step.

<img align="right" src="https://github.com/cmakkaya/microservices-with-db-on-dev-server/blob/main/flow-chart-for-readme.jpg" />

 
## In summary, we will do the following for each environment;

## In the Testing environment; 
There are two different qa tests; manual and automated tests (Functional Tests by using Selenium jobs). Firstly, we will make an infrastructure that will make these QA tests on the environment.

Then, in order to do the unit test, we will put the unit test (PetTest.java) that was prepared by the developers in the relevant places in the project file. We will add Jacoco (Java Code Coverage) plug-in to pom.xml to generate a report (2). Then, we will start the test with “mvn test” command.

After the unit test is finished, we will run Functional Tests on QA Environment using the Jenkins CI/CD pipeline every evening. For these, we will follow these steps;

We will package the app into jars with Maven, prepare “Dockerfiles” for each microservice and “helm charts” to deploy the application to the Kubernetes Cluster, build App Docker Images with image tags, push helm charts into the AWS S3 bucket, create AWS ECR Repo and push the images to the ECR Repo, create a Kubernetes cluster by using Terraform for QA tests, deploy our microservices App on the Kubernetes cluster using the Helm charts. Finally, we will run Functional Tests on QA Environment using Selenium jobs (automated test). When the test is finished, the cluster will be destroyed automatically by the Jenkins pipeline.
We will use the same testing environments for manual QA tests. The environment we have prepared for manual tests will remain open for a week. Manual testers will test the app from the Excel form that is given to them at this time.

## In the Staging environment; 
Before the production stage, we will make the final checks on the operation of our microservices app. Different from Testing, we will use the following in the Staging phase;

We will use Rancher to create and manage our Kubernetes clusters, create the Rancher server by using Terraform, and install the Rancher into it by using the Helm chart. We will create the cluster on AWS EC2 by using Rancher’s menus. With Rancher, we will easily make changes in the cluster via its dashboard; add nodes, delete nodes, and edit configuration files. We will use MySql Database on the pod for the customer records. Finally, we will check whether our microservices application works in the browser.

## In the Production environment; 
Our application will be made available to users on the Internet. We will use Rancher to create and manage our Kubernetes clusters. Different from Staging, we will use the following in the Production phase;

We will create the cluster on AWS EKS by using Rancher’s menus. We will use AWS RDS MySql Database for customer records. We will set Domain Name, Create an “A record” for the microservices app in our hosted zone by using AWS Route 53 domain registrar and bind it to our “ app cluster”. Configure TLS(SSL) certificate for HTTPS connection to the domain name using AWS Certification Manager. Finally, we will check whether our microservices application works in the browser, and monitor the microservices apps in the cluster with Prometheus and Grafana.

## In the Development Server; 
we will compile, test (with junit in pom.xml), build, and run our code on the container via Docker, Docker Compose, and Maven in the development server we will install by using Terraform. We will create and clone Source Code Management Repository(GitHub) to Development Server, and we will work in different branches (dev, feature, bugfix, hotfix, etc.) on GitHub for the DevOps cycle. Finally, We will observe what happens in the containers, after the “docker-compose” command runs.

We will do them all step by step.
