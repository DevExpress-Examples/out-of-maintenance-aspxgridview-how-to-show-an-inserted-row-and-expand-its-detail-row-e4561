<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title> How to show an inserted row and expand its detail row</title>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			<dx:ASPxGridView ID="master" runat="server" DataSourceID="Categories" KeyFieldName="CategoryID" AutoGenerateColumns="False" OnRowInserted="master_RowInserted">
				<Columns>
                    <dx:GridViewCommandColumn ShowNewButton="true" ShowDeleteButton="true"/>
					<dx:GridViewDataTextColumn FieldName="CategoryID"></dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="CategoryName"></dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="Description"></dx:GridViewDataTextColumn>
				</Columns>
				<Templates>
					<DetailRow>
						<dx:ASPxGridView ID="detail" runat="server" DataSourceID="Products" KeyFieldName="ProductID"
							OnBeforePerformDataSelect="detail_BeforePerformDataSelect">
						</dx:ASPxGridView>
					</DetailRow>
				</Templates>
				<SettingsDetail ShowDetailRow="true" />
			</dx:ASPxGridView>
			<asp:AccessDataSource ID="Categories" runat="server" DataFile="~/App_Data/nwind.mdb"
				SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]"
				DeleteCommand="DELETE FROM [Categories] WHERE [CategoryID] = ?"
				InsertCommand="INSERT INTO [Categories] ([CategoryID], [CategoryName], [Description]) VALUES (?, ?, ?)">
				<DeleteParameters>
					<asp:Parameter Name="CategoryID" Type="Int32" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="CategoryID" Type="Int32" />
					<asp:Parameter Name="CategoryName" Type="String" />
					<asp:Parameter Name="Description" Type="String" />
				</InsertParameters>
			</asp:AccessDataSource>
			<asp:AccessDataSource ID="Products" runat="server" DataFile="~/App_Data/nwind.mdb" SelectCommand="SELECT * FROM [Products] WHERE [CategoryID]=@CategoryID">
				<SelectParameters>
					<asp:SessionParameter Name="CategoryID" SessionField="CategoryID" Type="Int32" />
				</SelectParameters>
			</asp:AccessDataSource>
		</div>
	</form>
</body>
</html>