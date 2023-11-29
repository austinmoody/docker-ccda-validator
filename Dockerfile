FROM tomcat:8.5.96-jdk8-temurin-jammy

ADD "./webapps" "/usr/local/tomcat/webapps"
ADD "./submodules/reference-ccda-validator" "/etc/submodules/reference-ccda-validator"
ADD "./submodules/code-validator-api" "/etc/submodules/code-validator-api"
ADD "./files" "/etc/ccda/files"

# Do the magic
RUN /etc/ccda/files/scripts/do-magic.sh
