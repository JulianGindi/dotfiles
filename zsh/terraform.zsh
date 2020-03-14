export PATH="/usr/local/opt/terraform@0.11/bin:$PATH"


TERRAGRUNT_V1_VERSION='1-0.11.13'
TERRAGRUNT_V2_VERSION='2-0.11.14'

alias terragrunt-ads-v1='docker run -it --rm \
  -v ~/.aws:/root/.aws \
  -v ~/.ssh:/root/.ssh \
  -v ~/.kube:/root/.kube \
  -v "$(pwd):/terragrunt" \
  -v "${HOME}/Workspace:/modules" \
  -w /terragrunt \
  --volumes-from=ssh-agent \
  -e SSH_AUTH_SOCK="/.ssh-agent/socket" \
  -e AWS_PROFILE=gumgum-ads \
  -e AWS_SDK_LOAD_CONFIG=1 \
  gumgum-docker.jfrog.io/gumref-terragrunt-${TERRAGRUNT_V1_VERSION}'

alias terragrunt-ads='docker run -it --rm \
  -v ~/.aws:/root/.aws \
  -v ~/.ssh:/root/.ssh \
  -v ~/.kube:/root/.kube \
  -v "$(pwd):/terragrunt" \
  -v "${HOME}/Workspace:/modules" \
  -w /terragrunt \
  --volumes-from=ssh-agent \
  -e SSH_AUTH_SOCK="/.ssh-agent/socket" \
  -e AWS_PROFILE=gumgum-ads \
  -e AWS_SDK_LOAD_CONFIG=1 \
  gumgum-docker.jfrog.io/gumref-terragrunt-${TERRAGRUNT_V2_VERSION}'

alias terragrunt-sandbox-v1='docker run -it --rm \
  -v ~/.aws:/root/.aws \
  -v ~/.ssh:/root/.ssh \
  -v ~/.kube:/root/.kube \
  -v "$(pwd):/terragrunt" \
  -v "${HOME}/Workspace:/modules" \
  -w /terragrunt \
  --volumes-from=ssh-agent \
  -e SSH_AUTH_SOCK="/.ssh-agent/socket" \
  -e AWS_PROFILE=sandbox \
  -e AWS_SDK_LOAD_CONFIG=1 \
  gumgum-docker.jfrog.io/gumref-terragrunt-${TERRAGRUNT_V1_VERSION}'

alias terragrunt-sandbox='docker run -it --rm \
  -v ~/.aws:/root/.aws \
  -v ~/.ssh:/root/.ssh \
  -v ~/.kube:/root/.kube \
  -v "$(pwd):/terragrunt" \
  -v "${HOME}/Workspace:/modules" \
  -w /terragrunt \
  --volumes-from=ssh-agent \
  -e SSH_AUTH_SOCK="/.ssh-agent/socket" \
  -e AWS_PROFILE=sandbox \
  -e AWS_SDK_LOAD_CONFIG=1 \
  gumgum-docker.jfrog.io/gumref-terragrunt-${TERRAGRUNT_V2_VERSION}'

alias terragrunt-ai-v1='docker run -it --rm \
  -v ~/.aws:/root/.aws \
  -v ~/.ssh:/root/.ssh \
  -v ~/.kube:/root/.kube \
  -v "$(pwd):/terragrunt" \
  -v "${HOME}/Workspace:/modules" \
  -w /terragrunt \
  --volumes-from=ssh-agent \
  -e SSH_AUTH_SOCK="/.ssh-agent/socket" \
  -e AWS_PROFILE=gumgum-ai \
  -e AWS_DEFAULT_PROFILE=gumgum-ai \
  -e AWS_SDK_LOAD_CONFIG=1 \
  gumgum-docker.jfrog.io/gumref-terragrunt-${TERRAGRUNT_V1_VERSION}'

alias terragrunt-ai='docker run -it --rm \
  -v ~/.aws:/root/.aws \
  -v ~/.ssh:/root/.ssh \
  -v ~/.kube:/root/.kube \
  -v "$(pwd):/terragrunt" \
  -v "${HOME}/Workspace:/modules" \
  -w /terragrunt \
  --volumes-from=ssh-agent \
  -e SSH_AUTH_SOCK="/.ssh-agent/socket" \
  -e AWS_PROFILE=gumgum-ai \
  -e AWS_DEFAULT_PROFILE=gumgum-ai \
  -e AWS_SDK_LOAD_CONFIG=1 \
  gumgum-docker.jfrog.io/gumref-terragrunt-${TERRAGRUNT_V2_VERSION}'

alias terragrunt-sports='docker run -it --rm \
  -v ~/.aws:/root/.aws \
  -v ~/.ssh:/root/.ssh \
  -v ~/.kube:/root/.kube \
  -v "$(pwd):/terragrunt" \
  -v "${HOME}/Workspace:/modules" \
  -w /terragrunt \
  --volumes-from=ssh-agent \
  -e SSH_AUTH_SOCK="/.ssh-agent/socket" \
  -e AWS_PROFILE=vi \
  -e AWS_DEFAULT_PROFILE=vi \
  -e AWS_SDK_LOAD_CONFIG=1 \
  gumgum-docker.jfrog.io/gumref-terragrunt-${TERRAGRUNT_V2_VERSION}'

