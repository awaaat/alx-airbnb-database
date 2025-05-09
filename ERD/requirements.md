# ER Diagram Requirements

This document outlines the specifications for creating the Entity-Relationship (ER) diagram for the **AirBnB database schema**.

## 1. Entities and Attributes

The ER diagram must include the following entities and their attributes:

### User
- `user_id` (Primary Key, UUID, Indexed)
- `first_name` (VARCHAR, NOT NULL)
- `last_name` (VARCHAR, NOT NULL)
- `email` (VARCHAR, UNIQUE, NOT NULL)
- `password_hash` (VARCHAR, NOT NULL)
- `phone_number` (VARCHAR, NULL)
- `role` (ENUM: guest, host, admin, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### Property
- `property_id` (Primary Key, UUID, Indexed)
- `host_id` (Foreign Key → User.user_id)
- `name` (VARCHAR, NOT NULL)
- `description` (TEXT, NOT NULL)
- `location` (VARCHAR, NOT NULL)
- `pricepernight` (DECIMAL, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- `updated_at` (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

### Booking
- `booking_id` (Primary Key, UUID, Indexed)
- `property_id` (Foreign Key → Property.property_id)
- `user_id` (Foreign Key → User.user_id)
- `start_date` (DATE, NOT NULL)
- `end_date` (DATE, NOT NULL)
- `total_price` (DECIMAL, NOT NULL)
- `status` (ENUM: pending, confirmed, canceled, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### Payment
- `payment_id` (Primary Key, UUID, Indexed)
- `booking_id` (Foreign Key → Booking.booking_id)
- `amount` (DECIMAL, NOT NULL)
- `payment_date` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
- `payment_method` (ENUM: credit_card, PayPal, Stripe, NOT NULL)

### Review
- `review_id` (Primary Key, UUID, Indexed)
- `property_id` (Foreign Key → Property.property_id)
- `user_id` (Foreign Key → User.user_id)
- `rating` (INTEGER, CHECK rating BETWEEN 1 AND 5, NOT NULL)
- `comment` (TEXT, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### Message
- `message_id` (Primary Key, UUID, Indexed)
- `sender_id` (Foreign Key → User.user_id)
- `recipient_id` (Foreign Key → User.user_id)
- `message_body` (TEXT, NOT NULL)
- `sent_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

---

## 2. Relationships

The diagram must illustrate the following relationships:

- A **User** can create multiple **Bookings**
- A **User** can host multiple **Properties**
- A **Property** can have multiple **Bookings**
- A **Booking** can have one **Payment**
- A **User** can write multiple **Reviews** for different **Properties**
- A **User** can send and receive multiple **Messages**

---

## 3. Diagram Format

- Use **Draw.io**, Lucidchart, or another ERD tool to create the visual.
- Use crow’s foot notation or another standard format to indicate cardinality (e.g., one-to-many, many-to-many).
- Clearly show all **primary keys, foreign keys, constraints, and relationships**.
- Export and include the ER diagram file (PNG, SVG, or PDF) in this `ERD/` folder alongside this `requirements.md` file.
