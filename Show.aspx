<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Show.aspx.cs" Inherits="WebApplication.Show" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kumari Cinemas - Show</title>
    <link href="SiteStyles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-shell">
            <header class="page-header">
                <div>
                    <h1>Show Management</h1>
                    <p class="page-subtitle">Create, update, and review show records.</p>
                </div>
                <a class="home-link" href="Default.aspx">Back To Home</a>
            </header>
            <section class="content-card">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="SHOWID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="SHOWID" HeaderText="SHOWID" ReadOnly="True" SortExpression="SHOWID" />
                    <asp:BoundField DataField="SHOWTIME" HeaderText="SHOWTIME" SortExpression="SHOWTIME" />
                    <asp:BoundField DataField="MOVIEID" HeaderText="MOVIEID" SortExpression="MOVIEID" />
                    <asp:BoundField DataField="HALLID" HeaderText="HALLID" SortExpression="HALLID" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;SHOW&quot; WHERE &quot;SHOWID&quot; = :SHOWID" InsertCommand="INSERT INTO &quot;SHOW&quot; (&quot;SHOWID&quot;, &quot;SHOWTIME&quot;, &quot;MOVIEID&quot;, &quot;HALLID&quot;) VALUES (:SHOWID, :SHOWTIME, :MOVIEID, :HALLID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;SHOW&quot;" UpdateCommand="UPDATE &quot;SHOW&quot; SET &quot;SHOWTIME&quot; = :SHOWTIME, &quot;MOVIEID&quot; = :MOVIEID, &quot;HALLID&quot; = :HALLID WHERE &quot;SHOWID&quot; = :SHOWID">
                <DeleteParameters>
                    <asp:Parameter Name="SHOWID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="SHOWID" Type="Decimal" />
                    <asp:Parameter Name="SHOWTIME" Type="String" />
                    <asp:Parameter Name="MOVIEID" Type="Decimal" />
                    <asp:Parameter Name="HALLID" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SHOWTIME" Type="String" />
                    <asp:Parameter Name="MOVIEID" Type="Decimal" />
                    <asp:Parameter Name="HALLID" Type="Decimal" />
                    <asp:Parameter Name="SHOWID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="SHOWID" DataSourceID="SqlDataSource1" ForeColor="#333333">
            <EditItemTemplate>
                SHOWID:
                <asp:Label ID="SHOWIDLabel1" runat="server" Text='<%# Eval("SHOWID") %>' />
                <br />
                SHOWTIME:
                <asp:TextBox ID="SHOWTIMETextBox" runat="server" Text='<%# Bind("SHOWTIME") %>' />
                <br />
                MOVIEID:
                <asp:TextBox ID="MOVIEIDTextBox" runat="server" Text='<%# Bind("MOVIEID") %>' />
                <br />
                HALLID:
                <asp:TextBox ID="HALLIDTextBox" runat="server" Text='<%# Bind("HALLID") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <InsertItemTemplate>
                SHOWID:
                <asp:TextBox ID="SHOWIDTextBox" runat="server" Text='<%# Bind("SHOWID") %>' />
                <br />
                SHOWTIME:
                <asp:TextBox ID="SHOWTIMETextBox" runat="server" Text='<%# Bind("SHOWTIME") %>' />
                <br />
                MOVIEID:
                <asp:TextBox ID="MOVIEIDTextBox" runat="server" Text='<%# Bind("MOVIEID") %>' />
                <br />
                HALLID:
                <asp:TextBox ID="HALLIDTextBox" runat="server" Text='<%# Bind("HALLID") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                SHOWID:
                <asp:Label ID="SHOWIDLabel" runat="server" Text='<%# Eval("SHOWID") %>' />
                <br />
                SHOWTIME:
                <asp:Label ID="SHOWTIMELabel" runat="server" Text='<%# Bind("SHOWTIME") %>' />
                <br />
                MOVIEID:
                <asp:Label ID="MOVIEIDLabel" runat="server" Text='<%# Bind("MOVIEID") %>' />
                <br />
                HALLID:
                <asp:Label ID="HALLIDLabel" runat="server" Text='<%# Bind("HALLID") %>' />
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
                    <asp:Series Name="Series1" XValueMember="SHOWTIME" YValueMembers="HALLID">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
&nbsp;</p>
                </section>
        </div>
    </form>
</body>
</html>


