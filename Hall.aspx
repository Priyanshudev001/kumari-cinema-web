<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Hall.aspx.cs" Inherits="WebApplication.Hall" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kumari Cinemas - Hall</title>
    <link href="SiteStyles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-shell">
            <header class="page-header">
                <div>
                    <h1>Hall Management</h1>
                    <p class="page-subtitle">Create, update, and review hall records.</p>
                </div>
                <a class="home-link" href="Default.aspx">Back To Home</a>
            </header>
            <section class="content-card">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="HALLID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="HALLID" HeaderText="HALLID" ReadOnly="True" SortExpression="HALLID" />
                    <asp:BoundField DataField="HALLNUMBER" HeaderText="HALLNUMBER" SortExpression="HALLNUMBER" />
                    <asp:BoundField DataField="CAPACITY" HeaderText="CAPACITY" SortExpression="CAPACITY" />
                    <asp:BoundField DataField="THEATREID" HeaderText="THEATREID" SortExpression="THEATREID" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;HALL&quot; WHERE &quot;HALLID&quot; = :HALLID" InsertCommand="INSERT INTO &quot;HALL&quot; (&quot;HALLID&quot;, &quot;HALLNUMBER&quot;, &quot;CAPACITY&quot;, &quot;THEATREID&quot;) VALUES (:HALLID, :HALLNUMBER, :CAPACITY, :THEATREID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;HALL&quot;" UpdateCommand="UPDATE &quot;HALL&quot; SET &quot;HALLNUMBER&quot; = :HALLNUMBER, &quot;CAPACITY&quot; = :CAPACITY, &quot;THEATREID&quot; = :THEATREID WHERE &quot;HALLID&quot; = :HALLID">
                <DeleteParameters>
                    <asp:Parameter Name="HALLID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="HALLID" Type="Decimal" />
                    <asp:Parameter Name="HALLNUMBER" Type="Decimal" />
                    <asp:Parameter Name="CAPACITY" Type="Decimal" />
                    <asp:Parameter Name="THEATREID" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="HALLNUMBER" Type="Decimal" />
                    <asp:Parameter Name="CAPACITY" Type="Decimal" />
                    <asp:Parameter Name="THEATREID" Type="Decimal" />
                    <asp:Parameter Name="HALLID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="HALLID" DataSourceID="SqlDataSource1" ForeColor="#333333">
            <EditItemTemplate>
                HALLID:
                <asp:Label ID="HALLIDLabel1" runat="server" Text='<%# Eval("HALLID") %>' />
                <br />
                HALLNUMBER:
                <asp:TextBox ID="HALLNUMBERTextBox" runat="server" Text='<%# Bind("HALLNUMBER") %>' />
                <br />
                CAPACITY:
                <asp:TextBox ID="CAPACITYTextBox" runat="server" Text='<%# Bind("CAPACITY") %>' />
                <br />
                THEATREID:
                <asp:TextBox ID="THEATREIDTextBox" runat="server" Text='<%# Bind("THEATREID") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                HALLID:
                <asp:TextBox ID="HALLIDTextBox" runat="server" Text='<%# Bind("HALLID") %>' />
                <br />
                HALLNUMBER:
                <asp:TextBox ID="HALLNUMBERTextBox" runat="server" Text='<%# Bind("HALLNUMBER") %>' />
                <br />
                CAPACITY:
                <asp:TextBox ID="CAPACITYTextBox" runat="server" Text='<%# Bind("CAPACITY") %>' />
                <br />
                THEATREID:
                <asp:TextBox ID="THEATREIDTextBox" runat="server" Text='<%# Bind("THEATREID") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                HALLID:
                <asp:Label ID="HALLIDLabel" runat="server" Text='<%# Eval("HALLID") %>' />
                <br />
                HALLNUMBER:
                <asp:Label ID="HALLNUMBERLabel" runat="server" Text='<%# Bind("HALLNUMBER") %>' />
                <br />
                CAPACITY:
                <asp:Label ID="CAPACITYLabel" runat="server" Text='<%# Bind("CAPACITY") %>' />
                <br />
                THEATREID:
                <asp:Label ID="THEATREIDLabel" runat="server" Text='<%# Bind("THEATREID") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        </asp:FormView>
        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" OnLoad="Chart1_Load">
            <Series>
                <asp:Series Name="Series1" XValueMember="THEATREID" YValueMembers="HALLNUMBER">
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


