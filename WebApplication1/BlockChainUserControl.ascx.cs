using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Security.Cryptography;
using System.Drawing;
using System.Web.Services;

namespace RND
{
    public partial class BlockChainUserControl : System.Web.UI.UserControl
    {
        protected static int intBlockId = 0;
        protected static string strPrevHash = "000000000000000000000000000";
        protected static string strCurrentHash = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            txtDateTime.Text = Convert.ToString(System.DateTime.Now);
            intBlockId += 1;
            Random rnd = new Random();
            txtNounce.Text = Convert.ToString(rnd.Next(1, 99999));
            if (IsPostBack)
            {
                    txtPrevHash.Text = strPrevHash;
                    txtBlock.Text = Convert.ToString(intBlockId);
                    strCurrentHash = ComputeSha256Hash(txtData.Text.Trim());
                    txtCurrentHash.Text = strCurrentHash;
                    strPrevHash = strCurrentHash;
            
            }
            else
            {                
                txtBlock.Text = Convert.ToString(intBlockId);
                txtPrevHash.Text = strPrevHash;
            }
        }
        //protected bool IsValidData()
        //{
        //    lblError.Text = "";
        //    if (!string.IsNullOrEmpty(txtData.Text.Trim()))
        //    {
        //        lblError.Visible = false;
        //        return true;
        //    }
        //    else
        //    {
        //        lblError.Visible = true;
        //        lblError.Text = "Data field must be entered";
        //        return false;
        //    }          
        //}
        protected void btnDisplay_Click(object sender, EventArgs e)
        {
            if (txtCurrentHash.Text.Trim() == txtPrevHash.Text.Trim())
            {
                tblBlock.Style.Add("background-color", "coral");
                //lblError.Visible = true;
                //lblError.Text = "Data has not changed";
                btnDisplay.Enabled = false;
            }
            else
            {
                tblBlock.Style.Add("background-color", "antiquewhite");
                btnDisplay.Enabled = true;
            }
        }
        [WebMethod]
        static string ComputeSha256Hash(string rawData)
        {
            // Create a SHA256   
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // ComputeHash - returns byte array  
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));

                // Convert byte array to a string   
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }               
    }
}