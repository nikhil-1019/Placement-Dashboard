using System;
using System.Data;
using System.Data.SqlClient;

namespace Pr9PlacementDashboard
{
    public partial class Default : System.Web.UI.Page
    {
        private readonly string connectionString =
            @"Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=PlacementDB;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSummary();
                LoadPlacements();
            }
        }

        private void LoadSummary()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(
                    "SELECT COUNT(*) FROM Students", con);
                lblTotalStudents.Text = cmd.ExecuteScalar().ToString();

                cmd.CommandText =
                    "SELECT COUNT(*) FROM Students WHERE IsPlaced = 1";
                lblPlacedStudents.Text = cmd.ExecuteScalar().ToString();
            }
        }

        private void LoadPlacements()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT PlacementId, StudentId, CompanyName, JobRole, PackageLPA
                    FROM Placements";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvPlacements.DataSource = dt;
                gvPlacements.DataBind();
            }
        }
    }
}
