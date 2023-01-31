#!/bin/bash

APP_ID="???" # from team-provider-info.json > your env > awscloudformation > AmplifyAppId
PROFILE_NAME="???" # the AWS profile name you're using to access your AWS account
PROJECT_NAME="amplify-test" # change it if use a different project name
ENV_NAME="demo" # change it if use a different Amplify environment name

AWSCLOUDFORMATIONCONFIG="{\
\"configLevel\":\"project\",\
\"useProfile\":true,\
\"profileName\":\"$PROFILE_NAME\"\
}" \
AMPLIFY="{\
\"projectName\":\"$PROJECT_NAME\",\
\"appId\":\"$APP_ID\",\
\"envName\":\"$ENV_NAME\",\
\"defaultEditor\":\"code\"\
}" \
FRONTEND="{\
\"frontend\":\"ios\"\
}" \
PROVIDERS="{\
\"awscloudformation\":$AWSCLOUDFORMATIONCONFIG\
}" \

amplify init --amplify $AMPLIFY --frontend $FRONTEND --providers $PROVIDERS