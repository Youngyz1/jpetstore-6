#
#    Copyright 2010-2023 the original author or authors.
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#       https://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
#

# Use a newer version of Tomcat and Java 17 (Temurin is well-patched)
FROM tomcat:9.0-jre17-temurin

# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file (Built by Jenkins) into Tomcat
# Ensure this path matches where your Maven build puts the WAR
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]

