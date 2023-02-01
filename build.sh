#!/bin/bash

# output some version numbers:
cat /etc/issue
asciidoctor -V
echo -------------
echo Some Netlify environment variables you might want to know:
echo BASE_URL is $BASE_URL
echo BUILD_ID is $BUILD_ID
echo CONTEXT is $CONTEXT
echo DEPLOY_PRIME_URL is $DEPLOY_PRIME_URL
echo URL is $URL
echo DEPLOY_URL is $DEPLOY_URL
echo REPOSITORY_URL is $REPOSITORY_URL
echo BRANCH is $BRANCH
echo COMMIT_REF is $COMMIT_REF
echo -------------
bundle env

# the main call to Hugo, passing it all parameters from the command-line:
echo Running Hugo with arguments: "$@"
hugo "$@"
hugoReturnCode=$?

# now the other steps in the pipeline, currently it's just htmltest, which doesn't count for the Result code
# (it can fail or not, but it's the Hugo result code that gets signalled to Netlify in the exit)
if [ $hugoReturnCode -ne 0 ]
then
   echo "Hugo failed with return code "$hugoReturnCode"!!! ------------------------------------ !!!"
fi

exit $hugoReturnCode