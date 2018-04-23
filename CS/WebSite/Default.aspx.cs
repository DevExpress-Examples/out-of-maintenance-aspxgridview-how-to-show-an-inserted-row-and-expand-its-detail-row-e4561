using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxGridView;

public partial class _Default : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) { }
    protected void detail_BeforePerformDataSelect(object sender, EventArgs e) {
        Session["CategoryID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
    }
    protected void master_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e) {
        string newValue = e.NewValues["CategoryID"].ToString();
        master.MakeRowVisible(newValue);
        master.DetailRows.ExpandRowByKey(Convert.ToInt32(newValue));
    }
}