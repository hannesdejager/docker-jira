FROM ubuntu:16.04
MAINTAINER Hannes de Jager <hannes.de.jager@gmail.com>

ENV JIRA_VERSION software-7.3.3 

RUN apt-get -y update && apt-get install -y wget

# Download an run JIRA installer            
RUN wget -q https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-${JIRA_VERSION}-x64.bin && \
    chmod +x atlassian-jira-${JIRA_VERSION}-x64.bin && \
    printf "o\n2\n\n\n1\nn\ni\nn\n" | ./atlassian-jira-${JIRA_VERSION}-x64.bin && \
    rm atlassian-jira-${JIRA_VERSION}-x64.bin

# Set volume mount points for installation and home directory. Changes to the
# home directory needs to be persisted as well as parts of the installation
# directory due to eg. logs. These directories are the JIRA defaults
VOLUME ["/opt/atlassian/jira/", "/var/atlassian/application-data/jira/"]

# Set the default working directory as the installation directory.
WORKDIR /opt/atlassian/jira/

# Default JIRA HTTP port is 8080
EXPOSE 8080

# User that the installer created
USER jira

# Run JIRA in the foreground
CMD /opt/atlassian/jira/bin/start-jira.sh -fg

