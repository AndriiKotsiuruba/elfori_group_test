# README

## Stack & Features

| Name             | Technologies                                                                                           |
|------------------|--------------------------------------------------------------------------------------------------------|
| Backend          | Ruby 3.2.3<br/>Rails 6.1.7                                                                             |
| Frontend         | Javascript<br/>Bootstrap<br/>CSS, SCSS<br/>HTML, ERB                                                   |
| Database         | PostgreSQL                                                                                             |
| Server           | Puma                                                                                                   |
| Testing Tools    | RSpec<br/>Shoulda Matchers<br/>WebMock<br/>FactoryBot<br/>Faker<br/>Swagger<br/>SimpleCov<br/>TestProf |
| Linters          | Rubocop<br/>ERBLint<br/>ESLint                                                                         |
| Upload / Storage | Shrine + S3                                                                                            |
| Admin Panel      | ActiveAdmin                                                                                            |
| Pagination       | Pagy                                                                                                   |
| Authorization    | Pundit                                                                                                 |
| Authentication   | Devise                                                                                                 |

## Getting Started

1. **Clone the project.**
    ```bash
    git clone git@github.com:AndriiKotsiuruba/elfori_group_test.git
    ```

2. **Ask the tech lead or lead developer for the `.env` file. Add it to the project root folder.**

3. **Build application.**
    ```bash
    docker-compose up --build
    ```

4. **Run seeds.**
    ```bash
    docker-compose exec backend rails db:seed
    ```

## Branches

`development` - deploying to staging

`master` (with tag) - deploying to production

## Links

| Name              | Link                                |
|-------------------|-------------------------------------|
| Frontend          | http://localhost:3000               |
| Backoffice        | http://localhost:3000/admin         |
| API               | http://localhost:3000/api/v1        |
| Show Emails       | http://localhost:3000/letter_opener |
| Swagger docs      | http://localhost:3000/api-docs      |

## Project folder
 https://drive.google.com/drive/folders/1CZUGD0TDPywhjNvoHi7PT3SF0MSVI7zd

## Credentials

| Name            | Login                     | Password  |
|-----------------|---------------------------|-----------|
| Frontend        | user@example.com          | Password1 |
| Backoffice      | admin@example.com         | Password1 |

## Commands

`yarn docker:exec <command>` - execute command inside backend container

`yarn docker:status` - show status of running containers

`yarn docker:build` - build project

`yarn up` - start development environment (you can use `-d` option for silence mode)

`yarn stop` - stop containers

`yarn down` - down containers

`yarn bash` - go inside the backend container to execute commands

`yarn c` - run Ruby console inside the backend container

`yarn routes` - show all routes (you can find all matches `yarn routes | grep <resource_name>`)

`yarn db:seed` - run seeds

`yarn db:replant` - truncate DB and run seeds

`yarn db:migrate` - run migrations

`yarn db:rollback` - run migration rollback

`yarn db:reset` - run reset the database (drop, create, migrate, seed)

`yarn rubocop` - run Rubocop (you can use `-a` option to fix some issues)

`yarn erblint` - run ERBLint (you can use `-a` option to fix some issues)

`yarn jslint` - run ESLint (you can use `--fix` option to fix some issues)

`yarn rspec` - run RSpec in parallel mode

`yarn linters` - run linters and tests (rubocop, erblint, eslint, rspec)

`yarn docs` - run Swagger docs generating

`yarn annotate` - run Annotate models
