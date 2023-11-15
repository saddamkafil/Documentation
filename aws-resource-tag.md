Automatically Tagging AWS Resources with Usernames: A Brief Automation Guide
TechStoryLines
TechStoryLines

·
Follow

3 min read
·
Jul 27
209






Introduction
Hello and welcome back to our page! In this blog, we’ve successfully tackled a common challenge faced by many organizations — the issue of effectively managing resources in their AWS accounts. Over time, these resources tend to accumulate, and it becomes challenging to determine which ones are still necessary. When we finally realize the magnitude of the resources and the need to evaluate their relevance, it requires bringing in the account owner for a manual review and potential deletion of unnecessary items.

The described task of manually tracking down resources and their creators in AWS can indeed be time-consuming and challenging, especially when relying on limited CloudTrail logs that expire after 90 days.

Considering the discussion, we have created a solution that automatically associates the resource with the IAM username retrieved from CloudTrail. By implementing this, you can easily examine the tags, identify the creator of the resource, and promptly contact them to request immediate cleanup if necessary.

Architecture Diagram

Now, let’s delve into the architecture of the solution. At the moment, the solution is designed to tag Lambda functions and EC2 instances. However, you can customize it to suit your specific needs using the EventBridge event pattern. The process begins when a Lambda function or EC2 instance is created, and this action is recorded by AWS Config.

We will set up an EventBridge rule that listens for events from AWS Config as its source. When AWS Config detects a new resource creation, it triggers a Lambda function.

The Lambda function then accesses CloudTrail to retrieve the IAM username associated with the action. With the IAM username in hand, the Lambda function proceeds to tag the resource itself. The tags added to the resource will include a “key” with the label “Created_by” and a corresponding “value” that contains the IAM username fetched from CloudTrail.

By following this architecture, every time a Lambda function or EC2 instance is created, it will automatically be tagged with the IAM username of the creator, making it easier to track and manage resources. If needed, you can modify the EventBridge event pattern to include other resource types and introduce additional code to the Lambda function.

Procedure
Step-1: Create a Eventbridge rule
The initial step involves creating an EventBridge rule with a customized rule pattern as demonstrated below. Modify the “resourceType” parameter to include the specific resources to which you wish to apply tags.

Here is the event pattern to add.

{
  "detail": {
    "configurationItem": {
      "configurationItemStatus": ["ResourceDiscovered"],
      "resourceType": ["AWS::Lambda::function","AWS::EC2::Instance"]
    },
    "messageType": ["ConfigurationItemChangeNotification"]
  },
  "detail-type": ["Config Configuration Item Change"],
  "source": ["aws.config"]
}
Step-2: Create a Lambda
Afterward, proceed to create a Lambda function and incorporate the following Python code. Make sure to grant the necessary permissions to the Lambda function to read CloudTrail logs and also permission to tag Lambda and EC2 resources.

```
import json
import boto3
def lambda_handler(event, context): 
    client = boto3.client('cloudtrail')
    
    resource_type = event["detail"]["configurationItem"]["resourceType"]
    resource_arn = event["resources"][0]
    
    if resource_type == "AWS::Lambda::Function":
        resource_name = event["detail"]["configurationItem"]["configuration"]["functionName"]
        
        response = client.lookup_events(
        LookupAttributes=[
            {
                'AttributeKey': 'ResourceName',
                'AttributeValue': resource_name
            },
        ],
        )
        user_name=response["Events"][0]["Username"]
        
        client = boto3.client('lambda')
        
        client.tag_resource(
            Resource=resource_arn,
            Tags={'Created_by': user_name}
            )
        print("Lambda function "+resource_name+" tagged with username = " + user_name)
    
    elif resource_type == "AWS::EC2::Instance":
        resource_name = event["detail"]["configurationItem"]["configuration"]["instanceId"]
        print(resource_name)
       
        
        response = client.lookup_events(
        LookupAttributes=[
            {
                'AttributeKey': 'ResourceName',
                'AttributeValue': resource_name
            },
        ],
        )
        user_name=response["Events"][0]["Username"]
        
        client = boto3.client('ec2')
        client.create_tags(
            Resources=[ resource_name ],
            Tags=[
                {
                    'Key': 'Created_by',
                    'Value': user_name
                },
            ])
        print("EC2 Instance "+resource_name+" tagged with username = " + user_name)
```
That’s It!
Congratulations! With the implementation of this solution, you now have enhanced control over your resources. The automated tagging process ensures that tags are automatically added whenever a new Lambda function or EC2 instance is created in your account. This level of tagging provides you with improved oversight and organization of resources throughout the entire account, leading to better visibility and exposure of the required resources when needed.
