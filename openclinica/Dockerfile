FROM debian:stretch AS javabuild

RUN apt-get update && apt-get install -y \
	openjdk-8-jdk \
	git \
	maven \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /openclinica/build
RUN cd /openclinica/build && \
	git clone --branch 3.15 https://github.com/OpenClinica/OpenClinica.git openclinica
RUN cd /openclinica/build/openclinica && \
	mvn install -DskipTests

RUN mkdir -p /war
RUN cp /openclinica/build/openclinica/ws/target/OpenClinica-ws-*.war /war/
RUN cp /openclinica/build/openclinica/web/target/OpenClinica-web-*.war /war/

FROM tomcat:8 as runtime

COPY --from=javabuild /war /war
RUN cd /usr/local/tomcat/webapps && unzip -q -d OpenClinica /war/OpenClinica-web-*.war
RUN cd /usr/local/tomcat/webapps && unzip -q -d OpenClinica-ws /war/OpenClinica-ws-*.war

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]
