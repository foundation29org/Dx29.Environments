<div style="margin-bottom: 1%; padding-bottom: 2%;">
	<img align="right" width="100px" src="https://dx29.ai/assets/img/logo-Dx29.png">
</div>

Dx29 Environments
==============================================================================================================================================
### **Overview**

To create and configure the different environments, a list of scripts has been implemented in this project. In it you can find the different steps necessary to deploy from scratch each of the environments, and also how to add the file with the values or secret keys required by the different components of the application in a secure way.

In general, these scripts contain the kubectl commands necessary for the deployment of the environment and the association of the components included in it. So, for each of environment, these are the steps that will be followed:

- Create new [resource group](https://docs.microsoft.com/en-GB/azure/azure-resource-manager/management/manage-resource-groups-portal) for the environment
- Create an AKS using [Azure CLI](https://docs.microsoft.com/en-us/azure/aks/kubernetes-walkthrough)
>- Resource Group with resource_group_name
>- Name cluster: cluster_name
>- Node size: Choose from this [list](https://docs.microsoft.com/en-GB/azure/virtual-machines/sizes), taking into account costs:
>>- [Windows](https://azure.microsoft.com/en-gb/pricing/details/virtual-machines/windows/#Windows)
>>- [Linux](https://azure.microsoft.com/en-gb/pricing/details/virtual-machines/linux/#Linux)
- Create new Azure container registry using [Azure CLI](https://docs.microsoft.com/en-GB/azure/container-registry/container-registry-get-started-azure-cli)
>- Resource Group with resource_group_name
>- Name container registry: acr_name
>- SKU: Basic
- Using Scripts of this project for configure the environment.

It is used in the [Dx29 application](https://dx29.ai/) and therefore how to integrate it is described in the [Dx29 architecture guide](https://dx29-v2.readthedocs.io/en/latest/index.html).

<p>&nbsp;</p>

### **Getting Started**

####  1. Configuration: Pre-requisites

This project doesn’t need any dependency but it configure the cluster and the container registry for a environment. As in the case of Dx29 there will be microservices that require secret keys, in order to run it the file appsettings.secrets.json must be added to the secrets folder with the following information:

|  Key                 | Value               |		                                                                                |
|----------------------|---------------------|--------------------------------------------------------------------------------------|
| Application          | Host                |URL of the application                                                                |
| ConnectionStrings    | IdentityConnection  |SQL database endpoint and credentials                                                 |
| ConnectionStrings    | BlobStorage         |Blob endpoint and credentials                                                         |
| ConnectionStrings    | OpenDataBlobStorage |OpenDx29 blob endpoint and credentials                                                |
| ServiceBus           | ConnectionString    |Connection string service bus                                                         |
| ServiceBus           | QueueName           |Queue configured name                                                                 |
| SignalR              | ConnectionString    |SignalR connection string & credentials                                               |
| SignalR              | HubName             |SignalR Hub HubName                                                                   |
| AppInsights          | Key                 |Secret key for connecting with AppInsights                                            |
| Account              | Key                 |Secret from SQL database (encrypt)                                                    |
| Account              | Inx                 |Secret from SQL database (encrypt)                                                    |
| Records              | Key                 |Secret from SQL database (encrypt)                                                    |
| Records              | Inx                 |Secret from SQL database (encrypt)                                                    |
| SendGrid             | APIKey              |Secret Key for connect SendGrid                                                       |
| CaseRecords          | AppName             |Appplication name                                                                     |
| CaseRecords          | DatabaseName        |Database Name where case records are saved                                            |
| CaseRecords          | ConnectionString    |Connection string to case records database                                            |
| MedicalCase          | AppName             |Appplication name                                                                     |
| MedicalCase          | DatabaseName        |Database Name where medical cases are saved                                           |
| MedicalCase          | ConnectionString    |Connection string to medical cases database                                           |
| ResourceGroups       | AppName             |Appplication name                                                                     |
| ResourceGroups       | DatabaseName        |Database Name where resource groups are saved                                         |
| ResourceGroups       | ConnectionString    |Connection string to resource groups database                                         |
| CognitiveServices    | Endpoint            |Endpoint Azure cognitive service configured                                           |
| CognitiveServices    | Authorization       |Authorization key                                                                     |
| CognitiveServices    | Region              |Azure cognitive service region configured                                             |
| TAHAnnotation        | Endpoint            |Endpoint Azure cognitive service configured  for Text Analytics                       |
| TAHAnnotation        | Path                |text/analytics/v3.1/entities/health/jobs                                              |
| TAHAnnotation        | Authorization       |Authorization key                                                                     |
| TAHAnnotation        | BlackList           |User ids in black list                                                                |
| IdentityServer       | Clients             |"Dx29.Web.UI": {"Profile": "IdentityServerSPA"}                                       |
| IdentityServer       | Key                 |"Key": {"Type": "File","FilePath": Path certificate,"Password": Password certificate} |


<p>&nbsp;</p>

####  2. Download and installation

Download the repository code with `git clone` or use download button.

We use [Visual Studio 2019](https://visualstudio.microsoft.com/downloads/) for working with this project.

You need to have installed:
>- [kubectl](https://kubernetes.io/docs/tasks/tools/)
>- [helm](https://helm.sh/docs/intro/install/)


<p>&nbsp;</p>

### **Contribute**

Please refer to each project's style and contribution guidelines for submitting patches and additions. 

In general, we follow the "fork-and-pull" Git workflow.

>1. Fork the repo on GitHub
>2. Clone the project to your own machine
>3. Commit changes to your own branch
>4. Push your work back up to your fork
>5. Submit a Pull request so that we can review your changes

The project is licenced under the **(TODO: LICENCE & LINK & Brief explanation)**

<p>&nbsp;</p>
<p>&nbsp;</p>

<div style="border-top: 1px solid !important;
	padding-top: 1% !important;
    padding-right: 1% !important;
    padding-bottom: 0.1% !important;">
	<div align="right">
		<img width="150px" src="https://dx29.ai/assets/img/logo-foundation-twentynine-footer.png">
	</div>
	<div align="right" style="padding-top: 0.5% !important">
		<p align="right">	
			Copyright © 2020
			<a style="color:#009DA0" href="https://www.foundation29.org/" target="_blank"> Foundation29</a>
		</p>
	</div>
<div>