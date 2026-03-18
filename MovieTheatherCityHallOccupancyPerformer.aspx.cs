using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class MovieTheatherCityHallOccupancyPerformer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindOccupancyData();
            }
        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            BindOccupancyData();
        }

        protected void SqlDataSourceOccupancy_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            decimal movieId;
            bool validMovieId = decimal.TryParse(ddlMovieId.SelectedValue, out movieId);
            e.Command.Parameters["movieId"].Value = validMovieId ? (object)movieId : 1m;
        }

        private void BindOccupancyData()
        {
            gvOccupancy.DataBind();

            DataView data = SqlDataSourceOccupancy.Select(DataSourceSelectArguments.Empty) as DataView;
            if (data == null)
            {
                ApplySummary("-", "-", 0m, 0);
                BuildChart(new DataTable());
                return;
            }

            DataTable details = data.ToTable();
            UpdateSummary(details);
            BuildChart(details);
        }

        private void UpdateSummary(DataTable details)
        {
            if (details.Rows.Count == 0)
            {
                ApplySummary("Selected Movie", "-", 0m, 0);
                return;
            }

            DataRow topRow = details.Rows[0];
            string movie = Convert.ToString(topRow["MOVIETITLE"]);
            string topTheatre = string.Format(
                "{0} (Hall {1})",
                Convert.ToString(topRow["THEATRENAME"]),
                Convert.ToString(topRow["HALLNUMBER"]));

            decimal bestOccupancy = topRow["OCCUPANCY_PERCENTAGE"] == DBNull.Value
                ? 0m
                : Convert.ToDecimal(topRow["OCCUPANCY_PERCENTAGE"]);

            int totalSeatsBooked = details.AsEnumerable()
                .Where(r => r["SEATS_BOOKED"] != DBNull.Value)
                .Sum(r => Convert.ToInt32(r["SEATS_BOOKED"]));

            ApplySummary(movie, topTheatre, bestOccupancy, totalSeatsBooked);
        }

        private void ApplySummary(string movie, string topTheatre, decimal bestOccupancy, int totalSeatsBooked)
        {
            lblMovie.Text = string.IsNullOrWhiteSpace(movie) ? "-" : movie;
            lblTopTheatre.Text = string.IsNullOrWhiteSpace(topTheatre) ? "-" : topTheatre;
            lblBestOccupancy.Text = bestOccupancy.ToString("N2") + "%";
            lblTotalSeatsBooked.Text = totalSeatsBooked.ToString("N0");
        }

        private void BuildChart(DataTable details)
        {
            DataTable chartData = new DataTable();
            chartData.Columns.Add("THEATRE_HALL", typeof(string));
            chartData.Columns.Add("OCCUPANCY_PERCENTAGE", typeof(decimal));

            foreach (DataRow row in details.Rows)
            {
                string theatreHall = string.Format(
                    "{0} - H{1}",
                    Convert.ToString(row["THEATRENAME"]),
                    Convert.ToString(row["HALLNUMBER"]));

                decimal occupancy = row["OCCUPANCY_PERCENTAGE"] == DBNull.Value
                    ? 0m
                    : Convert.ToDecimal(row["OCCUPANCY_PERCENTAGE"]);

                chartData.Rows.Add(theatreHall, occupancy);
            }

            chartOccupancy.Series["Occupancy"].XValueMember = "THEATRE_HALL";
            chartOccupancy.Series["Occupancy"].YValueMembers = "OCCUPANCY_PERCENTAGE";
            chartOccupancy.DataSource = chartData;
            chartOccupancy.DataBind();
        }
    }
}