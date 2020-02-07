<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ASPDOTNET___Lab_2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">

        <%-- Custom Stylesheet --%>
        <link href="Content/StyleSheet.css" rel="stylesheet" type="text/css" />

    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Beautifal Views</h2>
            <p>
                <img class="Marina-1" src="Images/Marina.png" />
            </p>
            <p>
                
            </p>
        </div>
        <div class="col-md-4">
            <h2>Great deals</h2>
            <p>
               <img class="Marina-1" src="Images/Family.png" />
            </p>
            <p>
                
            </p>
        </div>
        <div class="col-md-4">
            <h2>All in one place</h2>
            <p>
                <img class="Marina-1" src="Images/Sunset.png" />
            </p>
            <p>
                
            </p>
        </div>
    </div>

</asp:Content>
