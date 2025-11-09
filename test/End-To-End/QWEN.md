# ZKEACMS End-to-End Testing Project

## Project Overview

This is an End-to-End (E2E) testing project for the ZKEACMS Content Management System. It uses Playwright as the testing framework to validate the functionality of the ZKEACMS admin interface, specifically focusing on page management capabilities.

The project contains automated tests that simulate user interactions with the ZKEACMS admin panel, particularly around page creation, editing, and publishing functionality.

## Technology Stack

- **Testing Framework**: Playwright (v1.56.1)
- **Language**: TypeScript
- **Package Manager**: npm
- **Target Application**: ZKEACMS

## Project Structure

```
test/End-To-End/
├── package.json                 # Project dependencies and configuration
├── playwright.config.ts         # Playwright configuration
├── src/                         # Page object models and helper classes
│   ├── admin/                   # Admin-specific page models
│   │   ├── PageDashboardPage.ts # Page dashboard model
│   │   └── PageFormPage.ts      # Page form model
│   └── models/                  # Base page models
│       └── AdminPageBase.ts     # Base admin page class
├── tests/                       # Test specifications
│   ├── example.spec.ts          # Example test file
│   └── admin/
│       └── page/
│           └── 01-basic-function-test.spec.ts # Basic page functionality tests
├── node_modules/                # Dependencies (generated)
├── playwright-report/           # Test reports (generated)
└── test-results/                # Test results (generated)
```

## Configuration

The Playwright configuration is set up with:
- Tests run in parallel across multiple browsers (Chromium, Firefox, Webkit)
- Retry logic for failed tests
- HTML reporter for test results
- Trace collection on first retry for debugging

## Key Functionality Tested

### Page Creation Tests
- Creating pages with required fields
- Handling validation errors for missing fields
- Publishing pages without widgets

### Admin Authentication
- Login functionality with username/password
- Session management

### Page Object Models

#### AdminPageBase
- Base class containing common admin functionality
- Login and logout methods
- Provides authentication for admin operations

#### PageFormPage
- Handles page creation form interactions
- Fills page details like name, title, path, layout, etc.
- Submits forms and verifies creation results
- Supports publishing pages from the design view

#### PageDashboardPage
- Manages interactions with the page dashboard
- Navigates to the page management area
- Waits for data loading

## Running Tests

To run the tests locally:

1. Ensure you have Node.js installed
2. Install dependencies:
   ```
   npm install
   ```
3. Run all tests:
   ```
   npx playwright test
   ```
4. Run tests in UI mode:
   ```
   npx playwright test --ui
   ```
5. Run tests for a specific browser:
   ```
   npx playwright test --project=chromium
   ```

To run tests against a local instance of ZKEACMS instead of the demo site, update the baseURL in `playwright.config.ts` to point to your local installation.

## Development Conventions

- Tests follow the Page Object Model pattern for better maintainability
- TypeScript interfaces are used to define data structures (e.g., PageFormData)
- Each test file should focus on a specific set of functionality
- Tests use meaningful names that describe the functionality being tested
- Wait strategies are implemented to handle asynchronous operations properly
- Credentials are managed using environment variables for security

## Credential Management

For security reasons, the tests now support the following approaches for authentication:

1. **Environment Variables**: Set `ADMIN_USERNAME` and `ADMIN_PASSWORD` environment variables
2. **Fallback Credentials**: If environment variables aren't set, the system defaults to 'admin'/'admin'

To use custom credentials, create a `.env` file or set the environment variables:

```
ADMIN_USERNAME=your_username
ADMIN_PASSWORD=your_password
```

An example file `.env.example` has been provided as a template.

## Current Test Coverage

The current tests validate:

1. **Page Creation**: Creating a page with all required fields
2. **Form Validation**: Ensuring required fields are validated
3. **Page Publishing**: Publishing a page without widgets to make it public
4. **Admin Authentication**: Logging into the admin panel using secure credential management

## Reporting

- Test results are stored in the `test-results/` directory
- HTML reports can be generated to `playwright-report/` directory
- Trace files are collected on first retry to help debug failed tests