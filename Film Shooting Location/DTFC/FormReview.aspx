<%@ Page Title="" Language="C#" MasterPageFile="~/DTFC/DTFCMaster.master" AutoEventWireup="true" CodeFile="FormReview.aspx.cs" Inherits="Applicant_review1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
    .label1{
       float:left;
        width:50%;
        margin-top:20px;
        font-weight:bold;
        color:black;
        padding-left:10px;
        margin-bottom:10px;
    }
    .value1{
        float:left;
        width:50%;
        margin-top:20px;
        margin-bottom:10px;
    }
    .divStyle{
        background-color:white;
        width:80%;
    }
    .frameHeading{
          float:left;
        width:100%;
        margin-top:20px;
        text-align:center;
        color:white;
        background-color:#4867AA;
        padding-left:10px;
        margin-bottom:10px;
        font-weight:bold;
        font-size:20px;
    }
    .editLink:link {
        color: blue;
    }
    
    /* visited link */
    .editLink:visited {
        color: green;
    }
    
    /* mouse over link */
    .editLink:hover {
        color: hotpink;
    }
    
    /* selected link */
    .editLink:active {
        color: red;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <div class="divStyle">
    
            <!--Row1-->
           
               
                    <asp:UpdatePanel runat="server" ID="up1">
                        <ContentTemplate>
                            <asp:DropDownList ID="ddlApplicationid" AutoPostBack="true" Visible="False" Enabled="false" runat="server" OnSelectedIndexChanged="ddlApplicationid_SelectedIndexChanged" ></asp:DropDownList>
                            <asp:FormView ID="FormView1" runat="server" OnItemUpdated="FormView1_ItemUpdated" OnItemUpdating="FormView1_ItemUpdating" DataKeyNames="applicationid" CellPadding="3" CellSpacing="2" Width="100%" BorderStyle="solid" BorderWidth="0px">
                               <ItemTemplate>
                                    <div class=""></div> 
                                   <br />
                                  <%-- <div style="padding-left:10px;"> <asp:LinkButton ID="EditButton" runat="server" CssClass="editLink"  CommandName="Edit" OnClick="EditButton_Click">Edit</asp:LinkButton> </div> --%>
                                   <div class="frameHeading">Application Details</div>
                                    <div class="divStyle">
                                  
                                  <span class="label1"> Application Id</span> 
                                    
                                        <span class="value1"><asp:Label ID="Label2" runat="server" Text='<%#Eval("applicationid")%>'></asp:Label> </span>      
                                     
                                     
                                          <span class="label1"> Movie Name </span>
                                            
                                                <span class="value1"> <asp:Label ID="Label3" runat="server" Text='<%#Eval("moviename")%>'></asp:Label></span>
                                            
                                        
                                        
                                                 <span class="label1">  Movie Type </span>
                                            
                                           <span class="value1"> <asp:Label ID="Label5" runat="server" Text='<%#Eval("movietype")%>'></asp:Label> </span>

                                            
                                        
                                                                            <span class="label1"> movie Language </span>
                                         
                                              <span class="value1"> <asp:Label ID="Label6" runat="server" Text='<%#Eval("language")%>'></asp:Label> </span>
                                         
                                                                                
                                          <span class="label1">  Banner Name </span>
                                            
                                                <span class="value1"> <asp:Label ID="Label4" runat="server" Text='<%#Eval("productionhouse")%>'></asp:Label></span>
                                    
                                       

                                        </div>
                                   
                                   
                                </ItemTemplate>


                                <EditItemTemplate>
                                    <div class="frameHeading">Application Details</div>
                                    <div class="divStyle">
                                            <span class="label1">Application Id</span>
                                            <span class="value1">


                                                <%--<asp:TextBox ID="txtApplicationId" runat="server" Text='<%#Bind("applicationid")%>'></asp:TextBox>--%>
                                                <asp:Label ID="lblApplicationId" runat="server" Text='<%#Bind("applicationid")%>'></asp:Label>
                                            </span>
                                        
                                            <span class="label1">Movie Name</span>
                                            <span class="value1">
                                                <asp:TextBox ID="txtmoviename" runat="server" Text='<%#Bind("moviename")%>'></asp:TextBox>
                                            </span>
                                        
                                            <span class="label1">Movie Type</span>
                                            <span class="value1">

                                                <asp:TextBox ID="txtmovietype" runat="server" Text='<%#Bind("movietype")%>'></asp:TextBox>

                                            </span>
                                        
                                            <span class="label1">movie Language</span>
                                            <span class="value1">
                                                <asp:TextBox ID="txtlanguage" runat="server" Text='<%#Bind("language")%>'></asp:TextBox>
                                            </span>
                                        
                                        <span class="label1">Banner Name</span>
                                            <span class="value1">
                                                <asp:TextBox ID="txtproductionhouse" runat="server" Text='<%#Bind("productionhouse")%>'></asp:TextBox>
                                            </span>

                                        </tr>
                                        
                                       <span> <asp:Button ID="btnForm1Submit" CommandName="Update" runat="server" Text="Update" CssClass="btn btn-primary" style="margin-left:45%;"/></span>
                                    <span>    <asp:Button ID="btnForm1Cancel"   CommandName="Cancel" runat="server" Text="Cancel" CssClass="btn btn-primary" style="margin-left:45%;"/>         </span> 
                                    </div>
                                </EditItemTemplate>
                            </asp:FormView>
                            </div>
                      
              
            
                <div>

                            <asp:FormView ID="FormView2" runat="server"  OnItemUpdated="FormView2_ItemUpdated" OnItemUpdating="FormView2_ItemUpdating" DataKeyNames="applicationid" CellPadding="3" CellSpacing="2" Width="100%" BorderStyle="Solid" BorderWidth="0px">
                                <ItemTemplate>
                                    <div class="frameHeading">Producer Details</div>
                                    <div class="divStyle">
                                        
                                            <span class="label1">Producer Name</span>
                                            <span class="value1">

                                                <asp:Label ID="lblname1" runat="server" Text='<%#Eval("name")%>'></asp:Label>
                                            </span>

                                        
                                            <span class="label1">Producer Experience profile</span>
                                            <span class="value1">

                                                <asp:Label ID="lblExperieanceProfile1" runat="server" Text='<%#Eval("experianceprofile")%>'></asp:Label>
                                            </span>
                                        
                                        <span class="label1">producor Address
                                            </span>
                                            <span class="value1">

                                                <asp:Label ID="lblAddress1" runat="server" Text='<%#Eval("address")%>'></asp:Label>
                                            </span>

                                            <span class="label1">producor phone Number
                                            </span>
                                            <span class="value1">

                                                <asp:Label ID="lblPhone1" runat="server" Text='<%#Eval("phoneno")%>'></asp:Label>

                                            </span>
                                        
                                            <span class="label1">producor email
                                            </span>
                                            <span class="value1">

                                                <asp:Label ID="lblEmail1" runat="server" Text='<%#Eval("email")%>'></asp:Label>
                                            </span>
                                        


                                    </div>


                                </ItemTemplate>

                                <EditItemTemplate>
                                    <div class="frameHeading">Producer Details</div>
                                   <div class="divStyle">
                                        
                                            <span class="label1">Producer Name</span>
                                            <span class="value1">


                                                <asp:TextBox ID="txtname1" runat="server" Text='<%#Bind("name")%>'></asp:TextBox>

                                            </span>

                                        
                                            <span class="label1">Producer Experience profile</span>
                                            <span class="value1">


                                                <asp:TextBox ID="txtExperieanceProfile1" runat="server" Text='<%#Bind("experianceprofile")%>'></asp:TextBox>
                                            </span>
                                        
                                            <span class="label1">producor Address
                                            </span>
                                            <span class="value1">


                                                <asp:TextBox ID="txtAddress1" runat="server" Text='<%#Bind("address")%>'></asp:TextBox>
                                            </span>

                                        
                                            <span class="label1">producor phone Number
                                            </span>
                                            <span class="value1">


                                                <asp:TextBox ID="txtPhone1" runat="server" Text='<%#Bind("phoneno")%>'></asp:TextBox>

                                            </span>
                                        
                                            <span class="label1">producor email
                                            </span>
                                            <span class="value1">


                                                <asp:TextBox ID="txtEmail1" runat="server" Text='<%#Bind("email")%>'></asp:TextBox>
                                            </span>
                                       


                                    
                                   <span> <asp:Button ID="btnForm2Submit" runat="server" CommandName="Update" Text="Update" CssClass="btn btn-primary" style="margin-left:45%;"/></span>
                                    <span>    <asp:Button ID="btnForm2Cancel" runat="server" Text="Cancel" CommandName="Cancel" CssClass="btn btn-primary" style="margin-left:45%;"/>         </span>
                                </div>
                                                </EditItemTemplate>


                            </asp:FormView>
                        
                </div>
            


            <!----           formview2 end here  ------>


            
            
                <div>
                    
                    <asp:FormView ID="FormView3" runat="server"  OnItemUpdated="FormView3_ItemUpdated" OnItemUpdating="FormView3_ItemUpdating" DataKeyNames="applicationid" CellPadding="3" CellSpacing="2" Width="100%" BorderStyle="Solid" BorderWidth="0px">
                                <ItemTemplate>
                                    <div class="frameHeading">Director Details</div>
                                     <div class="divStyle">
                                        
                                            <span class="label1">Director Name 

                                            </span>
                                            <span class="value1">

                                                <asp:Label ID="lblName2" runat="server" Text='<%#Eval("name")%>'></asp:Label>
                                            </span>
                                        
                                            <span class="label1">director Experience profile
                                            </span>
                                            <span class="value1">

                                                <asp:Label ID="lblExperiancePofile2" runat="server" Text='<%#Eval("experianceprofile")%>'></asp:Label>
                                            </span>
                                        
                                            <span class="label1">Director Address
                                            </span>
                                            <span class="value1">

                                                <asp:Label ID="lblAdress2" runat="server" Text='<%#Eval("address")%>'></asp:Label>
                                            </span>
                                        
                                            <span class="label1">Director Phone Number
                                            </span>
                                            <span class="value1">
                                                <asp:Label ID="lblPhone2" runat="server" Text='<%#Eval("phoneno")%>'></asp:Label>
                                            </span>
                                        
                                            <span class="label1">Director email
                                            </span>
                                            <span class="value1">

                                                <asp:Label ID="lblEmail2" runat="server" Text='<%#Eval("email")%>'></asp:Label>
                                            </span>
                                       
                                    </div>
                                </ItemTemplate>
                      
                                <EditItemTemplate>
                                    <div class="frameHeading">Director Details</div>
                                    <div class="divStyle">
                                        
                                            <span class="label1">Director Name
                                            </span>
                                            <span class="value1">


                                                <asp:TextBox ID="txtName2" runat="server" Text='<%#Bind("name")%>'></asp:TextBox>
                                            </span>
                                        
                                            <span class="label1">director Experience profile
                                            </span>
                                            <span class="value1">


                                                <asp:TextBox ID="txtExperiancePofile2" runat="server" Text='<%#Bind("experianceprofile")%>'></asp:TextBox>
                                            </span>
                                        
                                            <span class="label1">Director Address
                                            </span>
                                            <span class="value1">

                                                <asp:TextBox ID="txtAdress2" runat="server" Text='<%#Bind("address")%>'></asp:TextBox>
                                            </span>
                                        
                                            <span class="label1">Director Phone Number
                                            </span>
                                            <span class="value1">

                                                <asp:TextBox ID="txtPhone2" runat="server" Text='<%#Bind("phoneno")%>'></asp:TextBox>
                                            </span>
                                        
                                            <span class="label1">Director email
                                            </span>
                                            <span class="value1">


                                                <asp:TextBox ID="txtEmail2" runat="server" Text='<%#Bind("email")%>'></asp:TextBox>

                                            </span>
                                        
                                    
                                     <span> <asp:Button ID="btnForm3Submit" runat="server" Text="Update" CommandName="Update" CssClass="btn btn-primary" style="margin-left:45%;"/></span>
                                    <span>  <asp:Button ID="btnForm3Cancel" runat="server" Text="Cancel" CommandName="Cancel" CssClass="btn btn-primary" style="margin-left:45%;"/>         </span>                                        </div>
                                </EditItemTemplate>


                            </asp:FormView>

                    
               </div>

            <!-- ---------formview3 end here ---------------->

           
            
                <div>
                   
                            <asp:FormView ID="FormView4" runat="server" OnItemUpdated="FormView4_ItemUpdated" OnItemUpdating="FormView4_ItemUpdating" DataKeyNames="applicationid" CellPadding="3" CellSpacing="2" Width="100%" BorderStyle="Solid" BorderWidth="0px">
                             
                                <ItemTemplate>
                                    <div class="frameHeading">Local Line Producer  Details</div>
                                     <div class="divStyle">

                                        <span class="label1">Local Line Producer Name</span>
                                            <span class="value1">
                                                <asp:Label ID="lblname3" runat="server" Text='<%#Eval("name")%>'></asp:Label>
                                            </span>
                                        
                                            <span class="label1">Local Line Producer Experience Profile</span>
                                            <span class="value1">
                                                <asp:Label ID="lblExperiancePofile3" runat="server" Text='<%#Eval("experianceprofile")%>'></asp:Label>
                                            </span>
                                        
                                            <span class="label1">Local Line Producer Address</span>
                                            <span class="value1">

                                                <asp:Label ID="lblAddress3" runat="server" Text='<%#Eval("address")%>'></asp:Label>
                                            </span>
                                        
                                            <span class="label1">Local Line Producer Phone Number</span>
                                            <span class="value1">

                                                <asp:Label ID="lblPhone3" runat="server" Text='<%#Eval("phoneno")%>'></asp:Label>
                                            </span>
                                        
                                            <span class="label1">Local Line Producer Email</span>
                                            <span class="value1">

                                                <asp:Label ID="lblEmail3" runat="server" Text='<%#Eval("email")%>'></asp:Label>
                                            </span>
                                        
                                    </div>
                                </ItemTemplate>
         
                                <EditItemTemplate>
                                    <div class="frameHeading">Local Line Producer  Details</div>
                                    <div class="divStyle">      
                                        
                                        <span class="label1">Local Line Producer Name</span>
                                            <span class="value1">

                                                <asp:TextBox ID="txtname3" runat="server" Text='<%#Bind("name")%>'></asp:TextBox>
                                            </span>
                                        
                                            <span class="label1">Local Line Producer Experience Profile</span>
                                            <span class="value1">

                                                <asp:TextBox ID="txtExperiancePofile3" runat="server" Text='<%#Bind("experianceprofile")%>'></asp:TextBox>
                                            </span>
                                        
                                            <span class="label1">Local Line Producer Address</span>
                                            <span class="value1">


                                                <asp:TextBox ID="txtAddress3" runat="server" Text='<%#Bind("address")%>'></asp:TextBox>
                                            </span>

                                            <span class="label1">Local Line Producer Phone Number</span>
                                            <span class="value1">


                                                <asp:TextBox ID="lblPhone3" runat="server" Text='<%#Bind("phoneno")%>'></asp:TextBox>
                                            </span>
                                            <span class="label1">Local Line Producer Email</span>
                                            <span class="value1">


                                                <asp:TextBox ID="txtEmail3" runat="server" Text='<%#Bind("email")%>'></asp:TextBox>
                                            </span>
                                     
                                  <span> <asp:Button ID="btnForm4Submit" CommandName="Update" runat="server" Text="Update" CssClass="btn btn-primary" style="margin-left:45%;"/></span>
                                    <span>    <asp:Button ID="btnForm4Cancel" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-primary" style="margin-left:45%;"/>         </span>
                                        </div>
                                </EditItemTemplate>
                               
                            </asp:FormView>
                       
                    </div>
         
                    <!--- form view 4 end--->


                    

                        <div>
                            
                                    <asp:FormView ID="FormView5" runat="server"  OnItemUpdated="FormView5_ItemUpdated" OnItemUpdating="FormView5_ItemUpdating" DataKeyNames="applicationid" CellPadding="3" CellSpacing="2" Width="100%" BorderStyle="Solid" BorderWidth="0px">
                                      
                                        <ItemTemplate>
                                            <div class="frameHeading">Movie Details</div>

                                            <div class="divStyle">  
                                           
                                                
                                                    <span class="label1">Actor Name</span>
                                                    <span class="value1">

                                                        <asp:Label ID="lblactor" runat="server" Text='<%#Eval("actor")%>'></asp:Label>

                                                    </span>
                                                
                                                    <span class="label1">Actress Name</span>
                                                    <span class="value1">

                                                        <asp:Label ID="lblActress" runat="server" Text='<%#Eval("actress")%>'></asp:Label>
                                                    </span>

                                                
                                                    <span class="label1">Total Number of cast</span>
                                                    <span class="value1">

                                                        <asp:Label ID="lblNoOfCast" runat="server" Text='<%#Eval("noofcast")%>'></asp:Label>
                                                    </span>
                                                
                                                    <span class="label1">Total Number of crew</span>
                                                    <span class="value1">

                                                        <asp:Label ID="lblTotalNoOfFilmUnit" runat="server" Text='<%#Eval("totalnooffilmunit")%>'></asp:Label>
                                                    </span>

                                                
                                                    <span class="label1">Date of commencement</span>
                                                    <span class="value1">

                                                        <asp:Label ID="lblDateOfCommencement" runat="server" Text='<%#Eval("dateofcommencement")%>'></asp:Label>
                                                    </span>
                                                
                                                    <span class="label1">Date of end</span>
                                                    <span class="value1">

                                                        <asp:Label ID="lblDateOfEnd" runat="server" Text='<%#Eval("dateofend")%>'></asp:Label>
                                                    </span>
                                                
                                                    <span class="label1">Place of stay</span>
                                                    <span class="value1">

                                                        <asp:Label ID="lblStayPlace" runat="server" Text='<%#Eval("stayplace")%>'></asp:Label>
                                                    </span>
                                                
                                                    <span class="label1">Realease Date</span>
                                                    <span class="value1">

                                                        <asp:Label ID="lblRealeaseDate" runat="server" Text='<%#Eval("releasedate")%>'></asp:Label>
                                                    </span>
                                               </div>

                                        </ItemTemplate>



                                        <EditItemTemplate>
                                            <div class="frameHeading">Movie Details</div>
                                         <div class="divStyle">  
                                                
                                                    <span class="label1">Actor Name</span>
                                                    <span class="value1">


                                                        <asp:TextBox ID="txtactor" runat="server" Text='<%#Bind("actor")%>'></asp:TextBox>
                                                    </span>
                                                
                                                    <span class="label1">Actress Name</span>
                                                    <span class="value1">


                                                        <asp:TextBox ID="txtActress" runat="server" Text='<%#Bind("actress")%>'></asp:TextBox>
                                                    </span>

                                                
                                                    <span class="label1">Total Number of cast</span>
                                                    <span class="value1">


                                                        <asp:TextBox ID="txtNoOfCast" runat="server" Text='<%#Bind("noofcast")%>'></asp:TextBox>
                                                    </span>
                                                
                                                    <span class="label1">Total Number of crew</span>
                                                    <span class="value1">


                                                        <asp:TextBox ID="txtTotalNoOfFilmUnit" runat="server" Text='<%#Bind("totalnooffilmunit")%>'></asp:TextBox>
                                                    </span>

                                                
                                                    <span class="label1">Date of commencement</span>
                                                    <span class="value1">


                                                        <%-- <asp:TextBox ID="txtDateOfCommencement" runat="server" Text='<%#Bind("dateofcommencement")%>' ></asp:TextBox>--%>
                                                        <ajaxToolkit:CalendarExtender ID="txtDateOfCommencement" runat="server" />
                                                    </span>
                                                
                                                    <span class="label1">Date of end</span>
                                                    <span class="value1">


                                                        <%--<asp:TextBox ID="txtDateOfEnd" runat="server" Text='<%#Bind("dateofend")%>'></asp:TextBox>--%>
                                                        <ajaxToolkit:CalendarExtender ID="txtDateOfEnd" runat="server" />
                                                    </span>
                                                
                                                    <span class="label1">Place of stay</span>
                                                    <span class="value1">


                                                        <asp:TextBox ID="txtStayPlace" runat="server" Text='<%#Bind("stayplace")%>'></asp:TextBox>
                                                    </span>
                                                

                                                    <span class="label1">Realease Date</span>
                                                    <span class="value1">

                                                        <%--  <asp:TextBox ID="txtRealeaseDate" runat="server" Text='<%#Bind("releasedate")%>'></asp:TextBox>--%>
                                                        <ajaxToolkit:CalendarExtender ID="txtRealeaseDate" runat="server" />
                                                    </span>
                                               
                                            
                                             <span> <asp:Button ID="btnForm5Update" runat="server" Text="Update" CommandName="Update" CssClass="btn btn-primary" style="margin-left:45%;"/></span>
                                    <span>    <asp:Button ID="btnForm5Cancel" runat="server" Text="Cancel" CssClass="btn btn-primary" CommandName="Cancel" style="margin-left:45%;"/>         </span>  
                                        </div>
                                             </EditItemTemplate>
                                        
                                    </asp:FormView>

                               
                       </div>
                    



            <!---- formview 5 end--->
         
        

    
                            </ContentTemplate>
                        </asp:UpdatePanel>
        
        <br />
        <span style="width:70%" >
         <%--<asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-primary" OnClick="btnCancel_Click" style="margin-left:55%;display:inline;"/>
        <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-primary" OnClick="btnEdit_Click" style="margin-left:1%;display:inline;"/>--%>
        <asp:Button ID="btnSubmit" runat="server" Text="Confirm" CssClass="btn btn-primary" OnClick="btnSubmit_Click" style="margin-left:1%;display:inline;"/>
        </span>
        <br />
        <br />
    </div>

</asp:Content>


