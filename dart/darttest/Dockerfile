FROM dart:stable as builder
WORKDIR /app

COPY pubspec.* ./
RUN dart pub get

COPY . .
RUN dart pub get --offline
RUN dart compile exe bin/darttest.dart -o bin/darttest

FROM scratch
COPY --from=builder /runtime/ /
COPY --from=builder /app/bin/darttest /app/bin/

CMD ["/app/bin/darttest"]