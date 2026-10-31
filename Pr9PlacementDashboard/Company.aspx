<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Company.aspx.cs"
    Inherits="Pr9PlacementDashboard.Company" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Company Details</title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Company Details</h1>
        <h2>Placement Records</h2>

        <asp:GridView ID="gvCompany" runat="server"
            AutoGenerateColumns="False"
            BorderWidth="1"
            CellPadding="5"
            EmptyDataText="No company records found.">
            <Columns>
                <asp:BoundField DataField="CompanyName" HeaderText="Company Name" />
                <asp:BoundField DataField="JobRole" HeaderText="Job Role" />
                <asp:BoundField DataField="PackageLPA"
                    HeaderText="Package (LPA)" DataFormatString="{0:F2}" />
                <asp:BoundField DataField="StudentName" HeaderText="Student Name" />
            </Columns>
        </asp:GridView>

        <h2>Company Summary</h2>
        <p>
            Total Companies:
            <asp:Label ID="lblCompanies" runat="server" />
        </p>
        <p>
            Highest Package:
            <asp:Label ID="lblHighestPackage" runat="server" /> LPA
        </p>
        <p>
            Average Package:
            <asp:Label ID="lblAveragePackage" runat="server" /> LPA
        </p>

        <br />
        <asp:HyperLink ID="lnkHome" runat="server"
            NavigateUrl="Default.aspx"
            Text="Back to Placement Dashboard" />
    </form>
</body>
</html>
