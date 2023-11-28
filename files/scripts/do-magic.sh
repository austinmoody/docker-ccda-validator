echo "Make directories to make sure they are there..."
mkdir -p /etc/ccda/files/validator_configuration/vocabulary/valueset_repository/VSAC
mkdir -p /etc/ccda/files/validator_configuration/vocabulary/code_repository
mkdir -p /etc/ccda/files/validator_configuration/scenarios_directory
mkdir -p /usr/local/tomcat/conf/Catalina/localhost

echo "Copying validator-api xlsx's..."
cp /etc/submodules/code-validator-api/codevalidator-api/docs/ValueSetsHandCreatedbySITE/*.xlsx /etc/ccda/files/validator_configuration/vocabulary/valueset_repository/VSAC/

echo "Copying config_extras..."
cp -f /etc/ccda/files/config_extra/web.xml /usr/local/tomcat/conf
cp -f /etc/ccda/files/config_extra/referenceccdaservice.xml /usr/local/tomcat/conf/Catalina/localhost/referenceccdaservice.xml

echo "Done!"