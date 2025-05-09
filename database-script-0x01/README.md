# Airbnb Database Schema

## Overview
This project defines the database schema for an Airbnb-like application, implemented in PostgreSQL. The schema includes tables for users, properties, bookings, payments, reviews, messages, and message content, with appropriate constraints, indexes, and triggers to ensure data integrity and optimize performance.

---

## Repository Structure

**Directory:** `database-script-0x01`  
**Files:**
- `schema.sql`: SQL script to create the database schema, including tables, constraints, indexes, and triggers.
- `README.md`: This file, providing documentation and setup instructions.

---

## Database Schema

The database consists of the following tables:

### `user`
Stores user information (guests, hosts, admins).  
**Columns:**  
- `user_id` (UUID, PK)  
- `first_name`  
- `last_name`  
- `email` (UNIQUE)  
- `password_hash`  
- `phone_number`  
- `role` (`'guest'`, `'host'`, `'admin'`)  
- `created_at`  

**Index:**  
- `idx_user_email` on `email`

---

### `property`
Stores property listings created by hosts.  
**Columns:**  
- `property_id` (UUID, PK)  
- `host_id` (FK to `user`)  
- `name`  
- `description`  
- `location`  
- `pricepernight`  
- `created_at`  
- `updated_at`

**Foreign Key:**  
- `host_id` references `user(user_id)`

**Index:**  
- `idx_property_property_id` on `property_id`

**Trigger:**  
- Updates `updated_at` on row updates

---

### `booking`
Stores booking details for properties.  
**Columns:**  
- `booking_id` (UUID, PK)  
- `property_id` (FK to `property`)  
- `user_id` (FK to `user`)  
- `start_date`  
- `end_date`  
- `total_price`  
- `status` (`'pending'`, `'confirmed'`, `'canceled'`)  
- `created_at`

**Foreign Keys:**  
- `property_id` references `property(property_id)`  
- `user_id` references `user(user_id)`

**Indexes:**  
- `idx_booking_property_id` on `property_id`  
- `idx_booking_booking_id` on `booking_id`

---

### `payment`
Stores payment details for bookings.  
**Columns:**  
- `payment_id` (UUID, PK)  
- `booking_id` (FK to `booking`)  
- `amount`  
- `payment_date`  
- `payment_method` (`'credit_card'`, `'paypal'`, `'stripe'`)

**Foreign Key:**  
- `booking_id` references `booking(booking_id)`

**Index:**  
- `idx_payment_booking_id` on `booking_id`

---

### `review`
Stores user reviews for properties.  
**Columns:**  
- `review_id` (UUID, PK)  
- `property_id` (FK to `property`)  
- `user_id` (FK to `user`)  
- `rating` (1-5)  
- `comment`  
- `created_at`

**Foreign Keys:**  
- `property_id` references `property(property_id)`  
- `user_id` references `user(user_id)`

**Index:**  
- `idx_review_property_id` on `property_id`

---

### `message`
Stores metadata for messages between users.  
**Columns:**  
- `message_id` (UUID, PK)  
- `sender_id` (FK to `user`)  
- `recipient_id` (FK to `user`)  
- `sent_at`

**Foreign Keys:**  
- `sender_id` and `recipient_id` reference `user(user_id)`

---

### `Message_Content`
Stores the message body (normalized for 3NF).  
**Columns:**  
- `message_id` (UUID, PK, FK to `message`)  
- `message_body`

**Foreign Key:**  
- `message_id` references `message(message_id)`

---

## Setup Instructions

### Install PostgreSQL
- Ensure PostgreSQL is installed and running on your system.
- Verify the `uuid-ossp` extension is available.

### Create Database

```bash
createdb airbnb
