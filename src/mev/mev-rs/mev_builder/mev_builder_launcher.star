# MEV Builder flags

MEV_BUILDER_CONFIG_FILENAME = "config.toml"
MEV_BUILDER_MOUNT_DIRPATH_ON_SERVICE = "/config"
MEV_BUILDER_FILES_ARTIFACT_NAME = "mev-rs-mev-builder-config"
MEV_FILE_PATH_ON_CONTAINER = MEV_BUILDER_MOUNT_DIRPATH_ON_SERVICE + MEV_BUILDER_CONFIG_FILENAME


def new_builder_config(
    plan,
    service_name,
    network,
    relay_ip_address,
    relay_port,
    el_cl_genesis_data,
    jwt_file,
    fee_recipient,
    mnemonic,
    extra_data,
    global_node_selectors,
):
    builder_template_data = new_builder_config_template_data(
        network,
        relay_ip_address,
        relay_port,
        constants.DEFAULT_MEV_PUBKEY,
        constants.DEFAULT_MEV_SECRET_KEY,
        mnemonic,
        fee_recipient,
        extra_data,
    )
    mev_rs_builder_config_template = read_file(
        static_files.MEV_RS_MEV_BUILDER_CONFIG_FILEPATH
    )

    template_and_data = shared_utils.new_template_and_data(
        mev_rs_builder_config_template, builder_template_data
    )

    template_and_data_by_rel_dest_filepath = {}
    template_and_data_by_rel_dest_filepath[
        MEV_BUILDER_CONFIG_FILENAME
    ] = template_and_data

    config_files_artifact_name = plan.render_templates(
        template_and_data_by_rel_dest_filepath, MEV_BUILDER_FILES_ARTIFACT_NAME
    )

    config_file_path = shared_utils.path_join(
        MEV_BUILDER_MOUNT_DIRPATH_ON_SERVICE, MEV_BUILDER_CONFIG_FILENAME
    )


    return config_files_artifact_name


def new_builder_config_template_data(
    network, relay_ip_address, relay_port, pubkey, secret, mnemonic, fee_recipient, extra_data
):
    return {
        "Network": network,
        "RelayIP": relay_ip_address,
        "RelayPort": relay_port,
        "PublicKey": pubkey,
        "SecretKey": secret,
        "Mnemonic": mnemonic,
        "FeeRecipient": fee_recipient,
        "ExtraData": extra_data,
    }
