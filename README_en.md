# Notihub CustomSenderPlugin Example

This is an example of a plugin that is executed whenever a notification is raised in notihub. The purpose of this code is to pass the content of the notification to a webhook. The detailed course of action is as follows

- Parsing the notification message and changing it to JSON(`parsed_example.json`)
- Change it to the form required by your webhook (`example_output.json`)
- Calling the webhook(`localhost:9080/webhook`)

Here's how to use the plugin

- Copy `CustomSenderPlug.x` to `/data/whatap/plugin`, Both the path and name of the file should not be changed.
- If the file `/data/whatap/logs/notihub.log` says `[WA133] CustomSenderPlug loaded` and there are no other error logs, then it loaded successfully.
- Build and run the webhook server
  - (from the mockserver directory) go build
  - nohup ./mockserver &

The mockserver will listen for webhooks and return the body as sent by the plugin. If the webhook is successful, you can see the following logs in `/data/whatap/logs/plugin.log`.

```txt
[2024-04-22 01:08:47,754 GMT] HTTP Response Code: 200
[2024-04-22 01:08:47,754 GMT] HTTP Response Body: {"ProfileFullName": ".Whatap","Status": "ACTIVE","Impact": "Warning","Owner": ".Whatap APM","ServiceCategory": "INFORMATION TECHNOLOGY","Category": "Whatap","Service": "Technology Infrastructure & Platform","CustomerLocation": "HEAD OFFICE","Subject": "[Warning][INFRA][alert-test][bspark-dev][Memory Used > 1 %]","Source": "alert-test","ProfileLink_RecID": "6D141BE2B3F64EE0BC369F72D752CC77","OwnerTeam": "Service Desk","Subcategory": "SMS","ProfileLink_Category": "Employee","Urgency": "Warning","Symptom": "Memory Used > 1 %"}
```

If you want to modify the plugin, keep in mind the following
- You must use the package full path instead of the import statement.
- You can't declare classes or methods inside the code.
- There is a bug that you can't use generics. Collections such as HashMap should be used in java 1.4 style.
