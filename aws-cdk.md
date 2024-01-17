How to deploy application aws-cdk using type script?
====================================================
#### Step1. Create a folde with application name.

#### Step2. cd folder

#### Step3. To initiate the language run command 
```cmd: cdk init app --language=typescript ```

goto /lib/myfirst-app-stack.ts and uncomment few line

#### Step4. To install required packages using npm i command
ex: ```npm i @aws-cdk-lib/aws-sqs```

#### Step5: first we neexd to build app using cdk just like tf init  # to build app run below command 
cmd: ```npm run build```

#### Step6: Now deploy / create sqs using cdk by running command
cmd: ```cdk deploy ```


lib/myfist-app-stack.ts files coantains constructs configuration
bin/myfirst-app.ts file conatins all details about app

