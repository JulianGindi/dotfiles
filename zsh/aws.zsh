alias assume-role='function(){eval $(command assume-role $@);}'

function clear-aws() {
  echo "Clearing AWS environment variables"
  unset AWS_ACCESS_KEY_ID && \
  unset AWS_SECRET_ACCESS_KEY && \
  unset AWS_SESSION_TOKEN && \
  unset AWS_SECURITY_TOKEN
}
