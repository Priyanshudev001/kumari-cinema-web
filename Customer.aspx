<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="WebApplication.Customer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kumari Cinemas - Customer</title>
    <link href="SiteStyles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-shell">
            <header class="page-header">
                <div>
                    <h1>Customer Management</h1>
                    <p class="page-subtitle">Create, update, and review customer records.</p>
                </div>
                <a class="home-link" href="Default.aspx">Back To Home</a>
            </header>
            <section class="content-card">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="CUSTOMERID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="CUSTOMERID" HeaderText="CUSTOMERID" ReadOnly="True" SortExpression="CUSTOMERID" />
                <asp:BoundField DataField="CUSTOMERNAME" HeaderText="CUSTOMERNAME" SortExpression="CUSTOMERNAME" />
                <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                <asp:BoundField DataField="PASSWORD" HeaderText="PASSWORD" SortExpression="PASSWORD" />
                <asp:BoundField DataField="CUSTOMEREXPERIENCE" HeaderText="CUSTOMEREXPERIENCE" SortExpression="CUSTOMEREXPERIENCE" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;CUSTOMER&quot; WHERE &quot;CUSTOMERID&quot; = :CUSTOMERID" InsertCommand="INSERT INTO &quot;CUSTOMER&quot; (&quot;CUSTOMERID&quot;, &quot;CUSTOMERNAME&quot;, &quot;EMAIL&quot;, &quot;PASSWORD&quot;, &quot;CUSTOMEREXPERIENCE&quot;) VALUES (:CUSTOMERID, :CUSTOMERNAME, :EMAIL, :PASSWORD, :CUSTOMEREXPERIENCE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;CUSTOMER&quot;" UpdateCommand="UPDATE &quot;CUSTOMER&quot; SET &quot;CUSTOMERNAME&quot; = :CUSTOMERNAME, &quot;EMAIL&quot; = :EMAIL, &quot;PASSWORD&quot; = :PASSWORD, &quot;CUSTOMEREXPERIENCE&quot; = :CUSTOMEREXPERIENCE WHERE &quot;CUSTOMERID&quot; = :CUSTOMERID">
            <DeleteParameters>
                <asp:Parameter Name="CUSTOMERID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CUSTOMERID" Type="Decimal" />
                <asp:Parameter Name="CUSTOMERNAME" Type="String" />
                <asp:Parameter Name="EMAIL" Type="String" />
                <asp:Parameter Name="PASSWORD" Type="String" />
                <asp:Parameter Name="CUSTOMEREXPERIENCE" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CUSTOMERNAME" Type="String" />
                <asp:Parameter Name="EMAIL" Type="String" />
                <asp:Parameter Name="PASSWORD" Type="String" />
                <asp:Parameter Name="CUSTOMEREXPERIENCE" Type="String" />
                <asp:Parameter Name="CUSTOMERID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="CUSTOMERID" DataSourceID="SqlDataSource1" ForeColor="#333333">
            <EditItemTemplate>
                CUSTOMERID:
                <asp:Label ID="CUSTOMERIDLabel1" runat="server" Text='<%# Eval("CUSTOMERID") %>' />
                <br />
                CUSTOMERNAME:
                <asp:TextBox ID="CUSTOMERNAMETextBox" runat="server" Text='<%# Bind("CUSTOMERNAME") %>' />
                <br />
                EMAIL:
                <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' />
                <br />
                PASSWORD:
                <asp:TextBox ID="PASSWORDTextBox" runat="server" Text='<%# Bind("PASSWORD") %>' />
                <br />
                CUSTOMEREXPERIENCE:
                <asp:TextBox ID="CUSTOMEREXPERIENCETextBox" runat="server" Text='<%# Bind("CUSTOMEREXPERIENCE") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                CUSTOMERID:
                <asp:TextBox ID="CUSTOMERIDTextBox" runat="server" Text='<%# Bind("CUSTOMERID") %>' />
                <br />
                CUSTOMERNAME:
                <asp:TextBox ID="CUSTOMERNAMETextBox" runat="server" Text='<%# Bind("CUSTOMERNAME") %>' />
                <br />
                EMAIL:
                <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' />
                <br />
                PASSWORD:
                <asp:TextBox ID="PASSWORDTextBox" runat="server" Text='<%# Bind("PASSWORD") %>' />
                <br />
                CUSTOMEREXPERIENCE:
                <asp:TextBox ID="CUSTOMEREXPERIENCETextBox" runat="server" Text='<%# Bind("CUSTOMEREXPERIENCE") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                CUSTOMERID:
                <asp:Label ID="CUSTOMERIDLabel" runat="server" Text='<%# Eval("CUSTOMERID") %>' />
                <br />
                CUSTOMERNAME:
                <asp:Label ID="CUSTOMERNAMELabel" runat="server" Text='<%# Bind("CUSTOMERNAME") %>' />
                <br />
                EMAIL:
                <asp:Label ID="EMAILLabel" runat="server" Text='<%# Bind("EMAIL") %>' />
                <br />
                PASSWORD:
                <asp:Label ID="PASSWORDLabel" runat="server" Text='<%# Bind("PASSWORD") %>' />
                <br />
                CUSTOMEREXPERIENCE:
                <asp:Label ID="CUSTOMEREXPERIENCELabel" runat="server" Text='<%# Bind("CUSTOMEREXPERIENCE") %>' />
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
                    <asp:Series Name="Series1" XValueMember="CUSTOMERNAME" YValueMembers="CUSTOMERID">
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


