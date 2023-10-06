# The path on the module container where static files are housed
STATIC_FILES_DIRPATH = "/static_files"

# Validator ranges config
VALIDATOR_RANGES_CONFIG_FILENAME = (
	STATIC_FILES_DIRPATH + "/genesis-generation-config/ranges-config.yaml.tmpl"
)

# CL Forkmon config
CL_FORKMON_CONFIG_TEMPLATE_FILEPATH = (
    STATIC_FILES_DIRPATH + "/cl-forkmon-config/config.toml.tmpl"
)

# EL Forkmon config
EL_FORKMON_CONFIG_TEMPLATE_FILEPATH = (
    STATIC_FILES_DIRPATH + "/el-forkmon-config/config.toml.tmpl"
)

# Prometheus config
PROMETHEUS_CONFIG_TEMPLATE_FILEPATH = (
    STATIC_FILES_DIRPATH + "/prometheus-config/prometheus.yml.tmpl"
)

# Beacon Metrics Gazer config
BEACON_METRICS_GAZER_CONFIG_TEMPLATE_FILEPATH = (
    STATIC_FILES_DIRPATH + "/beacon-metrics-gazer-config/config.yaml.tmpl"
)

DORA_CONFIG_TEMPLATE_FILEPATH = STATIC_FILES_DIRPATH + "/dora-config/config.yaml.tmpl"

FULL_BEACONCHAIN_CONFIG_TEMPLATE_FILEPATH = (
    STATIC_FILES_DIRPATH + "/full-beaconchain-config/config.yaml.tmpl"
)

# Grafana config
GRAFANA_CONFIG_DIRPATH = "/grafana-config"
GRAFANA_DATASOURCE_CONFIG_TEMPLATE_FILEPATH = (
    STATIC_FILES_DIRPATH + GRAFANA_CONFIG_DIRPATH + "/templates/datasource.yml.tmpl"
)
GRAFANA_DASHBOARD_PROVIDERS_CONFIG_TEMPLATE_FILEPATH = (
    STATIC_FILES_DIRPATH
    + GRAFANA_CONFIG_DIRPATH
    + "/templates/dashboard-providers.yml.tmpl"
)
GRAFANA_DASHBOARDS_CONFIG_DIRPATH = (
    STATIC_FILES_DIRPATH + GRAFANA_CONFIG_DIRPATH + "/dashboards"
)
