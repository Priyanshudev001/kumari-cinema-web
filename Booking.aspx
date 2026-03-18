<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="WebApplication.WebForm1" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kumari Cinemas - Booking</title>
    <link href="SiteStyles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-shell">
            <header class="page-header">
                <div>
                    <h1>Booking Management</h1>
                    <p class="page-subtitle">Create, update, and review booking records.</p>
                </div>
                <a class="home-link" href="Default.aspx">Back To Home</a>
            </header>
            <section class="content-card">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="BOOKINGID" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="BOOKINGID" HeaderText="BOOKINGID" ReadOnly="True" SortExpression="BOOKINGID" />
                <asp:BoundField DataField="BOOKINGTIME" HeaderText="BOOKINGTIME" SortExpression="BOOKINGTIME" />
                <asp:BoundField DataField="CUSTOMERID" HeaderText="CUSTOMERID" SortExpression="CUSTOMERID" />
                <asp:BoundField DataField="SHOWID" HeaderText="SHOWID" SortExpression="SHOWID" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;BOOKING&quot; WHERE &quot;BOOKINGID&quot; = :BOOKINGID" InsertCommand="INSERT INTO &quot;BOOKING&quot; (&quot;BOOKINGID&quot;, &quot;BOOKINGTIME&quot;, &quot;CUSTOMERID&quot;, &quot;SHOWID&quot;) VALUES (:BOOKINGID, :BOOKINGTIME, :CUSTOMERID, :SHOWID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;BOOKING&quot;" UpdateCommand="UPDATE &quot;BOOKING&quot; SET &quot;BOOKINGTIME&quot; = :BOOKINGTIME, &quot;CUSTOMERID&quot; = :CUSTOMERID, &quot;SHOWID&quot; = :SHOWID WHERE &quot;BOOKINGID&quot; = :BOOKINGID">
            <DeleteParameters>
                <asp:Parameter Name="BOOKINGID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="BOOKINGID" Type="Decimal" />
                <asp:Parameter Name="BOOKINGTIME" Type="DateTime" />
                <asp:Parameter Name="CUSTOMERID" Type="Decimal" />
                <asp:Parameter Name="SHOWID" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="BOOKINGTIME" Type="DateTime" />
                <asp:Parameter Name="CUSTOMERID" Type="Decimal" />
                <asp:Parameter Name="SHOWID" Type="Decimal" />
                <asp:Parameter Name="BOOKINGID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="BOOKINGID" DataSourceID="SqlDataSource1" ForeColor="#333333">
            <EditItemTemplate>
                BOOKINGID:
                <asp:Label ID="BOOKINGIDLabel1" runat="server" Text='<%# Eval("BOOKINGID") %>' />
                <br />
                BOOKINGTIME:
                <asp:TextBox ID="BOOKINGTIMETextBox" runat="server" Text='<%# Bind("BOOKINGTIME") %>' />
                <br />
                CUSTOMERID:
                <asp:TextBox ID="CUSTOMERIDTextBox" runat="server" Text='<%# Bind("CUSTOMERID") %>' />
                <br />
                SHOWID:
                <asp:TextBox ID="SHOWIDTextBox" runat="server" Text='<%# Bind("SHOWID") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                BOOKINGID:
                <asp:TextBox ID="BOOKINGIDTextBox" runat="server" Text='<%# Bind("BOOKINGID") %>' />
                <br />
                BOOKINGTIME:
                <asp:TextBox ID="BOOKINGTIMETextBox" runat="server" Text='<%# Bind("BOOKINGTIME") %>' />
                <br />
                CUSTOMERID:
                <asp:TextBox ID="CUSTOMERIDTextBox" runat="server" Text='<%# Bind("CUSTOMERID") %>' />
                <br />
                SHOWID:
                <asp:TextBox ID="SHOWIDTextBox" runat="server" Text='<%# Bind("SHOWID") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                BOOKINGID:
                <asp:Label ID="BOOKINGIDLabel" runat="server" Text='<%# Eval("BOOKINGID") %>' />
                <br />
                BOOKINGTIME:
                <asp:Label ID="BOOKINGTIMELabel" runat="server" Text='<%# Bind("BOOKINGTIME") %>' />
                <br />
                CUSTOMERID:
                <asp:Label ID="CUSTOMERIDLabel" runat="server" Text='<%# Bind("CUSTOMERID") %>' />
                <br />
                SHOWID:
                <asp:Label ID="SHOWIDLabel" runat="server" Text='<%# Bind("SHOWID") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        </asp:FormView>
        <p>
            <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
                <series>
                    <asp:Series Name="Series1" XValueMember="BOOKINGID" YValueMembers="CUSTOMERID">
                    </asp:Series>
                </series>
                <chartareas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </chartareas>
            </asp:Chart>
        </p>
                </section>
        </div>
    </form>
</body>
</html>


