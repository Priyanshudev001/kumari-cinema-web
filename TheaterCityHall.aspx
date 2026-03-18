<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TheaterCityHall.aspx.cs" Inherits="WebApplication.TheaterCityHall" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kumari Cinemas - TheaterCityHall Movie Report</title>
    <link href="SiteStyles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-shell theatre-hall-page">
            <header class="page-header">
                <div>
                    <h1>TheaterCityHall Movie Report</h1>
                    <p class="page-subtitle">Theatre, hall, movie details and show times in one place.</p>
                </div>
                <a class="home-link" href="Default.aspx">Back To Home</a>
            </header>

            <section class="content-card filter-card">
                <h2 class="section-title">Search Filters</h2>
                <div class="filter-grid theatre-filter-grid">
                    <div class="filter-field">
                        <label for="txtTheatre">Theatre Name</label>
                        <asp:TextBox ID="txtTheatre" runat="server" CssClass="full-input" placeholder="e.g. Liberty" />
                    </div>
                    <div class="filter-field">
                        <label for="txtLocation">Location</label>
                        <asp:TextBox ID="txtLocation" runat="server" CssClass="full-input" placeholder="e.g. Colombo" />
                    </div>
                    <div class="filter-field">
                        <label for="ddlGenre">Genre</label>
                        <asp:DropDownList ID="ddlGenre" runat="server" CssClass="full-input" AppendDataBoundItems="True" DataSourceID="SqlDataSourceGenres" DataTextField="GENRE" DataValueField="GENRE">
                            <asp:ListItem Text="All Genres" Value="" />
                        </asp:DropDownList>
                    </div>
                    <div class="filter-actions">
                        <asp:Button ID="btnApply" runat="server" Text="Apply Filters" CssClass="btn-primary" OnClick="btnApply_Click" />
                        <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn-secondary" OnClick="btnReset_Click" CausesValidation="False" />
                    </div>
                </div>
            </section>

            <section class="summary-grid theatre-summary-grid">
                <article class="summary-card">
                    <span class="summary-label">Theatres</span>
                    <asp:Label ID="lblTotalTheatres" runat="server" CssClass="summary-value" Text="0" />
                </article>
                <article class="summary-card">
                    <span class="summary-label">Halls</span>
                    <asp:Label ID="lblTotalHalls" runat="server" CssClass="summary-value" Text="0" />
                </article>
                <article class="summary-card">
                    <span class="summary-label">Movies</span>
                    <asp:Label ID="lblTotalMovies" runat="server" CssClass="summary-value" Text="0" />
                </article>
                <article class="summary-card">
                    <span class="summary-label">Show Slots</span>
                    <asp:Label ID="lblTotalShows" runat="server" CssClass="summary-value" Text="0" />
                </article>
            </section>

            <section class="content-card">
                <h2 class="section-title">Theatre-Hall Movie Schedule</h2>
                <asp:GridView ID="gvTheaterCityHall" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceTheaterCityHall" CssClass="user-ticket-grid" AllowSorting="True" EmptyDataText="No records found for current filters.">
                    <Columns>
                        <asp:BoundField DataField="THEATREID" HeaderText="Theatre ID" SortExpression="THEATREID" />
                        <asp:BoundField DataField="THEATRENAME" HeaderText="Theatre" SortExpression="THEATRENAME" />
                        <asp:BoundField DataField="LOCATION" HeaderText="Location" SortExpression="LOCATION" />
                        <asp:BoundField DataField="HALLNUMBER" HeaderText="Hall Number" SortExpression="HALLNUMBER" />
                        <asp:BoundField DataField="MOVIETITLE" HeaderText="Movie" SortExpression="MOVIETITLE" />
                        <asp:BoundField DataField="GENRE" HeaderText="Genre" SortExpression="GENRE" />
                        <asp:BoundField DataField="SHOWTIME" HeaderText="Show Time" SortExpression="SHOWTIME" DataFormatString="{0:dd-MMM-yyyy hh:mm tt}" HtmlEncode="False" />
                    </Columns>
                </asp:GridView>
            </section>

            <section class="content-card chart-card">
                <h2 class="section-title">Show Count By Theatre</h2>
                <asp:Chart ID="chartShowsByTheatre" runat="server" Width="980px" Height="320px" CssClass="user-ticket-chart">
                    <Series>
                        <asp:Series Name="Shows" XValueMember="THEATRENAME" YValueMembers="SHOWCOUNT" ChartType="Column" IsValueShownAsLabel="True" />
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="MainArea"></asp:ChartArea>
                    </ChartAreas>
                    <Legends>
                        <asp:Legend Name="Legend1" Docking="Bottom"></asp:Legend>
                    </Legends>
                </asp:Chart>
            </section>

            <asp:SqlDataSource ID="SqlDataSourceTheaterCityHall" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                SelectCommand="SELECT t.theatreid, t.theatrename, t.location, h.hallnumber, m.movietitle, m.genre, s.showtime FROM THEATRE t JOIN HALL h ON t.theatreid = h.theatreid JOIN SHOW s ON h.hallid = s.hallid JOIN MOVIE m ON s.movieid = m.movieid WHERE t.theatreid = 1 ORDER BY t.theatrename, h.hallnumber">
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSourceGenres" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT genre FROM MOVIE WHERE genre IS NOT NULL ORDER BY genre"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
