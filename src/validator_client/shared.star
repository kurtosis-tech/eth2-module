shared_utils = import_module("../shared_utils/shared_utils.star")

PRIVATE_IP_ADDRESS_PLACEHOLDER = "KURTOSIS_IP_ADDR_PLACEHOLDER"
VALIDATOR_CLIENT_KEYS_MOUNTPOINT = "/keystores"

VALIDATOR_HTTP_PORT_NUM = 5056
VALIDATOR_HTTP_PORT_ID = "http"

VALIDATOR_CLIENT_METRICS_PORT_NUM = 8080
VALIDATOR_CLIENT_METRICS_PORT_ID = "metrics"
METRICS_PATH = "/metrics"

VALIDATOR_CLIENT_USED_PORTS = {
    VALIDATOR_HTTP_PORT_ID: shared_utils.new_port_spec(
        VALIDATOR_HTTP_PORT_NUM,
        shared_utils.TCP_PROTOCOL,
        shared_utils.HTTP_APPLICATION_PROTOCOL,
    ),
    VALIDATOR_CLIENT_METRICS_PORT_ID: shared_utils.new_port_spec(
        VALIDATOR_CLIENT_METRICS_PORT_NUM,
        shared_utils.TCP_PROTOCOL,
        shared_utils.HTTP_APPLICATION_PROTOCOL,
    ),
}
