# Expense Tracker

Expense Tracker is a web application built with React.js and Ruby on Rails. It allows users to track their expenses, income, budgets, and categories to manage their finances effectively.

## Features

- User authentication: Users can sign up, log in, and log out to access their personal expense tracking information.
- Expense management: Users can add, edit, and delete expenses, providing details such as amount, category, and date.
- Income management: Users can add, edit, and delete income entries to keep track of their earnings.
- Budget tracking: Users can create budgets for different categories and monitor their spending against the budgeted amount.
- Category management: Users can create, edit, and delete categories for organizing their expenses.
- Dashboard: Users can view a dashboard that provides an overview of their expenses, income, and budget progress.
- API Documentation: The backend API is documented using Swagger/OpenAPI specification to guide frontend developers on how to interact with the API endpoints.

## Technologies Used

- React.js: A JavaScript library for building user interfaces.
- Ruby on Rails: A web application framework for building the backend API.
- PostgreSQL: A powerful, open-source relational database management system.
- Devise: A flexible authentication solution for Rails applications.
- RSpec: A testing framework for Ruby applications.
- FactoryBot: A library for setting up Ruby objects as test data.
- Faker: A library for generating realistic test data.
- Rswag: A gem for generating Swagger documentation for Rails APIs.
- Axios: A promise-based HTTP client for making API requests from the frontend.
- React Router: A library for handling routing in React applications.

## Getting Started

To get a local copy of the project up and running, follow these steps:

### Prerequisites

- Node.js and npm: Make sure you have Node.js and npm installed on your machine.
- Ruby and Rails: Ensure you have Ruby and Rails installed.
- PostgreSQL: Set up PostgreSQL and have it running on your system.

### Installation

1. Clone the repository:

   ```shell
   git clone https://github.com/your-username/expense-tracker.git

2. Navigate to the project directory:

   ```shell
   cd expense-tracker

3. Install the frontend dependencies:

   ```shell
   npm install

4. Install the backend dependencies:

   ```shell
   bundle install

5. Set up the database:

   ```shell
   rails db:create
   rails db:migrate

6. Start the development server:

   ```shell
   rails server

7. Access the application in your browser:

   ```shell
   http://localhost:3000

### Testing

The project includes automated tests using RSpec. To run the tests, navigate to the project directory and execute the following command:

```shell
 bundle exec rspec

### API Documentation

The API endpoints are documented using Swagger/OpenAPI specification. After starting the Rails server, you can access the API documentation in your browser:

```shell
 http://localhost:3000/api-docs/index.html

### Contributing

Contributions are welcome! If you'd like to contribute to this project, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make the necessary changes and commit your code.
4. Push your changes to your forked repository.
5. Submit a pull request with a detailed description of your changes.

### License

This project is licensed under the MIT License.

```shell
 
Feel free to modify and customize the README file to suit your specific project requirements.
