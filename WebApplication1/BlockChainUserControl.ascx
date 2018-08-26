<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BlockChainUserControl.ascx.cs" Inherits="RND.BlockChainUserControl" %>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.9/angular.min.js"></script>
<script>
    var app = angular.module('MyApp', []);
    app.controller('MyController', function ($scope, $http, $window) {
        $scope.GetHashValue = function () {
            var post = $http({
                method: "POST",
                url: "WebService1.asmx/ComputeSha256Hash",
                dataType: 'json',
                data: { rawData: $scope.rawdata },
                headers: { "Content-Type": "application/json" }
            });

            post.success(function (data, status) {
                $scope.hasdata = data.d;
            });

            post.error(function (data, status) {
                $window.alert(data.Message);
            });
        }
    });
</script>
<div ng-app="MyApp" ng-controller="MyController">
<table id="tblBlock" style="background-color :antiquewhite" runat="server" > 
    <tr>
        <td>            
            <asp:Label ID="lblBlock" runat="server" Text="Block #"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtBlock" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblNounce" runat="server" Text="Nounce"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtNounce" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblData" runat="server" Text="Data*"></asp:Label></td>       
        <td>
            <asp:TextBox ID="txtData" runat="server" ng-model="rawdata" ng-change="GetHashValue()"></asp:TextBox>
          
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblCreateDate" runat="server" Text="Date & Time"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtDateTime" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblHash" runat="server" Text="Hash"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtCurrentHash" runat="server" Enabled="False" ng-model="hasdata"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblPrevHash" runat="server" Text="Previous Hash"></asp:Label></td>
        <td>
            <asp:TextBox ID="txtPrevHash" runat="server" Enabled="False"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td></td>
        <td>
            <asp:Button ID="btnDisplay" runat="server" Text="Display" OnClick="btnDisplay_Click"  />
               <asp:RequiredFieldValidator ID ="rqdData" runat="server" ControlToValidate="txtData" ForeColor="Red" Font-Bold="true"
            ErrorMessage="Data field must be entered." ></asp:RequiredFieldValidator>
        </td>
    </tr>
     <tr>
        <td></td>
        <td>
      <%--      //<asp:Button ID="lblError" runat="server" Font-Bold="true" ForeColor="Red" Visible ="false"/>--%>
        </td>
    </tr>
</table>
</div>

