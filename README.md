# docker-jira
A minimal docker image of Atlassian JIRA

## Usage

Run Postgres:

```
    docker run --name jira-postgres -v /var/jira/db:/var/lib/postgresql/data -e POSTGRES_USER=jira -e POSTGRES_PASSWORD=yourpassword -d postgres
```

Run JIRA:

```
    docker run --name jira -d -p 8080:8080 hdejager/atlassian-jira
```

Create a network:

```
   docker network create jira
   docker network connect jira jira
   docker network connect jira jira-postgres
```

Navigate to `http://localhost:8080` and select Postgres as database with hostname `jira-postgres` during the JIRA wizard.
