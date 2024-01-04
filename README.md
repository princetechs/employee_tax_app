
# Employee Tax Application

This Ruby on Rails application manages employee data and calculates tax deductions based on their salaries for the current financial year.

## Prerequisites

- Ruby (version 3.1.0)
- Rails (version 7.1.2)

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/your_username/employee_tax_app.git
   cd employee_tax_app
   ```

2. Install dependencies:

   ```bash
   bundle install
   ```

3. Set up the database:

   ```bash
   rails db:create
   rails db:migrate
   ```

4. Start the Rails server:

   ```bash
   rails server
   ```

5. Access the application in your browser at `http://localhost:3000`.

## Usage

- Create employees with their details including employee ID, name, email, salary, date of joining, and phone numbers.
- Use the API endpoint `/api/employees` to create employees (POST request with JSON data).
- Access the tax deduction information for employees via `/api/tax/tax_deduction` (GET request).

## API Endpoints

### Create Employee

- **URL:** `/api/employees`
- **Method:** `POST`
- **Data Format:** JSON
- **Parameters:**
  ```json
  {
    "employee": {
      "employee_id": 101,
      "first_name": "Alice",
      "last_name": "Johnson",
      "email": "alice@example.com",
      "phone_numbers": ["1234567890", "9876543210"],
      "doj": "2023-05-10",
      "salary": 60000
    }
  }
  ```

### Tax Deduction for Employees

- **URL:** `/api/tax/tax_deduction`
- **Method:** `GET`
