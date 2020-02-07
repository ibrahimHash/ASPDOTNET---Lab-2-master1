<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="ASPDOTNET___Lab_2.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <form id="form1" runat="server">
        <div>
            <h2>Select Dock to veiw available spots</h2>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" BackColor="#999999" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="ID" Height="30px" Width="108px"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString %>" SelectCommand="SELECT * FROM [Dock]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#999999" BorderStyle="Solid" DataKeyNames="ID" DataSourceID="SqlDataSource1" Height="436px" Width="357px">
    <Columns>
        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
        <asp:BoundField DataField="Length" HeaderText="Length" SortExpression="Length" />
        <asp:BoundField DataField="Width" HeaderText="Width" SortExpression="Width" />
    </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MarinaConnectionString %>" SelectCommand="SELECT s.ID, s.Length, s.Width FROM Slip AS s LEFT OUTER JOIN Lease AS l ON s.ID = l.SlipID WHERE (l.ID IS NULL) and DockID = @DockID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="DockID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>

</asp:Content>
