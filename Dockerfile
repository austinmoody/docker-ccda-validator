FROM tomcat:8.5.96-jdk8-temurin-jammy

# Make sure everything referenced in referenceccdaservice.xml is there
# vocabulary.localCodeRepositoryDir
RUN mkdir -p /etc/ccda/files/validator_configuration/vocabulary/code_repository
# vocabulary.localValueSetRepositoryDir
RUN mkdir -p /etc/ccda/files/validator_configuration/vocabulary/valueset_repository/VSAC
# referenceccda.configFolder
RUN mkdir -p /etc/ccda/files/configs_folder
# referenceccda.configFile
COPY files/configs_folder/ccdaReferenceValidatorConfig.xml /etc/ccda/files/configs_folder
# content.scenariosDir
RUN mkdir -p /etc/ccda/files/validator_configuration/scenarios_directory

# Copy validator api XLSX files
COPY submodules/code-validator-api/codevalidator-api/docs/ValueSetsHandCreatedbySITE/*.xlsx /etc/ccda/files/validator_configuration/vocabulary/valueset_repository/VSAC/

COPY files/config_extra/web.xml /usr/local/tomcat/conf/
COPY files/config_extra/referenceccdaservice.xml /usr/local/tomcat/conf/Catalina/localhost/referenceccdaservice.xml