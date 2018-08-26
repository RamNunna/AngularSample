<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BlockChainUI.aspx.cs" Inherits="RND.BlockChainUI" %>

<%@ Register Src="~/BlockChainUserControl.ascx" TagPrefix="uc1" TagName="BlockChainUserControl" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager id="ScriptManager" runat="server" EnablePageMethods="true" EnablePartialRendering="true" EnableScriptGlobalization="false" EnableScriptLocalization="true" />
        <uc1:BlockChainUserControl runat="server" ID="BlockChainUserControl" />
    </form>
</body>
</html>
