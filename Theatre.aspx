<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Theatre.aspx.cs" Inherits="WebApplication.Theatre" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kumari Cinemas - Theatre</title>
    <link href="SiteStyles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-shell">
            <header class="page-header">
                <div>
                    <h1>Theatre Management</h1>
                    <p class="page-subtitle">Create, update, and review theatre records.</p>
                </div>
                <a class="home-link" href="Default.aspx">Back To Home</a>
            </header>
            <section class="content-card">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="THEATREID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="THEATREID" HeaderText="THEATREID" ReadOnly="True" SortExpression="THEATREID" />
                <asp:BoundField DataField="THEATRENAME" HeaderText="THEATRENAME" SortExpression="THEATRENAME" />
                <asp:BoundField DataField="LOCATION" HeaderText="LOCATION" SortExpression="LOCATION" />
                <asp:BoundField DataField="OPERATIONCOST" HeaderText="OPERATIONCOST" SortExpression="OPERATIONCOST" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;THEATRE&quot; WHERE &quot;THEATREID&quot; = :THEATREID" InsertCommand="INSERT INTO &quot;THEATRE&quot; (&quot;THEATREID&quot;, &quot;THEATRENAME&quot;, &quot;LOCATION&quot;, &quot;OPERATIONCOST&quot;) VALUES (:THEATREID, :THEATRENAME, :LOCATION, :OPERATIONCOST)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;THEATRE&quot;" UpdateCommand="UPDATE &quot;THEATRE&quot; SET &quot;THEATRENAME&quot; = :THEATRENAME, &quot;LOCATION&quot; = :LOCATION, &quot;OPERATIONCOST&quot; = :OPERATIONCOST WHERE &quot;THEATREID&quot; = :THEATREID">
            <DeleteParameters>
                <asp:Parameter Name="THEATREID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="THEATREID" Type="Decimal" />
                <asp:Parameter Name="THEATRENAME" Type="String" />
                <asp:Parameter Name="LOCATION" Type="String" />
                <asp:Parameter Name="OPERATIONCOST" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="THEATRENAME" Type="String" />
                <asp:Parameter Name="LOCATION" Type="String" />
                <asp:Parameter Name="OPERATIONCOST" Type="Decimal" />
                <asp:Parameter Name="THEATREID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="THEATREID" DataSourceID="SqlDataSource1" ForeColor="#333333">
            <EditItemTemplate>
                THEATREID:
                <asp:Label ID="THEATREIDLabel1" runat="server" Text='<%# Eval("THEATREID") %>' />
                <br />
                THEATRENAME:
                <asp:TextBox ID="THEATRENAMETextBox" runat="server" Text='<%# Bind("THEATRENAME") %>' />
                <br />
                LOCATION:
                <asp:TextBox ID="LOCATIONTextBox" runat="server" Text='<%# Bind("LOCATION") %>' />
                <br />
                OPERATIONCOST:
                <asp:TextBox ID="OPERATIONCOSTTextBox" runat="server" Text='<%# Bind("OPERATIONCOST") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                THEATREID:
                <asp:TextBox ID="THEATREIDTextBox" runat="server" Text='<%# Bind("THEATREID") %>' />
                <br />
                THEATRENAME:
                <asp:TextBox ID="THEATRENAMETextBox" runat="server" Text='<%# Bind("THEATRENAME") %>' />
                <br />
                LOCATION:
                <asp:TextBox ID="LOCATIONTextBox" runat="server" Text='<%# Bind("LOCATION") %>' />
                <br />
                OPERATIONCOST:
                <asp:TextBox ID="OPERATIONCOSTTextBox" runat="server" Text='<%# Bind("OPERATIONCOST") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                THEATREID:
                <asp:Label ID="THEATREIDLabel" runat="server" Text='<%# Eval("THEATREID") %>' />
                <br />
                THEATRENAME:
                <asp:Label ID="THEATRENAMELabel" runat="server" Text='<%# Bind("THEATRENAME") %>' />
                <br />
                LOCATION:
                <asp:Label ID="LOCATIONLabel" runat="server" Text='<%# Bind("LOCATION") %>' />
                <br />
                OPERATIONCOST:
                <asp:Label ID="OPERATIONCOSTLabel" runat="server" Text='<%# Bind("OPERATIONCOST") %>' />
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
                <asp:Series Name="Series1" XValueMember="LOCATION" YValueMembers="THEATREID">
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


