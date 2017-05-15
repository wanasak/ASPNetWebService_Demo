<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ASPNetWebService.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function add() {
            var number1 = document.getElementById("txtFirstNumber").value;
            var number2 = document.getElementById("txtSecondNumber").value;
            ASPNetWebService.CalculatorWebService.Add(number1, number2, AddSuccessCallback, AddErrorCallback);
        }
        function AddSuccessCallback(data) {
            document.getElementById("lblResult").textContent = data;
        }
        function AddErrorCallback(errors) {
            alert(errors);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference Path="~/CalculatorWebService.asmx" />
            </Services>
        </asp:ScriptManager>
        <div>
            <table style="font-family: Arial">
                <tr>
                    <td>
                        <b>First Number</b>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFirstNumber" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Second Number</b>
                    </td>
                    <td>
                        <asp:TextBox ID="txtSecondNumber" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Result</b>
                    </td>
                    <td>
                        <asp:Label ID="lblResult" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="button" onclick="add()" value="Add" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
