-- Insert sample data into the user table (23 users: 10 hosts, 12 guests, 1 admin)
INSERT INTO "user" (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('550e8400-e29b-41d4-a716-446655440101', 'Wanjiku', 'Muthoni', 'wanjiku.muthoni@example.com', 'hash101', '+254710123456', 'host', '2025-05-01 08:00:00'),
('550e8400-e29b-41d4-a716-446655440102', 'Kamau', 'Njoroge', 'kamau.njoroge@example.com', 'hash102', '+254710234567', 'host', '2025-05-01 09:00:00'),
('550e8400-e29b-41d4-a716-446655440103', 'Akinyi', 'Otieno', 'akinyi.otieno@example.com', 'hash103', '+254711345678', 'guest', '2025-05-01 10:00:00'),
('550e8400-e29b-41d4-a716-446655440104', 'Kipchumba', 'Koech', 'kipchumba.koech@example.com', 'hash104', '+254711456789', 'guest', '2025-05-01 11:00:00'),
('550e8400-e29b-41d4-a716-446655440105', 'Njeri', 'Wambui', 'njeri.wambui@example.com', 'hash105', '+254711567890', 'host', '2025-05-01 12:00:00'),
('550e8400-e29b-41d4-a716-446655440106', 'Ochieng', 'Odhiambo', 'ochieng.odhiambo@example.com', 'hash106', '+254711678901', 'guest', '2025-05-01 13:00:00'),
('550e8400-e29b-41d4-a716-446655440107', 'Wairimu', 'Kariuki', 'wairimu.kariuki@example.com', 'hash107', '+254711789012', 'guest', '2025-05-01 14:00:00'),
('550e8400-e29b-41d4-a716-446655440108', 'Kiptoo', 'Langat', 'kiptoo.langat@example.com', 'hash108', '+254711890123', 'host', '2025-05-01 15:00:00'),
('550e8400-e29b-41d4-a716-446655440109', 'Adhiambo', 'Awuor', 'adhiambo.awuor@example.com', 'hash109', '+254711901234', 'guest', '2025-05-01 16:00:00'),
('550e8400-e29b-41d4-a716-446655440110', 'Muriithi', 'Maina', 'muriithi.maina@example.com', 'hash110', '+254712012345', 'host', '2025-05-01 17:00:00'),
('550e8400-e29b-41d4-a716-446655440111', 'Chebet', 'Rotich', 'chebet.rotich@example.com', 'hash111', '+254712123456', 'guest', '2025-05-01 18:00:00'),
('550e8400-e29b-41d4-a716-446655440112', 'Mwangi', 'Kimani', 'mwangi.kimani@example.com', 'hash112', '+254712234567', 'host', '2025-05-01 19:00:00'),
('550e8400-e29b-41d4-a716-446655440113', 'Auma', 'Onyango', 'auma.onyango@example.com', 'hash113', '+254712345678', 'guest', '2025-05-01 20:00:00'),
('550e8400-e29b-41d4-a716-446655440114', 'Kibet', 'Cheruiyot', 'kibet.cheruiyot@example.com', 'hash114', '+254712456789', 'guest', '2025-05-01 21:00:00'),
('550e8400-e29b-41d4-a716-446655440115', 'Wanjiru', 'Gichuru', 'wanjiru.gichuru@example.com', 'hash115', '+254712567890', 'host', '2025-05-02 08:00:00'),
('550e8400-e29b-41d4-a716-446655440116', 'Okoth', 'Ouma', 'okoth.ouma@example.com', 'hash116', '+254712678901', 'guest', '2025-05-02 09:00:00'),
('550e8400-e29b-41d4-a716-446655440117', 'Nyambura', 'Mbugua', 'nyambura.mbugua@example.com', 'hash117', '+254712789012', 'guest', '2025-05-02 10:00:00'),
('550e8400-e29b-41d4-a716-446655440118', 'Kiprono', 'Ngetich', 'kiprono.ngetich@example.com', 'hash118', '+254712890123', 'host', '2025-05-02 11:00:00'),
('550e8400-e29b-41d4-a716-446655440119', 'Anyango', 'Atieno', 'anyango.atieno@example.com', 'hash119', '+254712901234', 'guest', '2025-05-02 12:00:00'),
('550e8400-e29b-41d4-a716-446655440120', 'Githinji', 'Wachira', 'githinji.wachira@example.com', 'hash120', '+254713012345', 'host', '2025-05-02 13:00:00'),
('550e8400-e29b-41d4-a716-446655440121', 'Cherop', 'Kiptai', 'cherop.kiptai@example.com', 'hash121', '+254713123456', 'guest', '2025-05-02 14:00:00'),
('550e8400-e29b-41d4-a716-446655440122', 'Mwaura', 'Ndungu', 'mwaura.ndungu@example.com', 'hash122', '+254713234567', 'host', '2025-05-02 15:00:00'),
('550e8400-e29b-41d4-a716-446655440123', 'Admin', 'Mtawala', 'admin.mtawala@example.com', 'hash999', NULL, 'admin', '2025-05-02 16:00:00');

-- Insert sample data into the property table (25 properties owned by 10 hosts)
INSERT INTO property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
('6b7c8d9e-0f1a-2b3c-4d5e-6f7a8b9c0d01', (SELECT user_id FROM "user" WHERE email = 'wanjiku.muthoni@example.com'), 'Lakeside Haven', 'Cozy retreat by the lake', 'Naivasha, Kenya', 100.00, '2025-05-03 08:00:00', '2025-05-03 08:00:00'),
('6b7c8d9e-0f1a-2b3c-4d5e-6f7a8b9c0d02', (SELECT user_id FROM "user" WHERE email = 'wanjiku.muthoni@example.com'), 'Nairobi Nest', 'Modern city apartment', 'Nairobi, Kenya', 120.00, '2025-05-03 09:00:00', '2025-05-03 09:00:00'),
('6b7c8d9e-0f1a-2b3c-4d5e-6f7a8b9c0d03', (SELECT user_id FROM "user" WHERE email = 'kamau.njoroge@example.com'), 'Ocean Breeze Villa', 'Luxurious beachfront villa', 'Diani, Kenya', 200.00, '2025-05-03 10:00:00', '2025-05-03 10:00:00'),
('6b7c8d9e-0f1a-2b3c-4d5e-6f7a8b9c0d04', (SELECT user_id FROM "user" WHERE email = 'kamau.njoroge@example.com'), 'Savanna Lodge', 'Wilderness lodge', 'Maasai Mara, Kenya', 250.00, '2025-05-03 11:00:00', '2025-05-03 11:00:00'),
('6b7c8d9e-0f1a-2b3c-4d5e-6f7a8b9c0d05', (SELECT user_id FROM "user" WHERE email = 'njeri.wambui@example.com'), 'Urban Loft', 'Stylish city loft', 'Mombasa, Kenya', 130.00, '2025-05-03 12:00:00', '2025-05-03 12:00:00'),
('6b7c8d9e-0f1a-2b3c-4d5e-6f7a8b9c0d06', (SELECT user_id FROM "user" WHERE email = 'njeri.wambui@example.com'), 'Hilltop Cabin', 'Rustic mountain cabin', 'Aberdare, Kenya', 110.00, '2025-05-03 13:00:00', '2025-05-03 13:00:00'),
('6b7c8d9e-0f1a-2b3c-4d5e-6f7a8b9c0d07', (SELECT user_id FROM "user" WHERE email = 'kiptoo.langat@example.com'), 'Coastal Cottage', 'Charming seaside cottage', 'Lamu, Kenya', 90.00, '2025-05-03 14:00:00', '2025-05-03 14:00:00'),
('6b7c8d9e-0f1a-2b3c-4d5e-6f7a8b9c0d08', (SELECT user_id FROM "user" WHERE email = 'kiptoo.langat@example.com'), 'City Studio', 'Compact downtown studio', 'Kisumu, Kenya', 80.00, '2025-05-03 15:00:00', '2025-05-03 15:00:00'),
('6b7c8d9e-0f1a-2b3c-4d5e-6f7a8b9c0d09', (SELECT user_id FROM "user" WHERE email = 'muriithi.maina@example.com'), 'Safari Retreat', 'Luxury tented camp', 'Tsavo, Kenya', 180.00, '2025-05-03 16:00:00', '2025-05-03 16:00:00'),
('6b7c8d9e-0f1a-2b3c-4d5e-6f7a8b9c0d10', (SELECT user_id FROM "user" WHERE email = 'muriithi.maina@example.com'), 'Garden Bungalow', 'Bungalow with lush gardens', 'Karen, Kenya', 140.00, '2025-05-03 17:00:00', '2025-05-03 17:00:00'),
('6b7c8d9e-0f1a-2b3c-4d5e-6f7a8b9c0d11', (SELECT user_id FROM "user" WHERE email = 'mwangi.kimani@example.com'), 'Riverside Villa', 'Villa by the river', 'Nanyuki, Kenya', 150.00, '2025-05-03 18:00:00', '2025-05-03 18:00:00'),
('6b7c8d9e-0f1a-2b3c-4d5e-6f7a8b9c0d12', (SELECT user_id FROM "user" WHERE email = 'mwangi.kimani@example.com'), 'Beach Shack', 'Casual beachside shack', 'Watamu, Kenya', 95.00, '2025-05-03 19:00:00', '2025-05-03 19:00:00'),
('6b7c8d9e-0f1a-2b3c-4d5e-6f7a8b9c0d13', (SELECT user_id FROM "user" WHERE email = 'wanjiru.gichuru@example.com'), 'Skyline Penthouse', 'Luxury city penthouse', 'Nairobi, Kenya', 220.00, '2025-05-03 20:00:00', '2025-05-03 20:00:00'),
('6b7c8d9e-0f1a-2b3c-4d5e-6f7a8b9c0d14', (SELECT user_id FROM "user" WHERE email = 'wanjiru.gichuru@example.com'), 'Forest Hut', 'Secluded forest hut', 'Nyeri, Kenya', 85.00, '2025-05-03 21:00:00', '2025-05-03 21:00:00'),
('6b7c8d9e-0f1a-2b3c-4d5e-6f7a8b9c0d15', (SELECT user_id FROM "user" WHERE email = 'kiprono.ngetich@example.com'), 'Lakeview House', 'Spacious lakeside home', 'Nakuru, Kenya', 160.00, '2025-05-04 08:00:00', '2025-05-04 08:00:00'),
('6b7c8d9e-0f1a-2b3c-4d5e-6f7a8b9c0d16', (SELECT user_id FROM "user" WHERE email = 'kiprono.ngetich@example.com'), 'Urban Flat', 'Trendy city flat', 'Eldoret, Kenya', 100.00, '2025-05-04 09:00:00', '2025-05-04 09:00:00'),
('6b7c8d9e-0f1a-2b3c-4d5e-6f7a8b9c0d17', (SELECT user_id FROM "user" WHERE email = 'githinji.wachira@example.com'), 'Clifftop Retreat', 'Scenic clifftop villa', 'Malindi, Kenya', 170.00, '2025-05-04 10:00:00', '2025-05-04 10:00:00'),
('6b7c8d9e-0f1a-2b3c-4d5e-6f7a8b9c0d18', (SELECT user_id FROM "user" WHERE email = 'githinji.wachira@example.com'), 'Farmhouse', 'Peaceful rural farmhouse', 'Limuru, Kenya', 105.00, '2025-05-04 11:00:00', '2025-05-04 11:00:00'),
('6b7c8d9e-0f1a-2b3c-4d5e-6f7a8b9c0d19', (SELECT user_id FROM "user" WHERE email = 'mwaura.ndungu@example.com'), 'Treehouse', 'Unique forest treehouse', 'Karura, Kenya', 125.00, '2025-05-04 12:00:00', '2025-05-04 12:00:00'),
('6b7c8d9e-0f1a-2b3c-4d5e-6f7a8b9c0d20', (SELECT user_id FROM "user" WHERE email = 'mwaura.ndungu@example.com'), 'City Condo', 'Modern city condominium', 'Nairobi, Kenya', 135.00, '2025-05-04 13:00:00', '2025-05-04 13:00:00'),
('6b7c8d9e-0f1a-2b3c-4d5e-6f7a8b9c0d21', (SELECT user_id FROM "user" WHERE email = 'wanjiku.muthoni@example.com'), 'Desert Camp', 'Authentic desert experience', 'Samburu, Kenya', 190.00, '2025-05-04 14:00:00', '2025-05-04 14:00:00'),
('6b7c8d9e-0f1a-2b3c-4d5e-6f7a8b9c0d22', (SELECT user_id FROM "user" WHERE email = 'kamau.njoroge@example.com'), 'Harbor View', 'Apartment with harbor views', 'Mombasa, Kenya', 115.00, '2025-05-04 15:00:00', '2025-05-04 15:00:00'),
('6b7c8d9e-0f1a-2b3c-4d5e-6f7a8b9c0d23', (SELECT user_id FROM "user" WHERE email = 'njeri.wambui@example.com'), 'Valley Cottage', 'Cozy valley retreat', 'Rift Valley, Kenya', 90.00, '2025-05-04 16:00:00', '2025-05-04 16:00:00'),
('6b7c8d9e-0f1a-2b3c-4d5e-6f7a8b9c0d24', (SELECT user_id FROM "user" WHERE email = 'kiptoo.langat@example.com'), 'Highland Lodge', 'Lodge in the highlands', 'Kericho, Kenya', 145.00, '2025-05-04 17:00:00', '2025-05-04 17:00:00'),
('6b7c8d9e-0f1a-2b3c-4d5e-6f7a8b9c0d25', (SELECT user_id FROM "user" WHERE email = 'muriithi.maina@example.com'), 'Island Hideaway', 'Private island cottage', 'Lamu, Kenya', 210.00, '2025-05-04 18:00:00', '2025-05-04 18:00:00');

-- Insert sample data into the booking table (25 bookings by 14 guests)
INSERT INTO booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('9e0f1a2b-3c4d-5e6f-7a8b-9c0d1e2f3a01', (SELECT property_id FROM property WHERE name = 'Lakeside Haven'), (SELECT user_id FROM "user" WHERE email = 'akinyi.otieno@example.com'), '2025-06-01', '2025-06-03', 200.00, 'confirmed', '2025-05-05 08:00:00'),
('9e0f1a2b-3c4d-5e6f-7a8b-9c0d1e2f3a02', (SELECT property_id FROM property WHERE name = 'Nairobi Nest'), (SELECT user_id FROM "user" WHERE email = 'akinyi.otieno@example.com'), '2025-06-10', '2025-06-12', 240.00, 'pending', '2025-05-05 09:00:00'),
('9e0f1a2b-3c4d-5e6f-7a8b-9c0d1e2f3a03', (SELECT property_id FROM property WHERE name = 'Ocean Breeze Villa'), (SELECT user_id FROM "user" WHERE email = 'kipchumba.koech@example.com'), '2025-07-01', '2025-07-05', 800.00, 'confirmed', '2025-05-05 10:00:00'),
('9e0f1a2b-3c4d-5e6f-7a8b-9c0d1e2f3a04', (SELECT property_id FROM property WHERE name = 'Savanna Lodge'), (SELECT user_id FROM "user" WHERE email = 'kipchumba.koech@example.com'), '2025-07-10', '2025-07-12', 500.00, 'canceled', '2025-05-05 11:00:00'),
('9e0f1a2b-3c4d-5e6f-7a8b-9c0d1e2f3a05', (SELECT property_id FROM property WHERE name = 'Urban Loft'), (SELECT user_id FROM "user" WHERE email = 'ochieng.odhiambo@example.com'), '2025-08-01', '2025-08-03', 260.00, 'confirmed', '2025-05-05 12:00:00'),
('9e0f1a2b-3c4d-5e6f-7a8b-9c0d1e2f3a06', (SELECT property_id FROM property WHERE name = 'Hilltop Cabin'), (SELECT user_id FROM "user" WHERE email = 'ochieng.odhiambo@example.com'), '2025-08-10', '2025-08-12', 220.00, 'pending', '2025-05-05 13:00:00'),
('9e0f1a2b-3c4d-5e6f-7a8b-9c0d1e2f3a07', (SELECT property_id FROM property WHERE name = 'Coastal Cottage'), (SELECT user_id FROM "user" WHERE email = 'wairimu.kariuki@example.com'), '2025-09-01', '2025-09-04', 270.00, 'confirmed', '2025-05-05 14:00:00'),
('9e0f1a2b-3c4d-5e6f-7a8b-9c0d1e2f3a08', (SELECT property_id FROM property WHERE name = 'City Studio'), (SELECT user_id FROM "user" WHERE email = 'wairimu.kariuki@example.com'), '2025-09-10', '2025-09-12', 160.00, 'canceled', '2025-05-05 15:00:00'),
('9e0f1a2b-3c4d-5e6f-7a8b-9c0d1e2f3a09', (SELECT property_id FROM property WHERE name = 'Safari Retreat'), (SELECT user_id FROM "user" WHERE email = 'adhiambo.awuor@example.com'), '2025-10-01', '2025-10-03', 360.00, 'confirmed', '2025-05-05 16:00:00'),
('9e0f1a2b-3c4d-5e6f-7a8b-9c0d1e2f3a10', (SELECT property_id FROM property WHERE name = 'Garden Bungalow'), (SELECT user_id FROM "user" WHERE email = 'adhiambo.awuor@example.com'), '2025-10-10', '2025-10-12', 280.00, 'pending', '2025-05-05 17:00:00'),
('9e0f1a2b-3c4d-5e6f-7a8b-9c0d1e2f3a11', (SELECT property_id FROM property WHERE name = 'Riverside Villa'), (SELECT user_id FROM "user" WHERE email = 'chebet.rotich@example.com'), '2025-11-01', '2025-11-03', 300.00, 'confirmed', '2025-05-05 18:00:00'),
('9e0f1a2b-3c4d-5e6f-7a8b-9c0d1e2f3a12', (SELECT property_id FROM property WHERE name = 'Beach Shack'), (SELECT user_id FROM "user" WHERE email = 'chebet.rotich@example.com'), '2025-11-10', '2025-11-12', 190.00, 'canceled', '2025-05-05 19:00:00'),
('9e0f1a2b-3c4d-5e6f-7a8b-9c0d1e2f3a13', (SELECT property_id FROM property WHERE name = 'Skyline Penthouse'), (SELECT user_id FROM "user" WHERE email = 'auma.onyango@example.com'), '2025-12-01', '2025-12-04', 660.00, 'confirmed', '2025-05-05 20:00:00'),
('9e0f1a2b-3c4d-5e6f-7a8b-9c0d1e2f3a14', (SELECT property_id FROM property WHERE name = 'Forest Hut'), (SELECT user_id FROM "user" WHERE email = 'auma.onyango@example.com'), '2025-12-10', '2025-12-12', 170.00, 'pending', '2025-05-05 21:00:00'),
('9e0f1a2b-3c4d-5e6f-7a8b-9c0d1e2f3a15', (SELECT property_id FROM property WHERE name = 'Lakeview House'), (SELECT user_id FROM "user" WHERE email = 'kibet.cheruiyot@example.com'), '2026-01-01', '2026-01-03', 320.00, 'confirmed', '2025-05-06 08:00:00'),
('9e0f1a2b-3c4d-5e6f-7a8b-9c0d1e2f3a16', (SELECT property_id FROM property WHERE name = 'Urban Flat'), (SELECT user_id FROM "user" WHERE email = 'kibet.cheruiyot@example.com'), '2026-01-10', '2026-01-12', 200.00, 'canceled', '2025-05-06 09:00:00'),
('9e0f1a2b-3c4d-5e6f-7a8b-9c0d1e2f3a17', (SELECT property_id FROM property WHERE name = 'Clifftop Retreat'), (SELECT user_id FROM "user" WHERE email = 'okoth.ouma@example.com'), '2026-02-01', '2026-02-03', 340.00, 'confirmed', '2025-05-06 10:00:00'),
('9e0f1a2b-3c4d-5e6f-7a8b-9c0d1e2f3a18', (SELECT property_id FROM property WHERE name = 'Farmhouse'), (SELECT user_id FROM "user" WHERE email = 'okoth.ouma@example.com'), '2026-02-10', '2026-02-12', 210.00, 'pending', '2025-05-06 11:00:00'),
('9e0f1a2b-3c4d-5e6f-7a8b-9c0d1e2f3a19', (SELECT property_id FROM property WHERE name = 'Treehouse'), (SELECT user_id FROM "user" WHERE email = 'nyambura.mbugua@example.com'), '2026-03-01', '2026-03-04', 375.00, 'confirmed', '2025-05-06 12:00:00'),
('9e0f1a2b-3c4d-5e6f-7a8b-9c0d1e2f3a20', (SELECT property_id FROM property WHERE name = 'City Condo'), (SELECT user_id FROM "user" WHERE email = 'nyambura.mbugua@example.com'), '2026-03-10', '2026-03-12', 270.00, 'canceled', '2025-05-06 13:00:00'),
('9e0f1a2b-3c4d-5e6f-7a8b-9c0d1e2f3a21', (SELECT property_id FROM property WHERE name = 'Desert Camp'), (SELECT user_id FROM "user" WHERE email = 'anyango.atieno@example.com'), '2026-04-01', '2026-04-03', 380.00, 'confirmed', '2025-05-06 14:00:00'),
('9e0f1a2b-3c4d-5e6f-7a8b-9c0d1e2f3a22', (SELECT property_id FROM property WHERE name = 'Harbor View'), (SELECT user_id FROM "user" WHERE email = 'anyango.atieno@example.com'), '2026-04-10', '2026-04-12', 230.00, 'pending', '2025-05-06 15:00:00'),
('9e0f1a2b-3c4d-5e6f-7a8b-9c0d1e2f3a23', (SELECT property_id FROM property WHERE name = 'Valley Cottage'), (SELECT user_id FROM "user" WHERE email = 'cherop.kiptai@example.com'), '2026-05-01', '2026-05-03', 180.00, 'confirmed', '2025-05-06 16:00:00'),
('9e0f1a2b-3c4d-5e6f-7a8b-9c0d1e2f3a24', (SELECT property_id FROM property WHERE name = 'Highland Lodge'), (SELECT user_id FROM "user" WHERE email = 'adhiambo.awuor@example.com'), '2026-05-10', '2026-05-12', 290.00, 'pending', '2025-05-06 17:00:00'),
('9e0f1a2b-3c4d-5e6f-7a8b-9c0d1e2f3a25', (SELECT property_id FROM property WHERE name = 'Island Hideaway'), (SELECT user_id FROM "user" WHERE email = 'kibet.cheruiyot@example.com'), '2026-06-01', '2026-06-03', 420.00, 'confirmed', '2025-05-06 18:00:00');

-- Insert sample data into the payment table (25 payments for confirmed and pending bookings)
INSERT INTO payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d01', (SELECT booking_id FROM booking WHERE start_date = '2025-06-01'), 200.00, '2025-05-30 10:00:00', 'credit_card'),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d02', (SELECT booking_id FROM booking WHERE start_date = '2025-06-10'), 120.00, '2025-06-08 12:00:00', 'paypal'),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d03', (SELECT booking_id FROM booking WHERE start_date = '2025-07-01'), 800.00, '2025-06-28 14:00:00', 'stripe'),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d04', (SELECT booking_id FROM booking WHERE start_date = '2025-07-10'), 250.00, '2025-07-08 09:00:00', 'credit_card'),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d05', (SELECT booking_id FROM booking WHERE start_date = '2025-08-01'), 260.00, '2025-07-30 11:00:00', 'paypal'),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d06', (SELECT booking_id FROM booking WHERE start_date = '2025-08-10'), 110.00, '2025-08-08 15:00:00', 'stripe'),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d07', (SELECT booking_id FROM booking WHERE start_date = '2025-09-01'), 270.00, '2025-08-29 10:00:00', 'credit_card'),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d08', (SELECT booking_id FROM booking WHERE start_date = '2025-09-10'), 80.00, '2025-09-08 12:00:00', 'paypal'),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d09', (SELECT booking_id FROM booking WHERE start_date = '2025-10-01'), 360.00, '2025-09-28 14:00:00', 'stripe'),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d10', (SELECT booking_id FROM booking WHERE start_date = '2025-10-10'), 140.00, '2025-10-08 09:00:00', 'credit_card'),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d11', (SELECT booking_id FROM booking WHERE start_date = '2025-11-01'), 300.00, '2025-10-30 11:00:00', 'paypal'),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d12', (SELECT booking_id FROM booking WHERE start_date = '2025-11-10'), 95.00, '2025-11-08 15:00:00', 'stripe'),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d13', (SELECT booking_id FROM booking WHERE start_date = '2025-12-01'), 660.00, '2025-11-28 10:00:00', 'credit_card'),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d14', (SELECT booking_id FROM booking WHERE start_date = '2025-12-10'), 85.00, '2025-12-08 12:00:00', 'paypal'),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d15', (SELECT booking_id FROM booking WHERE start_date = '2026-01-01'), 320.00, '2025-12-30 14:00:00', 'stripe'),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d16', (SELECT booking_id FROM booking WHERE start_date = '2026-01-10'), 100.00, '2026-01-08 09:00:00', 'credit_card'),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d17', (SELECT booking_id FROM booking WHERE start_date = '2026-02-01'), 340.00, '2026-01-30 11:00:00', 'paypal'),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d18', (SELECT booking_id FROM booking WHERE start_date = '2026-02-10'), 105.00, '2026-02-08 15:00:00', 'stripe'),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d19', (SELECT booking_id FROM booking WHERE start_date = '2026-03-01'), 375.00, '2026-02-28 10:00:00', 'credit_card'),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d20', (SELECT booking_id FROM booking WHERE start_date = '2026-03-10'), 135.00, '2026-03-08 12:00:00', 'paypal'),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d21', (SELECT booking_id FROM booking WHERE start_date = '2026-04-01'), 380.00, '2026-03-30 14:00:00', 'stripe'),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d22', (SELECT booking_id FROM booking WHERE start_date = '2026-04-10'), 115.00, '2026-04-08 09:00:00', 'credit_card'),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d23', (SELECT booking_id FROM booking WHERE start_date = '2026-05-01'), 180.00, '2026-04-30 11:00:00', 'paypal'),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d24', (SELECT booking_id FROM booking WHERE start_date = '2026-05-10'), 145.00, '2026-05-08 15:00:00', 'stripe'),
('2b3c4d5e-6f7a-8b9c-0d1e-2f3a4b5c6d25', (SELECT booking_id FROM booking WHERE start_date = '2026-06-01'), 420.00, '2026-05-30 10:00:00', 'credit_card');

-- Insert sample data into the review table (25 reviews for properties by 14 guests)
INSERT INTO review (review_id, property_id, user_id, rating, comment, created_at) VALUES
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f01', (SELECT property_id FROM property WHERE name = 'Lakeside Haven'), (SELECT user_id FROM "user" WHERE email = 'akinyi.otieno@example.com'), 4, 'Beautiful lake views', '2025-06-04 08:00:00'),
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f02', (SELECT property_id FROM property WHERE name = 'Nairobi Nest'), (SELECT user_id FROM "user" WHERE email = 'akinyi.otieno@example.com'), 3, 'Central but noisy', '2025-06-13 09:00:00'),
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f03', (SELECT property_id FROM property WHERE name = 'Ocean Breeze Villa'), (SELECT user_id FROM "user" WHERE email = 'kipchumba.koech@example.com'), 5, 'Perfect beach getaway', '2025-07-06 10:00:00'),
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f04', (SELECT property_id FROM property WHERE name = 'Savanna Lodge'), (SELECT user_id FROM "user" WHERE email = 'kipchumba.koech@example.com'), 4, 'Great safari experience', '2025-07-13 11:00:00'),
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f05', (SELECT property_id FROM property WHERE name = 'Urban Loft'), (SELECT user_id FROM "user" WHERE email = 'ochieng.odhiambo@example.com'), 3, 'Good location, small space', '2025-08-04 12:00:00'),
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f06', (SELECT property_id FROM property WHERE name = 'Hilltop Cabin'), (SELECT user_id FROM "user" WHERE email = 'ochieng.odhiambo@example.com'), 4, 'Peaceful retreat', '2025-08-13 13:00:00'),
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f07', (SELECT property_id FROM property WHERE name = 'Coastal Cottage'), (SELECT user_id FROM "user" WHERE email = 'wairimu.kariuki@example.com'), 5, 'Charming and cozy', '2025-09-05 14:00:00'),
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f08', (SELECT property_id FROM property WHERE name = 'City Studio'), (SELECT user_id FROM "user" WHERE email = 'wairimu.kariuki@example.com'), 3, 'Basic but functional', '2025-09-13 15:00:00'),
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f09', (SELECT property_id FROM property WHERE name = 'Safari Retreat'), (SELECT user_id FROM "user" WHERE email = 'adhiambo.awuor@example.com'), 4, 'Amazing wildlife views', '2025-10-04 08:00:00'),
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f10', (SELECT property_id FROM property WHERE name = 'Garden Bungalow'), (SELECT user_id FROM "user" WHERE email = 'adhiambo.awuor@example.com'), 5, 'Lovely gardens', '2025-10-13 09:00:00'),
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f11', (SELECT property_id FROM property WHERE name = 'Riverside Villa'), (SELECT user_id FROM "user" WHERE email = 'chebet.rotich@example.com'), 4, 'Relaxing by the river', '2025-11-04 10:00:00'),
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f12', (SELECT property_id FROM property WHERE name = 'Beach Shack'), (SELECT user_id FROM "user" WHERE email = 'chebet.rotich@example.com'), 3, 'Fun but basic', '2025-11-13 11:00:00'),
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f13', (SELECT property_id FROM property WHERE name = 'Skyline Penthouse'), (SELECT user_id FROM "user" WHERE email = 'auma.onyango@example.com'), 5, 'Luxury at its best', '2025-12-05 12:00:00'),
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f14', (SELECT property_id FROM property WHERE name = 'Forest Hut'), (SELECT user_id FROM "user" WHERE email = 'auma.onyango@example.com'), 4, 'Secluded and serene', '2025-12-13 13:00:00'),
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f15', (SELECT property_id FROM property WHERE name = 'Lakeview House'), (SELECT user_id FROM "user" WHERE email = 'kibet.cheruiyot@example.com'), 4, 'Spacious and scenic', '2026-01-04 14:00:00'),
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f16', (SELECT property_id FROM property WHERE name = 'Urban Flat'), (SELECT user_id FROM "user" WHERE email = 'kibet.cheruiyot@example.com'), 3, 'Good for short stay', '2026-01-13 15:00:00'),
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f17', (SELECT property_id FROM property WHERE name = 'Clifftop Retreat'), (SELECT user_id FROM "user" WHERE email = 'okoth.ouma@example.com'), 5, 'Stunning views', '2026-02-04 08:00:00'),
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f18', (SELECT property_id FROM property WHERE name = 'Farmhouse'), (SELECT user_id FROM "user" WHERE email = 'okoth.ouma@example.com'), 4, 'Quiet and rustic', '2026-02-13 09:00:00'),
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f19', (SELECT property_id FROM property WHERE name = 'Treehouse'), (SELECT user_id FROM "user" WHERE email = 'nyambura.mbugua@example.com'), 4, 'Unique experience', '2026-03-05 10:00:00'),
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f20', (SELECT property_id FROM property WHERE name = 'City Condo'), (SELECT user_id FROM "user" WHERE email = 'nyambura.mbugua@example.com'), 3, 'Modern but crowded area', '2026-03-13 11:00:00'),
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f21', (SELECT property_id FROM property WHERE name = 'Desert Camp'), (SELECT user_id FROM "user" WHERE email = 'anyango.atieno@example.com'), 5, 'Authentic adventure', '2026-04-04 12:00:00'),
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f22', (SELECT property_id FROM property WHERE name = 'Harbor View'), (SELECT user_id FROM "user" WHERE email = 'anyango.atieno@example.com'), 4, 'Nice harbor views', '2026-04-13 13:00:00'),
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f23', (SELECT property_id FROM property WHERE name = 'Valley Cottage'), (SELECT user_id FROM "user" WHERE email = 'cherop.kiptai@example.com'), 4, 'Cozy and quiet', '2026-05-04 14:00:00'),
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f24', (SELECT property_id FROM property WHERE name = 'Highland Lodge'), (SELECT user_id FROM "user" WHERE email = 'adhiambo.awuor@example.com'), 5, 'Perfect highland stay', '2026-05-13 15:00:00'),
('4d5e6f7a-8b9c-0d1e-2f3a-4b5c6d7e8f25', (SELECT property_id FROM property WHERE name = 'Island Hideaway'), (SELECT user_id FROM "user" WHERE email = 'kibet.cheruiyot@example.com'), 4, 'Private and relaxing', '2026-06-04 08:00:00');

-- Insert sample data into the message table (25 messages between guests and hosts)
INSERT INTO message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f901201', (SELECT user_id FROM "user" WHERE email = 'akinyi.otieno@example.com'), (SELECT user_id FROM "user" WHERE email = 'wanjiku.muthoni@example.com'), 'Is Lakeside Haven available?', '2025-05-20 14:00:00'),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f901202', (SELECT user_id FROM "user" WHERE email = 'wanjiku.muthoni@example.com'), (SELECT user_id FROM "user" WHERE email = 'akinyi.otieno@example.com'), 'Yes, book soon!', '2025-05-20 15:00:00'),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f901203', (SELECT user_id FROM "user" WHERE email = 'kipchumba.koech@example.com'), (SELECT user_id FROM "user" WHERE email = 'kamau.njoroge@example.com'), 'Early check-in for Ocean Breeze?', '2025-06-25 10:00:00'),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f901204', (SELECT user_id FROM "user" WHERE email = 'kamau.njoroge@example.com'), (SELECT user_id FROM "user" WHERE email = 'kipchumba.koech@example.com'), 'Early check-in possible', '2025-06-25 11:00:00'),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f901205', (SELECT user_id FROM "user" WHERE email = 'ochieng.odhiambo@example.com'), (SELECT user_id FROM "user" WHERE email = 'njeri.wambui@example.com'), 'Urban Loft Wi-Fi speed?', '2025-07-20 12:00:00'),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f901206', (SELECT user_id FROM "user" WHERE email = 'njeri.wambui@example.com'), (SELECT user_id FROM "user" WHERE email = 'ochieng.odhiambo@example.com'), 'High-speed Wi-Fi included', '2025-07-20 13:00:00'),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f901207', (SELECT user_id FROM "user" WHERE email = 'wairimu.kariuki@example.com'), (SELECT user_id FROM "user" WHERE email = 'kiptoo.langat@example.com'), 'Coastal Cottage parking?', '2025-08-25 14:00:00'),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f901208', (SELECT user_id FROM "user" WHERE email = 'kiptoo.langat@example.com'), (SELECT user_id FROM "user" WHERE email = 'wairimu.kariuki@example.com'), 'Free parking available', '2025-08-25 15:00:00'),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f901209', (SELECT user_id FROM "user" WHERE email = 'adhiambo.awuor@example.com'), (SELECT user_id FROM "user" WHERE email = 'muriithi.maina@example.com'), 'Safari Retreat amenities?', '2025-09-20 09:00:00'),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f901210', (SELECT user_id FROM "user" WHERE email = 'muriithi.maina@example.com'), (SELECT user_id FROM "user" WHERE email = 'adhiambo.awuor@example.com'), 'Includes meals, tours', '2025-09-20 10:00:00'),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f901211', (SELECT user_id FROM "user" WHERE email = 'chebet.rotich@example.com'), (SELECT user_id FROM "user" WHERE email = 'mwangi.kimani@example.com'), 'Riverside Villa pet policy?', '2025-10-25 11:00:00'),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f901212', (SELECT user_id FROM "user" WHERE email = 'mwangi.kimani@example.com'), (SELECT user_id FROM "user" WHERE email = 'chebet.rotich@example.com'), 'Pets allowed with fee', '2025-10-25 12:00:00'),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f901213', (SELECT user_id FROM "user" WHERE email = 'auma.onyango@example.com'), (SELECT user_id FROM "user" WHERE email = 'wanjiru.gichuru@example.com'), 'Skyline Penthouse check-in?', '2025-11-20 13:00:00'),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f901214', (SELECT user_id FROM "user" WHERE email = 'wanjiru.gichuru@example.com'), (SELECT user_id FROM "user" WHERE email = 'auma.onyango@example.com'), 'Check-in at 2 PM', '2025-11-20 14:00:00'),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f901215', (SELECT user_id FROM "user" WHERE email = 'kibet.cheruiyot@example.com'), (SELECT user_id FROM "user" WHERE email = 'kiprono.ngetich@example.com'), 'Lakeview House availability?', '2025-12-25 15:00:00'),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f901216', (SELECT user_id FROM "user" WHERE email = 'kiprono.ngetich@example.com'), (SELECT user_id FROM "user" WHERE email = 'kibet.cheruiyot@example.com'), 'Available, please book', '2025-12-25 16:00:00'),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f901217', (SELECT user_id FROM "user" WHERE email = 'okoth.ouma@example.com'), (SELECT user_id FROM "user" WHERE email = 'githinji.wachira@example.com'), 'Clifftop Retreat views?', '2026-01-20 09:00:00'),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f901218', (SELECT user_id FROM "user" WHERE email = 'githinji.wachira@example.com'), (SELECT user_id FROM "user" WHERE email = 'okoth.ouma@example.com'), 'Stunning ocean views', '2026-01-20 10:00:00'),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f901219', (SELECT user_id FROM "user" WHERE email = 'nyambura.mbugua@example.com'), (SELECT user_id FROM "user" WHERE email = 'mwaura.ndungu@example.com'), 'Treehouse safety features?', '2026-02-25 11:00:00'),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f901220', (SELECT user_id FROM "user" WHERE email = 'mwaura.ndungu@example.com'), (SELECT user_id FROM "user" WHERE email = 'nyambura.mbugua@example.com'), 'Fully secure, railings', '2026-02-25 12:00:00'),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f901221', (SELECT user_id FROM "user" WHERE email = 'anyango.atieno@example.com'), (SELECT user_id FROM "user" WHERE email = 'wanjiku.muthoni@example.com'), 'Desert Camp activities?', '2026-03-20 13:00:00'),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f901222', (SELECT user_id FROM "user" WHERE email = 'wanjiku.muthoni@example.com'), (SELECT user_id FROM "user" WHERE email = 'anyango.atieno@example.com'), 'Camel rides, star gazing', '2026-03-20 14:00:00'),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f901223', (SELECT user_id FROM "user" WHERE email = 'cherop.kiptai@example.com'), (SELECT user_id FROM "user" WHERE email = 'njeri.wambui@example.com'), 'Valley Cottage heating?', '2026-04-25 15:00:00'),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f901224', (SELECT user_id FROM "user" WHERE email = 'njeri.wambui@example.com'), (SELECT user_id FROM "user" WHERE email = 'cherop.kiptai@example.com'), 'Heaters provided', '2026-04-25 16:00:00'),
('6f7a8b9c-0d1e-2f3a-4b5c-6d7e8f901225', (SELECT user_id FROM "user" WHERE email = 'adhiambo.awuor@example.com'), (SELECT user_id FROM "user" WHERE email = 'kiptoo.langat@example.com'), 'Highland Lodge check-out?', '2026-05-05 09:00:00');

-- Normalize the Database: Create Message_Content table and transfer message_body
DROP TABLE IF EXISTS Message_Content CASCADE;
CREATE TABLE Message_Content (
    message_id UUID PRIMARY KEY,
    message_body TEXT NOT NULL,
    CONSTRAINT fk_message FOREIGN KEY (message_id) REFERENCES message(message_id)
);

-- Transfer all message_id and message_body from message to Message_Content
INSERT INTO Message_Content (message_id, message_body)
SELECT message_id, message_body
FROM message;

-- Drop message_body column from message to complete normalization
ALTER TABLE message DROP COLUMN message_body;