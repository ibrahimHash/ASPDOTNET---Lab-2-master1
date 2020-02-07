<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LeaseSlips.aspx.cs" Inherits="ASPDOTNET___Lab_2.WebForm1" %>

<script runat="server">
    public string GetUserName() { return Context.User.Identity.GetUserName(); }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
    <br />
    <asp:SqlDataSource ID="SqlDSAllDocks" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString %>" SelectCommand="SELECT [ID], [Name] FROM [Dock]"></asp:SqlDataSource>
</p>
<p>
    <asp:DropDownList ID="ddlDock" runat="server" AutoPostBack="True" DataSourceID="SqlDSAllDocks" DataTextField="Name" DataValueField="ID">
    </asp:DropDownList>
</p>
<p>
    <asp:SqlDataSource ID="SqlDSAvaliableSlips" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString %>" SelectCommand="SELECT s.ID, s.Width, s.Length, s.DockID, l.ID AS Expr1, l.SlipID, l.CustomerID FROM Slip AS s LEFT OUTER JOIN Lease AS l ON s.ID = l.SlipID WHERE (l.SlipID IS NULL) AND (s.DockID = @DockID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlDock" Name="DockID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</p>
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDSAvaliableSlips" Height="264px" Width="531px">
    <Columns>
        <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
        <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" />
        <asp:BoundField DataField="Length" HeaderText="Length" SortExpression="Length" />
    </Columns>
    <FooterStyle BackColor="White" ForeColor="#000066" />
    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
    <RowStyle ForeColor="#000066" />
    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F1F1F1" />
    <SortedAscendingHeaderStyle BackColor="#007DBB" />
    <SortedDescendingCellStyle BackColor="#CAC9C9" />
    <SortedDescendingHeaderStyle BackColor="#00547E" />
</asp:GridView>
<p>
</p>
<p>
</p>
<p>
    <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDSLeases" AutoGenerateColumns="False" DataKeyNames="ID">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
        </Columns>
    </asp:GridView>

  <asp:Label Text="<%# GetUserName() %>" runat="server"></asp:Label>
    <asp:SqlDataSource ID="SqlDSLeases" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString %>" SelectCommand="SELECT * FROM [Customer] WHERE ([UserName] = @UserName)">
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="UserName" />
        </SelectParameters>
    
    </asp:SqlDataSource>
</p>
<p>
</p>
<p>
</p>
<p>
    &nbsp;</p>
<p>
</p>
<p>
</p>
<p>
</p>
<p>
</p>
</asp:Content>
