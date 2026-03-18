using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class TheaterCityHall : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindTheatreHallData();
            }
        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            BindTheatreHallData();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtTheatre.Text = string.Empty;
            txtLocation.Text = string.Empty;
            ddlGenre.SelectedIndex = 0;
            BindTheatreHallData();
        }

        protected void SqlDataSourceTheaterCityHall_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            string theatreName = txtTheatre.Text.Trim();
            string locationName = txtLocation.Text.Trim();
            string genreName = ddlGenre.SelectedValue;

            e.Command.Parameters["theatreName"].Value = string.IsNullOrWhiteSpace(theatreName)
                ? (object)DBNull.Value
                : theatreName;

            e.Command.Parameters["locationName"].Value = string.IsNullOrWhiteSpace(locationName)
                ? (object)DBNull.Value
                : locationName;

            e.Command.Parameters["genreName"].Value = string.IsNullOrWhiteSpace(genreName)
                ? (object)DBNull.Value
                : genreName;
        }

        private void BindTheatreHallData()
        {
            gvTheaterCityHall.DataBind();

            DataView data = SqlDataSourceTheaterCityHall.Select(DataSourceSelectArguments.Empty) as DataView;
            if (data == null)
            {
                ApplySummaryValues(0, 0, 0, 0);
                BuildChart(new DataTable());
                return;
            }

            DataTable details = data.ToTable();
            UpdateSummary(details);
            BuildChart(details);
        }

        private void UpdateSummary(DataTable details)
        {
            int totalShows = details.Rows.Count;

            int totalTheatres = details.AsEnumerable()
                .Select(r => Convert.ToString(r["THEATRENAME"]))
                .Where(v => !string.IsNullOrWhiteSpace(v))
                .Distinct()
                .Count();

            int totalHalls = details.AsEnumerable()
                .Select(r => Convert.ToString(r["HALLNUMBER"]))
                .Where(v => !string.IsNullOrWhiteSpace(v))
                .Distinct()
                .Count();

            int totalMovies = details.AsEnumerable()
                .Select(r => Convert.ToString(r["MOVIETITLE"]))
                .Where(v => !string.IsNullOrWhiteSpace(v))
                .Distinct()
                .Count();

            ApplySummaryValues(totalTheatres, totalHalls, totalMovies, totalShows);
        }

        private void ApplySummaryValues(int totalTheatres, int totalHalls, int totalMovies, int totalShows)
        {
            lblTotalTheatres.Text = totalTheatres.ToString("N0");
            lblTotalHalls.Text = totalHalls.ToString("N0");
            lblTotalMovies.Text = totalMovies.ToString("N0");
            lblTotalShows.Text = totalShows.ToString("N0");
        }

        private void BuildChart(DataTable details)
        {
            DataTable chartData = new DataTable();
            chartData.Columns.Add("THEATRENAME", typeof(string));
            chartData.Columns.Add("SHOWCOUNT", typeof(int));

            var grouped = details.AsEnumerable()
                .GroupBy(r => r["THEATRENAME"] == DBNull.Value ? "Unknown" : Convert.ToString(r["THEATRENAME"]))
                .OrderBy(g => g.Key)
                .Select(g => new { TheatreName = g.Key, ShowCount = g.Count() });

            foreach (var item in grouped)
            {
                chartData.Rows.Add(item.TheatreName, item.ShowCount);
            }

            chartShowsByTheatre.Series["Shows"].XValueMember = "THEATRENAME";
            chartShowsByTheatre.Series["Shows"].YValueMembers = "SHOWCOUNT";
            chartShowsByTheatre.DataSource = chartData;
            chartShowsByTheatre.DataBind();
        }
    }
}