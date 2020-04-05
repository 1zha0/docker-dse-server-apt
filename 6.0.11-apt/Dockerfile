# DSE 6.0.11 with daily `apt-get update & upgrade`

FROM datastax/dse-server:6.0.11

# This build runs `apt-get update` against official DataStax DSE server,
# to mitigate any known vulnerabilities due to gaps caused by
# offical image release cycle.

# Install required packages
RUN set -eux \
    && apt-get update \
    && apt-get upgrade -y \
    && rm -rf /var/lib/{apt,dpkg,cache,log}

USER dse

# EOF
