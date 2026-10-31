using System;
using System.Data;
using System.Data.SqlClient;

namespace Pr9PlacementDashboard
{
    public partial class Company : System.Web.UI.Page
    {
        private readonly string connectionString =
            @"Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=PlacementDB;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCompanyDetails();
                LoadCompanySummary();
            }
        }

        private void LoadCompanyDetails()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT P.CompanyName, P.JobRole, P.PackageLPA, S.StudentName
                    FROM Placements P
                    INNER JOIN Students S ON P.StudentId = S.StudentId";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvCompany.DataSource = dt;
                gvCompany.DataBind();
            }
        }

        private void LoadCompanySummary()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                string query = @"
                    SELECT COUNT(DISTINCT CompanyName),
                           MAX(PackageLPA),
                           AVG(PackageLPA)
                    FROM Placements";

                SqlCommand cmd = new SqlCommand(query, con);

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    if (dr.Read())
                    {
                        lblCompanies.Text = dr[0].ToString();

                        lblHighestPackage.Text = dr.IsDBNull(1) ? "0.00" :
                            Convert.ToDecimal(dr[1]).ToString("F2");

                        lblAveragePackage.Text = dr.IsDBNull(2) ? "0.00" :
                            Convert.ToDecimal(dr[2]).ToString("F2");
                    }
                }
            }
        }
    }
}
