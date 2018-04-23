Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Data
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
	End Sub
	Protected Sub detail_BeforePerformDataSelect(ByVal sender As Object, ByVal e As EventArgs)
		Session("CategoryID") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
	End Sub
	Protected Sub master_RowInserted(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertedEventArgs)
		Dim newValue As String = e.NewValues("CategoryID").ToString()
		master.MakeRowVisible(newValue)
		master.DetailRows.ExpandRowByKey(Convert.ToInt32(newValue))
	End Sub
End Class