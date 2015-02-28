# docker-jira
A minimal docker image of Atlassian JIRA

## Usage

Run Postgres:


    docker run --name jira-postgres -v /var/jira/db:/var/lib/postgresql/data -e POSTGRES_USER=jira -e POSTGRES_PASSWORD=yourpassword -d postgres


Run JIRA:


    docker run --name jira -d -p 8080:8080 --link jira-postgres:db hdejager/atlassian-jira


Navigate to `http://localhost:8080` and select Postgres as database with hostname `db` during the JIRA wizard.