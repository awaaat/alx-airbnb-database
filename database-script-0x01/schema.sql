-- Enable UUID extension for generating UUIDs
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Drop tables in reverse order to avoid foreign key conflicts
DROP TABLE IF EXISTS Message_Content CASCADE;
DROP TABLE IF EXISTS message CASCADE;
DROP TABLE IF EXISTS review CASCADE;
DROP TABLE IF EXISTS payment CASCADE;
DROP TABLE IF EXISTS booking CASCADE;
DROP TABLE IF EXISTS property CASCADE;
DROP TABLE IF EXISTS "user" CASCADE;

-- Drop existing indexes explicitly to avoid conflicts
DROP INDEX IF EXISTS idx_user_email;
DROP INDEX IF EXISTS idx_property_property_id;
DROP INDEX IF EXISTS idx_booking_property_id;
DROP INDEX IF EXISTS idx_booking_booking_id;
DROP INDEX IF EXISTS idx_payment_booking_id;
DROP INDEX IF EXISTS idx_review_property_id;

-- Create User Table
CREATE TABLE "user" (
    user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role VARCHAR(20) NOT NULL CHECK (role IN ('guest', 'host', 'admin')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create index on user email for faster lookups
CREATE INDEX idx_user_email ON "user" (email);

-- Create Property Table
CREATE TABLE property (
    property_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    host_id UUID NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    pricepernight DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_host FOREIGN KEY (host_id) REFERENCES "user" (user_id)
);

-- Create index on property_id for faster lookups
CREATE INDEX idx_property_property_id ON property (property_id);

-- Create function and trigger for updated_at in property table
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_property_updated_at
    BEFORE UPDATE ON property
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- Create Booking Table
CREATE TABLE booking (
    booking_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) NOT NULL CHECK (status IN ('pending', 'confirmed', 'canceled')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_property FOREIGN KEY (property_id) REFERENCES property (property_id),
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES "user" (user_id)
);

-- Create indexes on booking table for faster queries
CREATE INDEX idx_booking_property_id ON booking (property_id);
CREATE INDEX idx_booking_booking_id ON booking (booking_id);

-- Create Payment Table
CREATE TABLE payment (
    payment_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    booking_id UUID NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(20) NOT NULL CHECK (payment_method IN ('credit_card', 'paypal', 'stripe')),
    CONSTRAINT fk_booking FOREIGN KEY (booking_id) REFERENCES booking (booking_id)
);

-- Create index on payment booking_id for faster lookups
CREATE INDEX idx_payment_booking_id ON payment (booking_id);

-- Create Review Table
CREATE TABLE review (
    review_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_property FOREIGN KEY (property_id) REFERENCES property (property_id),
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES "user" (user_id)
);

-- Create index on review property_id for faster lookups
CREATE INDEX idx_review_property_id ON review (property_id);

-- Create Message Table
CREATE TABLE message (
    message_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    sender_id UUID NOT NULL,
    recipient_id UUID NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_sender FOREIGN KEY (sender_id) REFERENCES "user" (user_id),
    CONSTRAINT fk_recipient FOREIGN KEY (recipient_id) REFERENCES "user" (user_id)
);

-- Create Message_Content Table (for 3NF normalization)
CREATE TABLE Message_Content (
    message_id UUID PRIMARY KEY,
    message_body TEXT NOT NULL,
    CONSTRAINT fk_message FOREIGN KEY (message_id) REFERENCES message (message_id)
);