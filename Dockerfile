# Build SPA and PWA
FROM node:14.15 as build-stage
WORKDIR /source
COPY . .
RUN apt-get install gcc g++
RUN echo $(uname -r)

ENV SKIP_SASS_BINARY_DOWNLOAD_FOR_CI=true
ENV CC="gcc"
ENV CXX="g++"
ENV LINK="gcc"
ENV LINKXX="g++"
RUN npm install --unsafe-perm

# Now the artifacts are in /source/vendor
# We don't run this image. We only need the artifact