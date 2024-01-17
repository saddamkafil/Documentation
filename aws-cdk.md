## How to deploy application aws-cdk using type script?
====================================================
1. Create a folder with application name.

2. cd folder

3. To initiate the language run command 
```cmd: cdk init app --language=typescript ```

4. To install required packages using npm i command
```ex: npm i @aws-cdk-lib/aws-sqs```

5. Uncomment sqs block from lib/myfirst-app-stack.ts file 

_before and after uncomment file  lib/myfirst-app-stack.ts file looks like_
```sh
import * as cdk from 'aws-cdk-lib';
import { Construct } from 'constructs';
// import * as sqs from 'aws-cdk-lib/aws-sqs';

export class MyfirstAppStack extends cdk.Stack {
  constructor(scope: Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    // The code that defines your stack goes here

    // example resource
    // const queue = new sqs.Queue(this, 'MyfirstAppQueue', {
    //   visibilityTimeout: cdk.Duration.seconds(300)
    // });
  }
}
```
_after uncomment and changing adding name to the qsqs looks like_
``` sh
import * as cdk from 'aws-cdk-lib';
import { Construct } from 'constructs';
import * as sqs from 'aws-cdk-lib/aws-sqs';

export class MyfirstAppStack extends cdk.Stack {
  constructor(scope: Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    // The code that defines your stack goes here

    // example resource
    const queue = new sqs.Queue(this, 'MyfirstAppQueue', {
      visibilityTimeout: cdk.Duration.seconds(300)
    });
  }
}
```

5: first we need to build app using cdk just like tf init  # to build app run below command 
```cmd: npm run build```

 _The output should be something like this,_
```sh 
npm run build

> myfirst-app@0.1.0 build
> tsc
```

6: Now deploy / create sqs using cdk by running command
```cmd: cdk deploy ```

_output_
```
saddamshaik@JHFRHS3:/mnt/c/Users/Saddam.Shaik/Desktop/Workspace/my-learnings/aws-cdk/myfirst-app$ cdk deploy
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!!                                                                                                                      !!
!!  This software has not been tested with node v20.2.0.                                                                !!
!!  Should you encounter odd runtime issues, please try using one of the supported release before filing a bug report.  !!
!!                                                                                                                      !!
!!  This software is currently running on node v20.2.0.                                                                 !!
!!  As of the current release of this software, supported node releases are:                                            !!
!!  - ^18.0.0 (Planned end-of-life: 2025-04-30)                                                                         !!
!!                                                                                                                      !!
!!  This warning can be silenced by setting the JSII_SILENCE_WARNING_UNTESTED_NODE_VERSION environment variable.        !!
!!                                                                                                                      !!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

✨  Synthesis time: 72.91s

MyfirstAppStack:  start: Building 4e8ff23ae513f74b517eead1d5fd65cef7c1fad2ac9b130dd885609f1ea3d25a:current_account-current_region
MyfirstAppStack:  success: Built 4e8ff23ae513f74b517eead1d5fd65cef7c1fad2ac9b130dd885609f1ea3d25a:current_account-current_region
MyfirstAppStack:  start: Publishing 4e8ff23ae513f74b517eead1d5fd65cef7c1fad2ac9b130dd885609f1ea3d25a:current_account-current_region
MyfirstAppStack:  success: Published 4e8ff23ae513f74b517eead1d5fd65cef7c1fad2ac9b130dd885609f1ea3d25a:current_account-current_region
MyfirstAppStack: deploying... [1/1]
MyfirstAppStack: creating CloudFormation changeset...

 ✅  MyfirstAppStack

✨  Deployment time: 15.59s

Stack ARN:
arn:aws:cloudformation:ap-south-1:xxxxxxxxxxxxx:stack/MyfirstAppStack/679a37c0-b4e3-11ee-b42a-0663e47e477f

✨  Total time: 88.5s

```


### lib/myfist-app-stack.ts ---> files contains constructs configuration

### bin/myfirst-app.ts ---- >file contains all details about the app

### Command and step-by-step process

| Command | Description |
| ------- | ----------- |
|``cdk init app --language=typescript``  | Initiate project and language    |
|``npm i @aws-cdk-lib/aws-sqs``          | Install required packages        |
|``npm run build``                       | To create build on local machine |
|``cdk deploy``                          | To deploy application in AWS     |

