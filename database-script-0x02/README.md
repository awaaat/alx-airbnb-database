# Database Seeding for Airbnb Schema

## Overview

This directory contains scripts to seed the Airbnb database with sample data and normalize the `message` table. The `seed.sql` file populates the database tables with realistic data to simulate real-world usage, such as multiple users, properties, bookings, payments, reviews, and messages, and then normalizes the `message` table by creating a `Message_Content` table.

## Repository Structure

**Directory**: `database-script-0x02`

**Files**:
- `seed.sql`: SQL script to insert sample data into the database and perform normalization.
- `README.md`: This file, providing documentation and instructions for seeding the database.

## Sample Data Overview

The `seed.sql` script adds the following sample data:

- **user**: 23 users (10 hosts, 12 guests, 1 admin).  
  Example: Wanjiku Muthoni (host), Akinyi Otieno (guest), Admin Mtawala (admin)

- **property**: 25 properties owned by 10 hosts.  
  Example: Lakeside Haven in Naivasha, Ocean Breeze Villa in Diani

- **booking**: 25 bookings with statuses confirmed, pending, or canceled.  
  Example: Akinyi books Lakeside Haven for 2 nights

- **payment**: 25 payments for confirmed and pending bookings.  
  Example: Payment for Akinyi’s booking via credit card

- **review**: 25 reviews for properties.  
  Example: Akinyi rates Lakeside Haven 4 stars

- **message**: 25 messages between users, later normalized into `Message_Content`.  
  Example: Akinyi asks Wanjiku about Lakeside Haven availability

## Normalization

The `seed.sql` script normalizes the `message` table by:

- Creating the `Message_Content` table to store `message_body`
- Transferring `message_id` and `message_body` from `message` to `Message_Content`
- Dropping the `message_body` column from `message`

The `payment` table is already in 3NF, as verified by schema design.

