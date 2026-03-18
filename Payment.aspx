<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="WebApplication.Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kumari Cinemas - Payment</title>
    <link href="SiteStyles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-shell">
            <header class="page-header">
                <div>
                    <h1>Payment Management</h1>
                    <p class="page-subtitle">Create, update, and review payment records.</p>
                </div>
                <a class="home-link" href="Default.aspx">Back To Home</a>
            </header>
            <section class="content-card">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="PAYMENTID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="PAYMENTID" HeaderText="PAYMENTID" ReadOnly="True" SortExpression="PAYMENTID" />
                <asp:BoundField DataField="AMOUNT" HeaderText="AMOUNT" SortExpression="AMOUNT" />
                <asp:BoundField DataField="PAYMENTTIME" HeaderText="PAYMENTTIME" SortExpression="PAYMENTTIME" />
                <asp:BoundField DataField="PAYMENTMETHOD" HeaderText="PAYMENTMETHOD" SortExpression="PAYMENTMETHOD" />
                <asp:BoundField DataField="TICKETID" HeaderText="TICKETID" SortExpression="TICKETID" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;PAYMENT&quot; WHERE &quot;PAYMENTID&quot; = :PAYMENTID" InsertCommand="INSERT INTO &quot;PAYMENT&quot; (&quot;PAYMENTID&quot;, &quot;AMOUNT&quot;, &quot;PAYMENTTIME&quot;, &quot;PAYMENTMETHOD&quot;, &quot;TICKETID&quot;) VALUES (:PAYMENTID, :AMOUNT, :PAYMENTTIME, :PAYMENTMETHOD, :TICKETID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;PAYMENT&quot;" UpdateCommand="UPDATE &quot;PAYMENT&quot; SET &quot;AMOUNT&quot; = :AMOUNT, &quot;PAYMENTTIME&quot; = :PAYMENTTIME, &quot;PAYMENTMETHOD&quot; = :PAYMENTMETHOD, &quot;TICKETID&quot; = :TICKETID WHERE &quot;PAYMENTID&quot; = :PAYMENTID">
            <DeleteParameters>
                <asp:Parameter Name="PAYMENTID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="PAYMENTID" Type="Decimal" />
                <asp:Parameter Name="AMOUNT" Type="Decimal" />
                <asp:Parameter Name="PAYMENTTIME" Type="DateTime" />
                <asp:Parameter Name="PAYMENTMETHOD" Type="String" />
                <asp:Parameter Name="TICKETID" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="AMOUNT" Type="Decimal" />
                <asp:Parameter Name="PAYMENTTIME" Type="DateTime" />
                <asp:Parameter Name="PAYMENTMETHOD" Type="String" />
                <asp:Parameter Name="TICKETID" Type="Decimal" />
                <asp:Parameter Name="PAYMENTID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="PAYMENTID" DataSourceID="SqlDataSource1" ForeColor="#333333">
            <EditItemTemplate>
                PAYMENTID:
                <asp:Label ID="PAYMENTIDLabel1" runat="server" Text='<%# Eval("PAYMENTID") %>' />
                <br />
                AMOUNT:
                <asp:TextBox ID="AMOUNTTextBox" runat="server" Text='<%# Bind("AMOUNT") %>' />
                <br />
                PAYMENTTIME:
                <asp:TextBox ID="PAYMENTTIMETextBox" runat="server" Text='<%# Bind("PAYMENTTIME") %>' />
                <br />
                PAYMENTMETHOD:
                <asp:TextBox ID="PAYMENTMETHODTextBox" runat="server" Text='<%# Bind("PAYMENTMETHOD") %>' />
                <br />
                TICKETID:
                <asp:TextBox ID="TICKETIDTextBox" runat="server" Text='<%# Bind("TICKETID") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                PAYMENTID:
                <asp:TextBox ID="PAYMENTIDTextBox" runat="server" Text='<%# Bind("PAYMENTID") %>' />
                <br />
                AMOUNT:
                <asp:TextBox ID="AMOUNTTextBox" runat="server" Text='<%# Bind("AMOUNT") %>' />
                <br />
                PAYMENTTIME:
                <asp:TextBox ID="PAYMENTTIMETextBox" runat="server" Text='<%# Bind("PAYMENTTIME") %>' />
                <br />
                PAYMENTMETHOD:
                <asp:TextBox ID="PAYMENTMETHODTextBox" runat="server" Text='<%# Bind("PAYMENTMETHOD") %>' />
                <br />
                TICKETID:
                <asp:TextBox ID="TICKETIDTextBox" runat="server" Text='<%# Bind("TICKETID") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                PAYMENTID:
                <asp:Label ID="PAYMENTIDLabel" runat="server" Text='<%# Eval("PAYMENTID") %>' />
                <br />
                AMOUNT:
                <asp:Label ID="AMOUNTLabel" runat="server" Text='<%# Bind("AMOUNT") %>' />
                <br />
                PAYMENTTIME:
                <asp:Label ID="PAYMENTTIMELabel" runat="server" Text='<%# Bind("PAYMENTTIME") %>' />
                <br />
                PAYMENTMETHOD:
                <asp:Label ID="PAYMENTMETHODLabel" runat="server" Text='<%# Bind("PAYMENTMETHOD") %>' />
                <br />
                TICKETID:
                <asp:Label ID="TICKETIDLabel" runat="server" Text='<%# Bind("TICKETID") %>' />
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
                <Series>
                    <asp:Series Name="Series1" XValueMember="PAYMENTTIME" YValueMembers="TICKETID">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
        </p>
                </section>
        </div>
    </form>
</body>
</html>


