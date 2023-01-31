# How to reproduce the issue

1. Deploy the project on a new environment (for example `demo`), by doing
```
amplify init
amplify push
```

2. Commit local changes
```
git add .
git commit -m "testing new env"
```

2. Edit `run.sh` and adjust the top 4 variables (if needed).

3. Reset amplify folder
```
rm -rf amplify
git checkout amplify
```

4. Re-init the project using the `run.sh` script
```
./run.sh
```

At this stage, the file `amplify/backend/types/amplify-dependent-resources-ref.d.ts` lost the category "storage"

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