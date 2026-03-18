<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ticket.aspx.cs" Inherits="WebApplication.Ticket" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kumari Cinemas - Ticket</title>
    <link href="SiteStyles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-shell">
            <header class="page-header">
                <div>
                    <h1>Ticket Management</h1>
                    <p class="page-subtitle">Create, update, and review ticket records.</p>
                </div>
                <a class="home-link" href="Default.aspx">Back To Home</a>
            </header>
            <section class="content-card">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="TICKETID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="TICKETID" HeaderText="TICKETID" ReadOnly="True" SortExpression="TICKETID" />
                    <asp:BoundField DataField="SEATNUMBER" HeaderText="SEATNUMBER" SortExpression="SEATNUMBER" />
                    <asp:BoundField DataField="TICKETPRICE" HeaderText="TICKETPRICE" SortExpression="TICKETPRICE" />
                    <asp:BoundField DataField="VALIDITY" HeaderText="VALIDITY" SortExpression="VALIDITY" />
                    <asp:BoundField DataField="BOOKINGID" HeaderText="BOOKINGID" SortExpression="BOOKINGID" />
                    <asp:BoundField DataField="POLICYID" HeaderText="POLICYID" SortExpression="POLICYID" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;TICKET&quot; WHERE &quot;TICKETID&quot; = :TICKETID" InsertCommand="INSERT INTO &quot;TICKET&quot; (&quot;TICKETID&quot;, &quot;SEATNUMBER&quot;, &quot;TICKETPRICE&quot;, &quot;VALIDITY&quot;, &quot;BOOKINGID&quot;, &quot;POLICYID&quot;) VALUES (:TICKETID, :SEATNUMBER, :TICKETPRICE, :VALIDITY, :BOOKINGID, :POLICYID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;TICKET&quot;" UpdateCommand="UPDATE &quot;TICKET&quot; SET &quot;SEATNUMBER&quot; = :SEATNUMBER, &quot;TICKETPRICE&quot; = :TICKETPRICE, &quot;VALIDITY&quot; = :VALIDITY, &quot;BOOKINGID&quot; = :BOOKINGID, &quot;POLICYID&quot; = :POLICYID WHERE &quot;TICKETID&quot; = :TICKETID">
                <DeleteParameters>
                    <asp:Parameter Name="TICKETID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="TICKETID" Type="Decimal" />
                    <asp:Parameter Name="SEATNUMBER" Type="String" />
                    <asp:Parameter Name="TICKETPRICE" Type="Decimal" />
                    <asp:Parameter Name="VALIDITY" Type="String" />
                    <asp:Parameter Name="BOOKINGID" Type="Decimal" />
                    <asp:Parameter Name="POLICYID" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SEATNUMBER" Type="String" />
                    <asp:Parameter Name="TICKETPRICE" Type="Decimal" />
                    <asp:Parameter Name="VALIDITY" Type="String" />
                    <asp:Parameter Name="BOOKINGID" Type="Decimal" />
                    <asp:Parameter Name="POLICYID" Type="Decimal" />
                    <asp:Parameter Name="TICKETID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="TICKETID" DataSourceID="SqlDataSource1" ForeColor="#333333">
            <EditItemTemplate>
                TICKETID:
                <asp:Label ID="TICKETIDLabel1" runat="server" Text='<%# Eval("TICKETID") %>' />
                <br />
                SEATNUMBER:
                <asp:TextBox ID="SEATNUMBERTextBox" runat="server" Text='<%# Bind("SEATNUMBER") %>' />
                <br />
                TICKETPRICE:
                <asp:TextBox ID="TICKETPRICETextBox" runat="server" Text='<%# Bind("TICKETPRICE") %>' />
                <br />
                VALIDITY:
                <asp:TextBox ID="VALIDITYTextBox" runat="server" Text='<%# Bind("VALIDITY") %>' />
                <br />
                BOOKINGID:
                <asp:TextBox ID="BOOKINGIDTextBox" runat="server" Text='<%# Bind("BOOKINGID") %>' />
                <br />
                POLICYID:
                <asp:TextBox ID="POLICYIDTextBox" runat="server" Text='<%# Bind("POLICYID") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                TICKETID:
                <asp:TextBox ID="TICKETIDTextBox" runat="server" Text='<%# Bind("TICKETID") %>' />
                <br />
                SEATNUMBER:
                <asp:TextBox ID="SEATNUMBERTextBox" runat="server" Text='<%# Bind("SEATNUMBER") %>' />
                <br />
                TICKETPRICE:
                <asp:TextBox ID="TICKETPRICETextBox" runat="server" Text='<%# Bind("TICKETPRICE") %>' />
                <br />
                VALIDITY:
                <asp:TextBox ID="VALIDITYTextBox" runat="server" Text='<%# Bind("VALIDITY") %>' />
                <br />
                BOOKINGID:
                <asp:TextBox ID="BOOKINGIDTextBox" runat="server" Text='<%# Bind("BOOKINGID") %>' />
                <br />
                POLICYID:
                <asp:TextBox ID="POLICYIDTextBox" runat="server" Text='<%# Bind("POLICYID") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                TICKETID:
                <asp:Label ID="TICKETIDLabel" runat="server" Text='<%# Eval("TICKETID") %>' />
                <br />
                SEATNUMBER:
                <asp:Label ID="SEATNUMBERLabel" runat="server" Text='<%# Bind("SEATNUMBER") %>' />
                <br />
                TICKETPRICE:
                <asp:Label ID="TICKETPRICELabel" runat="server" Text='<%# Bind("TICKETPRICE") %>' />
                <br />
                VALIDITY:
                <asp:Label ID="VALIDITYLabel" runat="server" Text='<%# Bind("VALIDITY") %>' />
                <br />
                BOOKINGID:
                <asp:Label ID="BOOKINGIDLabel" runat="server" Text='<%# Bind("BOOKINGID") %>' />
                <br />
                POLICYID:
                <asp:Label ID="POLICYIDLabel" runat="server" Text='<%# Bind("POLICYID") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        </asp:FormView>
        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
            <Series>
                <asp:Series Name="Series1" XValueMember="VALIDITY" YValueMembers="POLICYID">
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
                </section>
        </div>
    </form>
</body>
</html>


