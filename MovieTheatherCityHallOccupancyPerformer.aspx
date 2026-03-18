<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MovieTheatherCityHallOccupancyPerformer.aspx.cs" Inherits="WebApplication.MovieTheatherCityHallOccupancyPerformer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kumari Cinemas - Movie Theatre Hall Occupancy Performer</title>
    <link href="SiteStyles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-shell occupancy-page">
            <header class="page-header">
                <div>
                    <h1>Movie Occupancy Top Performer</h1>
                    <p class="page-subtitle">Top 3 theatre-city-halls by seat occupancy percentage (paid tickets only).</p>
                </div>
                <a class="home-link" href="Default.aspx">Back To Home</a>
            </header>

            <section class="content-card filter-card">
                <h2 class="section-title">Movie Filter</h2>
                <div class="filter-grid occupancy-filter-grid">
                    <div class="filter-field">
                        <label for="ddlMovieId">Movie ID</label>
                        <asp:DropDownList ID="ddlMovieId" runat="server" CssClass="full-input" DataSourceID="SqlDataSourceMovies" DataTextField="MOVIE_DISPLAY" DataValueField="MOVIEID"></asp:DropDownList>
                    </div>
                    <div class="filter-actions">
                        <asp:Button ID="btnApply" runat="server" Text="Show Top 3" CssClass="btn-primary" OnClick="btnApply_Click" />
                    </div>
                </div>
            </section>

            <section class="summary-grid occupancy-summary-grid">
                <article class="summary-card">
                    <span class="summary-label">Selected Movie</span>
                    <asp:Label ID="lblMovie" runat="server" CssClass="summary-value small" Text="-" />
                </article>
                <article class="summary-card">
                    <span class="summary-label">Top Performer</span>
                    <asp:Label ID="lblTopTheatre" runat="server" CssClass="summary-value small" Text="-" />
                </article>
                <article class="summary-card">
                    <span class="summary-label">Best Occupancy</span>
                    <asp:Label ID="lblBestOccupancy" runat="server" CssClass="summary-value" Text="0%" />
                </article>
                <article class="summary-card">
                    <span class="summary-label">Total Seats Booked</span>
                    <asp:Label ID="lblTotalSeatsBooked" runat="server" CssClass="summary-value" Text="0" />
                </article>
            </section>

            <section class="content-card">
                <h2 class="section-title">Top 3 Occupancy Details</h2>
                <asp:GridView ID="gvOccupancy" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceOccupancy" CssClass="user-ticket-grid" AllowSorting="True" EmptyDataText="No occupancy data found for this movie.">
                    <Columns>
                        <asp:BoundField DataField="MOVIEID" HeaderText="Movie ID" SortExpression="MOVIEID" />
                        <asp:BoundField DataField="MOVIETITLE" HeaderText="Movie" SortExpression="MOVIETITLE" />
                        <asp:BoundField DataField="THEATRENAME" HeaderText="Theatre" SortExpression="THEATRENAME" />
                        <asp:BoundField DataField="LOCATION" HeaderText="Location" SortExpression="LOCATION" />
                        <asp:BoundField DataField="HALLNUMBER" HeaderText="Hall Number" SortExpression="HALLNUMBER" />
                        <asp:BoundField DataField="CAPACITY" HeaderText="Capacity" SortExpression="CAPACITY" />
                        <asp:BoundField DataField="SEATS_BOOKED" HeaderText="Seats Booked" SortExpression="SEATS_BOOKED" />
                        <asp:BoundField DataField="OCCUPANCY_PERCENTAGE" HeaderText="Occupancy %" SortExpression="OCCUPANCY_PERCENTAGE" DataFormatString="{0:N2}" HtmlEncode="False" />
                    </Columns>
                </asp:GridView>
            </section>

            <section class="content-card chart-card">
                <h2 class="section-title">Occupancy Percentage By Performer</h2>
                <asp:Chart ID="chartOccupancy" runat="server" Width="980px" Height="320px" CssClass="user-ticket-chart">
                    <Series>
                        <asp:Series Name="Occupancy" XValueMember="THEATRE_HALL" YValueMembers="OCCUPANCY_PERCENTAGE" ChartType="Bar" IsValueShownAsLabel="True" />
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="MainArea"></asp:ChartArea>
                    </ChartAreas>
                    <Legends>
                        <asp:Legend Name="Legend1" Docking="Bottom"></asp:Legend>
                    </Legends>
                </asp:Chart>
            </section>

            <asp:SqlDataSource ID="SqlDataSourceOccupancy" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" OnSelecting="SqlDataSourceOccupancy_Selecting"
                SelectCommand="SELECT * FROM ( SELECT m.movieid, m.movietitle, t.theatrename, t.location, h.hallnumber, h.capacity, COUNT(tk.ticketid) AS seats_booked, ROUND((COUNT(tk.ticketid) / h.capacity) * 100, 2) AS occupancy_percentage FROM MOVIE m JOIN SHOW s ON m.movieid = s.movieid JOIN HALL h ON s.hallid = h.hallid JOIN THEATRE t ON h.theatreid = t.theatreid JOIN BOOKING b ON s.showid = b.showid JOIN TICKET tk ON b.bookingid = tk.bookingid JOIN PAYMENT p ON tk.ticketid = p.ticketid WHERE m.movieid = :movieId GROUP BY m.movieid, m.movietitle, t.theatrename, t.location, h.hallnumber, h.capacity ORDER BY occupancy_percentage DESC ) WHERE ROWNUM <= 3">
                <SelectParameters>
                    <asp:Parameter Name="movieId" Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSourceMovies" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT movieid, movietitle, (TO_CHAR(movieid) || ' - ' || movietitle) AS movie_display FROM MOVIE ORDER BY movieid">
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
