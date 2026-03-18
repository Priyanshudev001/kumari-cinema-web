<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserTicket.aspx.cs" Inherits="WebApplication.UserTicket" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kumari Cinemas - User Ticket History</title>
    <link href="SiteStyles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-shell user-ticket-page">
            <header class="page-header">
                <div>
                    <h1>User Ticket History</h1>
                    <p class="page-subtitle">Customer details and purchased tickets for the last six months.</p>
                </div>
                <a class="home-link" href="Default.aspx">Back To Home</a>
            </header>

            <section class="content-card filter-card">
                <h2 class="section-title">Search Filters</h2>
                <div class="filter-grid">
                    <div class="filter-field">
                        <label for="txtSearch">Customer ID / Name</label>
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="full-input" placeholder="e.g. 1001 or Nimal" />
                    </div>
                    <div class="filter-field">
                        <label for="ddlPaymentMethod">Payment Method</label>
                        <asp:DropDownList ID="ddlPaymentMethod" runat="server" CssClass="full-input" AppendDataBoundItems="True" DataSourceID="SqlDataSourcePaymentMethods" DataTextField="PAYMENTMETHOD" DataValueField="PAYMENTMETHOD">
                            <asp:ListItem Text="All Methods" Value="" />
                        </asp:DropDownList>
                    </div>
                    <div class="filter-actions">
                        <asp:Button ID="btnApply" runat="server" Text="Apply Filters" CssClass="btn-primary" OnClick="btnApply_Click" />
                        <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn-secondary" OnClick="btnReset_Click" CausesValidation="False" />
                    </div>
                </div>
            </section>

            <section class="summary-grid">
                <article class="summary-card">
                    <span class="summary-label">Total Customers</span>
                    <asp:Label ID="lblTotalCustomers" runat="server" CssClass="summary-value" Text="0" />
                </article>
                <article class="summary-card">
                    <span class="summary-label">Total Tickets</span>
                    <asp:Label ID="lblTotalTickets" runat="server" CssClass="summary-value" Text="0" />
                </article>
                <article class="summary-card">
                    <span class="summary-label">Total Revenue</span>
                    <asp:Label ID="lblTotalRevenue" runat="server" CssClass="summary-value" Text="0.00" />
                </article>
                <article class="summary-card">
                    <span class="summary-label">Report Window</span>
                    <span class="summary-value small">Last 6 Months</span>
                </article>
            </section>

            <section class="content-card">
                <h2 class="section-title">Ticket Purchase Details</h2>
                <asp:GridView ID="gvUserTickets" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceUserTicket" CssClass="user-ticket-grid" AllowSorting="True" EmptyDataText="No ticket purchases found in the last six months for the selected filters.">
                    <Columns>
                        <asp:BoundField DataField="CUSTOMERID" HeaderText="Customer ID" SortExpression="CUSTOMERID" />
                        <asp:BoundField DataField="CUSTOMERNAME" HeaderText="Customer Name" SortExpression="CUSTOMERNAME" />
                        <asp:BoundField DataField="EMAIL" HeaderText="Email" SortExpression="EMAIL" />
                        <asp:BoundField DataField="TICKETID" HeaderText="Ticket ID" SortExpression="TICKETID" />
                        <asp:BoundField DataField="SEATNUMBER" HeaderText="Seat" SortExpression="SEATNUMBER" />
                        <asp:BoundField DataField="TICKETPRICE" HeaderText="Ticket Price" SortExpression="TICKETPRICE" DataFormatString="{0:N2}" HtmlEncode="False" />
                        <asp:BoundField DataField="MOVIETITLE" HeaderText="Movie" SortExpression="MOVIETITLE" />
                        <asp:BoundField DataField="SHOWTIME" HeaderText="Show Time" SortExpression="SHOWTIME" DataFormatString="{0:dd-MMM-yyyy hh:mm tt}" HtmlEncode="False" />
                        <asp:BoundField DataField="BOOKINGTIME" HeaderText="Booking Time" SortExpression="BOOKINGTIME" DataFormatString="{0:dd-MMM-yyyy hh:mm tt}" HtmlEncode="False" />
                        <asp:BoundField DataField="PAYMENTMETHOD" HeaderText="Payment" SortExpression="PAYMENTMETHOD" />
                    </Columns>
                </asp:GridView>
            </section>

            <section class="content-card chart-card">
                <h2 class="section-title">Tickets By Payment Method</h2>
                <asp:Chart ID="chartPaymentMethod" runat="server" Width="980px" Height="320px" CssClass="user-ticket-chart">
                    <Series>
                        <asp:Series Name="Tickets" XValueMember="PAYMENTMETHOD" YValueMembers="TICKETCOUNT" YValuesPerPoint="1" ChartType="Column" IsValueShownAsLabel="True" />
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="MainArea">
                        </asp:ChartArea>
                    </ChartAreas>
                    <Legends>
                        <asp:Legend Name="Legend1" Docking="Bottom" />
                    </Legends>
                </asp:Chart>
            </section>

            <asp:SqlDataSource ID="SqlDataSourceUserTicket" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" OnSelecting="SqlDataSourceUserTicket_Selecting"
                SelectCommand="SELECT c.customerid, c.customername, c.email, t.ticketid, t.seatnumber, t.ticketprice, m.movietitle, s.showtime, b.bookingtime, p.paymentmethod FROM CUSTOMER c JOIN BOOKING b ON c.customerid = b.customerid JOIN TICKET t ON b.bookingid = t.bookingid JOIN SHOW s ON b.showid = s.showid JOIN MOVIE m ON s.movieid = m.movieid JOIN PAYMENT p ON t.ticketid = p.ticketid WHERE b.bookingtime >= ADD_MONTHS(SYSDATE,-6) AND (:searchText IS NULL OR LOWER(c.customername) LIKE '%' || LOWER(:searchText) || '%' OR TO_CHAR(c.customerid) LIKE '%' || :searchText || '%') AND (:paymentMethod IS NULL OR p.paymentmethod = :paymentMethod) ORDER BY c.customername, b.bookingtime DESC">
                <SelectParameters>
                    <asp:Parameter Name="searchText" Type="String" />
                    <asp:Parameter Name="paymentMethod" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSourcePaymentMethods" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT paymentmethod FROM PAYMENT WHERE paymentmethod IS NOT NULL ORDER BY paymentmethod" />
        </div>
    </form>
</body>
</html>
