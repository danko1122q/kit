# dependents:
#  tests/highlight_regression.sh
#  tests/theme_regression.sh
#  scripts/try_input.sh
#  scripts/demo_themes.sh

ARG KIT_VERSION=0.25.0
ARG DEBIAN_IMAGE_VERSION=bookworm-slim

FROM debian:$DEBIAN_IMAGE_VERSION
ENV COLORTERM=truecolor
ENV KIT_CACHE_PATH=/kit/cache
ENV KIT_CONFIG_DIR=/kit/config
ARG KIT_VERSION
ADD https://github.com/sharkdp/kit/releases/download/v$KIT_VERSION/kit_${KIT_VERSION}_amd64.deb \
    /tmp/kit.deb
RUN dpkg --install /tmp/kit.deb
COPY ./tests/docker/kit-test-entrypoints  /tests/entrypoints
COPY ./syntaxes/cmd-help.sublime-syntax  $KIT_CONFIG_DIR/syntaxes/
RUN kit cache --build > /dev/null
ENTRYPOINT ["/tests/inner_highlight_regression.sh"]
