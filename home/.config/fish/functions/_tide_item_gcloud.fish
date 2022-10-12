function _tide_item_gcloud
  if type -q gcloud
    set -l gcp_project_id (gcloud config get project 2>/dev/null)
    _tide_print_item gcloud $tide_gcloud_icon' ' "$gcp_project_id"
  end
end
