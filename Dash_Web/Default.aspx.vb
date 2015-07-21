Imports DevExpress.DashboardCommon
Imports DevExpress.DashboardWeb
Imports System.Data.OleDb
Imports System.Data.SqlClient
Imports System.Data.Odbc

Public Class Dash
    Inherits System.Web.UI.Page
    Dim DT_Dash As New DB.DashDataTable
    Dim DT_DSource As New DB.DSourceDataTable
    Dim DR_Dash As DB.DashRow
    Dim DA_Dash As New DBTableAdapters.DashTableAdapter
    Dim DA_DSource As New DBTableAdapters.DSourceTableAdapter

    Private Sub Dash_Init(sender As Object, e As EventArgs) Handles ASPxListBox1.Load

        DA_Dash.Fill(DT_Dash)
        DA_DSource.Fill(DT_DSource)

        ASPxListBox1.ValueField = "DID"
        ASPxListBox1.TextField = "DisplayName"

        ASPxListBox1.DataSource = DT_Dash
        ASPxListBox1.DataBind()
    End Sub

    Protected Sub ASPxDashboardViewer1_DashboardLoading(sender As Object, e As DevExpress.DashboardWeb.DashboardLoadingEventArgs) Handles ASPxDashboardViewer1.DashboardLoading
        If ASPxListBox1.SelectedValues.Count > 0 Then
            DR_Dash = DT_Dash.Select("DID=" & ASPxListBox1.SelectedItem.Value)(0)
            e.DashboardXml = DR_Dash.DashXML
        End If
    End Sub

    Protected Sub ASPxDashboardViewer1_DataLoading(sender As Object, e As DevExpress.DashboardWeb.DataLoadingWebEventArgs) Handles ASPxDashboardViewer1.DataLoading
        Dim dt As New DataTable
        Dim da As OleDbDataAdapter
        Dim c As System.Configuration.Configuration = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/")
        Dim connString As String = c.ConnectionStrings.ConnectionStrings("DashQuestConnectionString").ConnectionString

        Dim DR_DSourceArray() As DB.DSourceRow
        Dim DR_DSource As DB.DSourceRow

        DR_DSourceArray = DT_DSource.Select("DSComponentName='" & e.DataSourceComponentName & "'")
        If DR_DSourceArray.GetUpperBound(0) > -1 Then
            DR_DSource = DR_DSourceArray(0)
            da = New OleDbDataAdapter("SELECT * FROM [" & DR_DSource.DSTable & "]", connString)
            da.Fill(dt)
        End If
        e.Data = dt
    End Sub

    Protected Sub ASPxListBox1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ASPxListBox1.SelectedIndexChanged
        If ASPxListBox1.SelectedValues.Count > 0 Then
            DR_Dash = DT_Dash.Select("DID=" & ASPxListBox1.SelectedItem.Value)(0)
            ASPxDashboardViewer1.DashboardId = DR_Dash.DID
        End If
    End Sub

End Class