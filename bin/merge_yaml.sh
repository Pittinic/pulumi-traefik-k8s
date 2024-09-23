#!/bin/sh

yaml_root_folder="src"

merge_yaml() {
  function print_usage() {
    echo ""
    echo "Usage: merge_yaml [--env <env>] [--debug]"
    echo "  Retrieve and merge yaml files from both the base folder and {env}"
    echo "  folder (default: dev), no matter the depth, using yq."
    echo "eg."
    echo "  merge_yaml --env prd"
    echo "translates into"
    echo "  yq ea '. as \$item ireduce ({}; . * \$item )'" \
         "${yaml_root_folder}/base/app1/deployments/xxx.yaml" \
         "${yaml_root_folder}/base/app2/service.yaml" \
         "${yaml_root_folder}/base/values.yaml" \
         "${yaml_root_folder}/prd/values.yaml" \
         "Pulumi.yaml"
    echo ""
  }
  
  local env='dev'
  local debug='false'
  
  for arg; do
    case "$1" in
      "--help") print_usage && exit 0;;
      "--env") env="$2"; shift;;
      "--debug") debug='true';;
      *) echo "unexpected argument(s): '$@'"; exit 400;;
    esac
  done
  
  local base_files=$(
    2>/dev/null find "${yaml_root_folder}/base" \
      \( -name '*.yaml' -o -name '*.yml' \) |
    tr '\n' ' ' |
    sed 's/ $//'
  )

  local env_files=$(
    2>/dev/null find "${yaml_root_folder}/${env}" \
      \( -name '*.yaml' -o -name '*.yml' \) |
    tr '\n' ' ' |
    sed 's/ $//'
  )
    
  local dir="tmp-$(date +%Y%m%d-%H%M%S)"
  mkdir -p "${dir}"
  echo "${base_files}" "${env_files}" | tr ' ' '\n' > "${dir}"/selected_files.txt
  
  yq ea '. as $item ireduce ({}; . * $item )' \
    Pulumi.yaml ${base_files} ${env_files} | tee "${dir}"/merged.yaml    

  [ "$debug" = "true" ] || rm -r "${dir}"
}

merge_yaml "$@"
