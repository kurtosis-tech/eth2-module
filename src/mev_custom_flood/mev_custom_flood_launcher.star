PYTHON_IMAGE = "python:3.11-alpine"
CUSTOM_FLOOD_SREVICE_NAME = "mev-custom-flood"

def spam_in_background(plan, sender_key, receiver_key):
    sender_script  = plan.upload_files("github.com/kurtosis-tech/eth2-package/src/mev_custom_flood/sender.py")

    plan.add_service(
        name = CUSTOM_FLOOD_SREVICE_NAME,
        config = ServiceConfig(
            image = PYTHON_IMAGE,
            files = {
                "/tmp": sender_script
            },
            cmd = ["tail", "-f", "/dev/null"],
            env_vars = {
                "SENDER_PRIVATE_KEY": sender_key,
                "RECEIVER_PUBLIC_KEY": receiver_key,
            }
        )
    )

    plan.exec(
        service_name = CUSTOM_FLOOD_SREVICE_NAME,
        recipe = ExecRecipe(["pip", "install", "web3"])
    )

    plan.exec(
        service_name = CUSTOM_FLOOD_SREVICE_NAME,
        # recipe = ExecRecipe(["/bin/sh", "-c", "nohup python /tmp/sender.py > /dev/null 2>&1 &"])
        recipe = ExecRecipe(["python", "/tmp/sender.py"])
    )