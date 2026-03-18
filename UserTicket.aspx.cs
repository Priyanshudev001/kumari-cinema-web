using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization.Charting;

namespace WebApplication
{
    public partial class UserTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindTicketData();
            }
        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            BindTicketData();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtSearch.Text = string.Empty;
            ddlPaymentMethod.SelectedIndex = 0;
            BindTicketData();
        }

        protected void SqlDataSourceUserTicket_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            string searchText = txtSearch.Text.Trim();
            string paymentMethod = ddlPaymentMethod.SelectedValue;

            e.Command.Parameters["searchText"].Value = string.IsNullOrWhiteSpace(searchText)
                ? (object)DBNull.Value
                : searchText;

            e.Command.Parameters["paymentMethod"].Value = string.IsNullOrWhiteSpace(paymentMethod)
                ? (object)DBNull.Value
                : paymentMethod;
        }

        private void BindTicketData()
        {
            gvUserTickets.DataBind();

            DataView data = SqlDataSourceUserTicket.Select(DataSourceSelectArguments.Empty) as DataView;
            if (data == null)
            {
                ApplySummaryValues(0, 0, 0m);
                BuildChart(new DataTable());
                return;
            }

            DataTable details = data.ToTable();
            UpdateSummary(details);
            BuildChart(details);
        }

        private void UpdateSummary(DataTable details)
        {
            int totalTickets = details.Rows.Count;
            int totalCustomers = details.AsEnumerable()
                .Select(r => Convert.ToString(r["CUSTOMERID"]))
                .Where(id => !string.IsNullOrWhiteSpace(id))
                .Distinct()
                .Count();

            decimal totalRevenue = details.AsEnumerable()
                .Where(r => r["TICKETPRICE"] != DBNull.Value)
                .Sum(r => Convert.ToDecimal(r["TICKETPRICE"]));

            ApplySummaryValues(totalCustomers, totalTickets, totalRevenue);
        }

        private void ApplySummaryValues(int totalCustomers, int totalTickets, decimal totalRevenue)
        {
            lblTotalCustomers.Text = totalCustomers.ToString("N0");
            lblTotalTickets.Text = totalTickets.ToString("N0");
            lblTotalRevenue.Text = totalRevenue.ToString("N2");
        }

        private void BuildChart(DataTable details)
        {
            DataTable chartData = new DataTable();
            chartData.Columns.Add("PAYMENTMETHOD", typeof(string));
            chartData.Columns.Add("TICKETCOUNT", typeof(int));

            var grouped = details.AsEnumerable()
                .GroupBy(r => r["PAYMENTMETHOD"] == DBNull.Value ? "Unknown" : Convert.ToString(r["PAYMENTMETHOD"]))
                .OrderBy(g => g.Key)
                .Select(g => new { PaymentMethod = g.Key, TicketCount = g.Count() });

            foreach (var item in grouped)
            {
                chartData.Rows.Add(item.PaymentMethod, item.TicketCount);
            }

            chartPaymentMethod.Series["Tickets"].XValueMember = "PAYMENTMETHOD";
            chartPaymentMethod.Series["Tickets"].YValueMembers = "TICKETCOUNT";
            chartPaymentMethod.DataSource = chartData;
            chartPaymentMethod.DataBind();
        }
    }
}