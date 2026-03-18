<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pricing.aspx.cs" Inherits="WebApplication.Pricing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kumari Cinemas - Pricing</title>
    <link href="SiteStyles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-shell">
            <header class="page-header">
                <div>
                    <h1>Pricing Management</h1>
                    <p class="page-subtitle">Create, update, and review pricing records.</p>
                </div>
                <a class="home-link" href="Default.aspx">Back To Home</a>
            </header>
            <section class="content-card">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="POLICYID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="POLICYID" HeaderText="POLICYID" ReadOnly="True" SortExpression="POLICYID" />
                    <asp:BoundField DataField="BASEPRICE" HeaderText="BASEPRICE" SortExpression="BASEPRICE" />
                    <asp:BoundField DataField="HOLIDAYPRICEMOD" HeaderText="HOLIDAYPRICEMOD" SortExpression="HOLIDAYPRICEMOD" />
                    <asp:BoundField DataField="NEWRELEASEMOD" HeaderText="NEWRELEASEMOD" SortExpression="NEWRELEASEMOD" />
                    <asp:BoundField DataField="CANCELLATIONMOD" HeaderText="CANCELLATIONMOD" SortExpression="CANCELLATIONMOD" />
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
            <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="POLICYID" DataSourceID="SqlDataSource1" ForeColor="#333333">
                <EditItemTemplate>
                    POLICYID:
                    <asp:Label ID="POLICYIDLabel1" runat="server" Text='<%# Eval("POLICYID") %>' />
                    <br />
                    BASEPRICE:
                    <asp:TextBox ID="BASEPRICETextBox" runat="server" Text='<%# Bind("BASEPRICE") %>' />
                    <br />
                    HOLIDAYPRICEMOD:
                    <asp:TextBox ID="HOLIDAYPRICEMODTextBox" runat="server" Text='<%# Bind("HOLIDAYPRICEMOD") %>' />
                    <br />
                    NEWRELEASEMOD:
                    <asp:TextBox ID="NEWRELEASEMODTextBox" runat="server" Text='<%# Bind("NEWRELEASEMOD") %>' />
                    <br />
                    CANCELLATIONMOD:
                    <asp:TextBox ID="CANCELLATIONMODTextBox" runat="server" Text='<%# Bind("CANCELLATIONMOD") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <InsertItemTemplate>
                    POLICYID:
                    <asp:TextBox ID="POLICYIDTextBox" runat="server" Text='<%# Bind("POLICYID") %>' />
                    <br />
                    BASEPRICE:
                    <asp:TextBox ID="BASEPRICETextBox" runat="server" Text='<%# Bind("BASEPRICE") %>' />
                    <br />
                    HOLIDAYPRICEMOD:
                    <asp:TextBox ID="HOLIDAYPRICEMODTextBox" runat="server" Text='<%# Bind("HOLIDAYPRICEMOD") %>' />
                    <br />
                    NEWRELEASEMOD:
                    <asp:TextBox ID="NEWRELEASEMODTextBox" runat="server" Text='<%# Bind("NEWRELEASEMOD") %>' />
                    <br />
                    CANCELLATIONMOD:
                    <asp:TextBox ID="CANCELLATIONMODTextBox" runat="server" Text='<%# Bind("CANCELLATIONMOD") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    POLICYID:
                    <asp:Label ID="POLICYIDLabel" runat="server" Text='<%# Eval("POLICYID") %>' />
                    <br />
                    BASEPRICE:
                    <asp:Label ID="BASEPRICELabel" runat="server" Text='<%# Bind("BASEPRICE") %>' />
                    <br />
                    HOLIDAYPRICEMOD:
                    <asp:Label ID="HOLIDAYPRICEMODLabel" runat="server" Text='<%# Bind("HOLIDAYPRICEMOD") %>' />
                    <br />
                    NEWRELEASEMOD:
                    <asp:Label ID="NEWRELEASEMODLabel" runat="server" Text='<%# Bind("NEWRELEASEMOD") %>' />
                    <br />
                    CANCELLATIONMOD:
                    <asp:Label ID="CANCELLATIONMODLabel" runat="server" Text='<%# Bind("CANCELLATIONMOD") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;PRICING&quot; WHERE &quot;POLICYID&quot; = :POLICYID" InsertCommand="INSERT INTO &quot;PRICING&quot; (&quot;POLICYID&quot;, &quot;BASEPRICE&quot;, &quot;HOLIDAYPRICEMOD&quot;, &quot;NEWRELEASEMOD&quot;, &quot;CANCELLATIONMOD&quot;) VALUES (:POLICYID, :BASEPRICE, :HOLIDAYPRICEMOD, :NEWRELEASEMOD, :CANCELLATIONMOD)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;PRICING&quot;" UpdateCommand="UPDATE &quot;PRICING&quot; SET &quot;BASEPRICE&quot; = :BASEPRICE, &quot;HOLIDAYPRICEMOD&quot; = :HOLIDAYPRICEMOD, &quot;NEWRELEASEMOD&quot; = :NEWRELEASEMOD, &quot;CANCELLATIONMOD&quot; = :CANCELLATIONMOD WHERE &quot;POLICYID&quot; = :POLICYID">
                <DeleteParameters>
                    <asp:Parameter Name="POLICYID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="POLICYID" Type="Decimal" />
                    <asp:Parameter Name="BASEPRICE" Type="Decimal" />
                    <asp:Parameter Name="HOLIDAYPRICEMOD" Type="Decimal" />
                    <asp:Parameter Name="NEWRELEASEMOD" Type="Decimal" />
                    <asp:Parameter Name="CANCELLATIONMOD" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="BASEPRICE" Type="Decimal" />
                    <asp:Parameter Name="HOLIDAYPRICEMOD" Type="Decimal" />
                    <asp:Parameter Name="NEWRELEASEMOD" Type="Decimal" />
                    <asp:Parameter Name="CANCELLATIONMOD" Type="Decimal" />
                    <asp:Parameter Name="POLICYID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
            <Series>
                <asp:Series Name="Series1" XValueMember="NEWRELEASEMOD" YValueMembers="CANCELLATIONMOD">
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


