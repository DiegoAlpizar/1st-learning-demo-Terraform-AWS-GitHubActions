FROM		hashicorp/terraform:1.7

			# `tar --posix` needed by GitHub actions/cache
RUN			apk add --no-cache --update-cache  tar

ENTRYPOINT	[ "terraform" ]
