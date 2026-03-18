<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kumari Cinemas - Home</title>
    <style type="text/css">
        :root {
            --bg: #f8f1e5;
            --ink: #1f1f1f;
            --card: #fffdf8;
            --brand: #7a1f1f;
            --brand-2: #c48f2f;
            --shadow: rgba(0, 0, 0, 0.12);
        }

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
            background: radial-gradient(circle at top right, #ffe9bf 0, #f8f1e5 45%, #efe3cf 100%);
            color: var(--ink);
            min-height: 100vh;
        }

        .wrap {
            max-width: 1120px;
            margin: 0 auto;
            padding: 32px 16px 40px;
        }

        .hero {
            background: linear-gradient(140deg, #5a1313, #7a1f1f 60%, #a93a2f);
            color: #fff;
            border-radius: 18px;
            padding: 30px 24px;
            box-shadow: 0 10px 24px var(--shadow);
            margin-bottom: 24px;
        }

        .hero h1 {
            margin: 0 0 6px;
            font-size: 2rem;
        }

        .hero p {
            margin: 0;
            opacity: 0.95;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(210px, 1fr));
            gap: 14px;
        }

        .card {
            text-decoration: none;
            color: var(--ink);
            background: var(--card);
            border: 1px solid #eddcc0;
            border-left: 5px solid var(--brand-2);
            border-radius: 14px;
            padding: 16px;
            box-shadow: 0 6px 14px rgba(0, 0, 0, 0.07);
            transition: transform 0.18s ease, box-shadow 0.18s ease;
        }

        .card:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 18px rgba(0, 0, 0, 0.14);
        }

        .card h2 {
            margin: 0 0 6px;
            color: var(--brand);
            font-size: 1.15rem;
        }

        .card p {
            margin: 0;
            color: #4b4b4b;
            font-size: 0.92rem;
            line-height: 1.35;
        }

        .footer-note {
            margin-top: 18px;
            font-size: 0.9rem;
            color: #5a5a5a;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrap">
            <section class="hero">
                <h1>Kumari Cinemas Management</h1>
                <p>Select an entity to manage records.</p>
            </section>

            <section class="grid">
                <a class="card" href="Booking.aspx">
                    <h2>Booking</h2>
                    <p>Manage customer booking details and booking times.</p>
                </a>
                <a class="card" href="Customer.aspx">
                    <h2>Customer</h2>
                    <p>Maintain customer master data and contact information.</p>
                </a>
                <a class="card" href="Hall.aspx">
                    <h2>Hall</h2>
                    <p>Configure halls and seating capacity information.</p>
                </a>
                <a class="card" href="Movie.aspx">
                    <h2>Movie</h2>
                    <p>Update movie catalog, genre, and release details.</p>
                </a>
                <a class="card" href="Payment.aspx">
                    <h2>Payment</h2>
                    <p>Track payment transactions and payment methods.</p>
                </a>
                <a class="card" href="Pricing.aspx">
                    <h2>Pricing</h2>
                    <p>Manage ticket pricing rules and related values.</p>
                </a>
                <a class="card" href="Show.aspx">
                    <h2>Show</h2>
                    <p>Maintain show schedules and show-level mappings.</p>
                </a>
                <a class="card" href="Theatre.aspx">
                    <h2>Theatre</h2>
                    <p>Maintain theatre details and location information.</p>
                </a>
                <a class="card" href="Ticket.aspx">
                    <h2>Ticket</h2>
                    <p>Handle issued ticket records and ticket mapping.</p>
                </a>
                <a class="card" href="UserTicket.aspx">
                    <h2>User Ticket</h2>
                    <p>View customer details and ticket purchases for the last six months.</p>
                </a>
                <a class="card" href="TheaterCityHall.aspx">
                    <h2>TheaterCityHall</h2>
                    <p>View theatre, hall, movie, genre, and showtime details together.</p>
                </a>
                <a class="card" href="MovieTheatherCityHallOccupancyPerformer.aspx">
                    <h2>Occupancy Performer</h2>
                    <p>Top 3 theatre-city-halls by occupancy percentage for a selected movie.</p>
                </a>
            </section>

            
        </div>
    </form>
</body>
</html>
