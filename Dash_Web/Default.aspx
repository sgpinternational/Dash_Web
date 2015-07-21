<%@ Page EnableTheming="true"  title="Dash Demos" Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="Dash_Web.Dash"  %>

<%@ Register assembly="DevExpress.Dashboard.v14.1.Web, Version=14.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.DashboardWeb" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxNavBar" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSplitter" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

 <!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dash Demos</title>
    <link rel="shortcut icon" href="~/favicon.ico" type="image/x-icon" />
    <link rel="icon" href="~/favicon.ico" type="image/x-icon" />
</head>
     <body>
    <form id="form1" runat="server">
       
    <div aria-orientation="horizontal"  >
        <dx:ASPxSplitter ID="ASPxSplitter1" runat="server" FullscreenMode="True" Height="100%" ShowCollapseBackwardButton="True" Width="100%">
            <panes>
                <dx:SplitterPane Size="20%">
                    <ContentCollection>
<dx:SplitterContentControl runat="server">
    <dx:ASPxListBox ID="ASPxListBox1" runat="server" AutoPostBack="True" Height="100%" Width="100%">
    </dx:ASPxListBox>
                        </dx:SplitterContentControl>
</ContentCollection>
                </dx:SplitterPane>
                <dx:SplitterPane>
                    <ContentCollection>
<dx:SplitterContentControl runat="server">
    <dx:ASPxDashboardViewer ID="ASPxDashboardViewer1" runat="server" DashboardId="" FullscreenMode="True" Height="600px" Width="100%" AllowExportDashboardItems="True">
        <ExportOptions>
            <DocumentContentOptions FilterState="None" />
        </ExportOptions>
    </dx:ASPxDashboardViewer>
                        </dx:SplitterContentControl>
</ContentCollection>
                </dx:SplitterPane>
            </panes>
        </dx:ASPxSplitter>
    </div>
</form>
</body>
</html>
