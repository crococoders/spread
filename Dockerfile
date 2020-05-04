# ================================
# Build image
# ================================
FROM vapor/swift:5.2 as build
ARG service_folder

WORKDIR /service
COPY Shared ./Shared
# First just resolve dependencies.
# This creates a cached layer that can be reused 
# as long as your Package.swift/Package.resolved
# files do not change.

WORKDIR ${service_folder}

COPY ${service_folder}/Package.* ./

RUN swift package resolve

# Copy entire repo into container
COPY ${service_folder} ./

# Compile with optimizations
RUN swift build \
	--build-path /build/.build \
	--enable-test-discovery \
	-c release \
	-Xswiftc -g

# ================================
# Run image
# ================================
FROM vapor/ubuntu:18.04
WORKDIR /run

# Copy build artifacts
COPY --from=build /build/.build/release /run
# Copy Swift runtime libraries
COPY --from=build /usr/lib/swift/ /usr/lib/swift/
# Uncomment the next line if you need to load resources from the `Public` directory
#COPY --from=build /build/Public /run/Public

ENTRYPOINT ["./Run"]
CMD ["serve", "--env", "production", "--hostname", "0.0.0.0"]