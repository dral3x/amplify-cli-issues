# How to reproduce the issue

Run 
```bash
export APP_ID="???"
export PROFILE_NAME="???"
export PROJECT_NAME="???"
export ENV_NAME="???"

export AWSCLOUDFORMATIONCONFIG="{\
\"configLevel\":\"project\",\
\"useProfile\":true,\
\"profileName\":\"$PROFILE_NAME\"\
}" \
export AMPLIFY="{\
\"projectName\":\"$PROJECT_NAME\",\
\"appId\":\"$APP_ID\",\
\"envName\":\"$ENV_NAME\",\
\"defaultEditor\":\"code\"\
}" \
export FRONTEND="{\
\"frontend\":\"ios\"\
}" \
export PROVIDERS="{\
\"awscloudformation\":$AWSCLOUDFORMATIONCONFIG\
}" \

amplify init --amplify $AMPLIFY --frontend $FRONTEND --providers $PROVIDERS
```

After that completes successfully, the file `amplify/backend/types/amplify-dependent-resources-ref.d.ts` will be changed, loosing the category "storage"

```diff
diff --git a/amplify/backend/types/amplify-dependent-resources-ref.d.ts b/amplify/backend/types/amplify-dependent-resources-ref.d.ts
index a7d1bce..7e3a194 100644
--- a/amplify/backend/types/amplify-dependent-resources-ref.d.ts
+++ b/amplify/backend/types/amplify-dependent-resources-ref.d.ts
@@ -16,11 +16,5 @@ export type AmplifyDependentResourcesAttributes = {
       "UserPoolId": "string",
       "UserPoolName": "string"
     }
-  },
-  "storage": {
-    "demo": {
-      "BucketName": "string",
-      "Region": "string"
-    }
   }
 }
\ No newline at end of file

```