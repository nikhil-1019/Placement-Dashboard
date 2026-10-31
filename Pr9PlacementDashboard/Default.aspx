<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs"
    Inherits="Pr9PlacementDashboard.Default" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Placement Dashboard</title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Placement Dashboard</h1>

        <h2>Placement Summary</h2>
        <p>
            Total Students:
            <asp:Label ID="lblTotalStudents" runat="server" />
        </p>
        <p>
            Placed Students:
            <asp:Label ID="lblPlacedStudents" runat="server" />
        </p>

        <h2>Placement Records</h2>
        <asp:GridView ID="gvPlacements" runat="server"
            AutoGenerateColumns="False"
            BorderWidth="1"
            CellPadding="5"
            EmptyDataText="No placement records found.">
            <Columns>
                <asp:BoundField DataField="PlacementId" HeaderText="Placement ID" />
                <asp:BoundField DataField="StudentId" HeaderText="Student ID" />
                <asp:BoundField DataField="CompanyName" HeaderText="Company" />
                <asp:BoundField DataField="JobRole" HeaderText="Job Role" />
                <asp:BoundField DataField="PackageLPA"
                    HeaderText="Package (LPA)" DataFormatString="{0:F2}" />
            </Columns>
        </asp:GridView>

        <br />
        <asp:HyperLink ID="lnkCompany" runat="server"
            NavigateUrl="Company.aspx"
            Text="View Company Summary" />
    </form>
</body>
</html>
