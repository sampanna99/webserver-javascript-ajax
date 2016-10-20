<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication6.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" lang="javascript">
        function GetStudentById() {
            var id = document.getElementById("txtStudentId").value;
            
            WebApplication6.StudentSeervice.GetStudentById(id, GetStudentByIdSuccessCallback, GetStudentByIdFailedCalledback);
        }

        function GetStudentByIdSuccessCallback(results) {
            document.getElementById("txtName").value = results["Name"];
            document.getElementById("txtGender").value = results["Gender"];
            document.getElementById("txtTotalMarks").value = results["TotalMarks"];
        }
        function GetStudentByIdFailedCalledback(errors) {
            alert(errors.get_message());
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference Path="~/StudentSeervice.asmx" />
            </Services>
        </asp:ScriptManager>
    <table style="font-family:Arial; border: 1px solid black">
        <tr>
            <td>
                <b>ID</b>
            </td>
            <td>
                <asp:TextBox ID="txtStudentId" runat="server"></asp:TextBox>
                <input id="Button1" type="button" value="Get Student" onclick="GetStudentById()" />
            </td>
        </tr>
        <tr>
            <td>
                <b>Name</b>
            </td>
            <td>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <b>Gender</b>
            </td>
            <td>
                <asp:TextBox ID="txtGender" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <b>TotalMarks</b>
            </td>
            <td>
                <asp:TextBox ID="txtTotalMarks" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
        <h1>This is to check that there is not full page postback. Just the Id and it gets the result</h1>
        <asp:Label ID="lblTime" runat="server"></asp:Label>
    </form>
</body>
</html>
