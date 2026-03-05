# product management application - CJL - TEST

A product management application built with Laravel for managing company website and operations.

## Getting started

To set up this project locally, follow these steps:

### Requirements

- PHP 8.0+
- Composer

### Installation

1. Clone the repository
2. Install PHP dependencies:

```
composer install
```

3. Install JavaScript dependencies:

```
npm install
```

4. Copy `.env.example` to `.env` and configure your environment variables
5. Generate application key:

```
php artisan key:generate
```

6. Session-based storage:

```
This project does not use a database, instead, it saves data in session-based storage. Local storage was not used because it is limited to the client-side.
```

## Configuration

Key environment variables in `.env`:

- `APP_NAME`: Application name
- `APP_DESCRIPTION`: Application description

## Support

For issues and questions, please create an issue in the repository.

## License

Proprietary - All rights reserved
