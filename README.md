# BiceModule
Modulo de terraform para generar un entorno de AWS Beanstalk

---------------

## Requerimientos

- Terraform 1.3.5
- AWS CLI con una cuenta root o con permisos para operar sobre Beanstalk
- Rol de servicio para EC2, que cuente con permisos para operar sobre Beanstalk.

---------------

El modulo se divide en 5 archivos encargados de la descripcion del entorno de Beanstalk, sus variables, configuraciones y caracteristicas del proveedor cloud, en este caso AWS.

- main.tf
- vars.tf
- terraform.tfvars
- output.tf
- provider.tf

Adicionalmente se incluye un archivos 'app.zip' que contiene un proyecto inicializado de Django para ser cargado en el ambiente posterior a su despliegue para validar el funcionamiento de este.

----------

## Variables

Dentro del archivo main, se referencian variables empleadas para la construccion del entorno, estas son declaras en el archivo vars y sus valores son inicializados en terraform.tfvars, por lo tanto su modificicion se realizar en este ultimo a continuacion se describe cada una de las variables:

- bice_name_application: Corresponde al nombre que poseera la aplicacion a desplegar dentro del entorno.
- bice_environment: Nombre del environment de Beanstalk a generar.
- bice_solution_stack_name: Corresponde a la AMI, junto con la herramienta que se cargara a la EC2 encargada de albergar el entorno.
- bice_vpc_id: ID del VPC de AWS que se utilizara para manejar el trafico
- bice_public_subnets: ID de las subnets asociadas al VPC que se utilizara para trafico publico
- instance_type: El tipo de instancia a utilizar por la EC2.

**Nota:** Dentro del archivo main, se define el rol del servicio utilizado para la generacion del entorno, este tiene por valor 'aws-elasticbeanstalk-ec2-role', en caso de no ser asi en la cuenta AWS utilizada, es necesario cambiar el nombre del rol.

--------

## Outputs

- beanstalkID: ID asociado al entorno generado de Beanstalk
- CNAME: Hostname asociado al load balancer del entorno, con el se puede acceder al contenido del entorno

**Nota**: Para probar el proyecto de django, debe modificarse el archivo settings.py agregando el CNAME dentro de la lista de ALLOWED_HOST y cargar el zip modificado desde la consola de beanstalk al entorno



