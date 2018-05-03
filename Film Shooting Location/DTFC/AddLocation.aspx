<%@ Page Title=" Add Location" Language="C#" MasterPageFile="~/DTFC/DTFCMaster.master" AutoEventWireup="true" CodeFile="AddLocation.aspx.cs" Inherits="Administrator_AddLocation" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        #mapCanvas {
    
    height: 400px;
    float: left;
  }
  #infoPanel {
    float: left;
    margin-left: 10px;
  }
  #infoPanel div {
    margin-bottom: 5px;
  }
   .alignment
    {
    text-align:center;
    }
   #menu1 #addLoc{
       background-color: #30A5FF;
       color:white;
   }
   
        </style>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyAYEqxURtf3lLs5kftvkBEoKLzrFNbKurk&callback=initMap"></script>
<script type="text/javascript">
var geocoder = new google.maps.Geocoder();

function geocodePosition(pos) {
  geocoder.geocode({
    latLng: pos
  }, function(responses) {
    if (responses && responses.length > 0) {
      updateMarkerAddress(responses[0].formatted_address);
    } else {
      updateMarkerAddress('Cannot determine address at this location.');
    }
  });
}

function updateMarkerStatus(str) {
  document.getElementById('markerStatus').innerHTML = str;
}

function updateMarkerPosition(latLng) {
  document.getElementById('info').innerHTML = [
    latLng.lat(),
    latLng.lng()
  ].join(', ');
    
document.getElementById("latlon1").value = latLng.lat();
         document.getElementById("latlon2").value = latLng.lng();
}

function updateMarkerAddress(str) {
  document.getElementById('address').innerHTML = str;
}

function initialize() {
  var latLng = new google.maps.LatLng(26.138215, 78.207801);
  var map = new google.maps.Map(document.getElementById('mapCanvas'), {
    zoom: 8,
    center: latLng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });
  var marker = new google.maps.Marker({
    position: latLng,
    title: 'Point A',
    map: map,
    draggable: true
  });

  // Update current position info.
  updateMarkerPosition(latLng);
  geocodePosition(latLng);

  // Add dragging event listeners.
  google.maps.event.addListener(marker, 'dragstart', function() {
    updateMarkerAddress('Dragging...');
  });

  google.maps.event.addListener(marker, 'drag', function() {
    updateMarkerStatus('Dragging...');
    updateMarkerPosition(marker.getPosition());
  });

  google.maps.event.addListener(marker, 'dragend', function() {
    updateMarkerStatus('Drag ended');
    geocodePosition(marker.getPosition());
  });
}

// Onload handler to fire off the app.
google.maps.event.addDomListener(window, 'load', initialize);
</script>    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
			<ol class="breadcrumb">
				<li><a href="/DTFC/Default.aspx">Dashboard</a></li>
                <li class="active">Add Location</li>
			</ol>
		    </div>
    <asp:UpdatePanel ID="adminCreateUser" runat="server">
        <ContentTemplate>
            <div class="row">
		        <div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-6 col-lg-6 col-md-offset-2">
			        <div class="login-panel panel panel-default alertForError">
				        <div class="panel-heading alignment" >Add Location</div>
				        <div class="panel-body">
        <%--					<form role="form">--%>
						        <fieldset>
							        <div class="form-group col-md-12 col-lg-12 col-sm-12"  >
                                        <input class="form-control" id="txtName" placeholder="Name"  name="txtName" type="text" autofocus="" runat="server" onblur="requiredField('txtName')" ClientIDMode="static">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" SetFocusOnError="true" ControlToValidate="txtName" ValidationGroup="btnAddLocation" cssClass="label label-danger" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                    </div>
                                    <div id="mapCanvas" class="col-lg-12 col-md-12 col-sm-12"></div>

                                    <div id="infoPanel">
    <b>Marker status:</b>
    <div id="markerStatus"><i>Click and drag the marker.</i></div>
    <b>Current position:</b>
    <div id="info"></div>
    <b>Closest matching address:</b>
    <div id="address"></div>
  </div>
                                    <input type="hidden" runat="server" id="latlon1" value="" ClientIDMode="static" />
                                  <input type="hidden" runat="server" id="latlon2" value="" ClientIDMode="static" />
                                    
                                    <asp:Button ID="Button1" runat="server" Text="select" OnClick="Button1_Click"/>
                                                                        
                           
                                    <div class="form-group col-md-12 col-lg-12 col-sm-12">
								        <input class="form-control" id="txtLatitude" placeholder="Latitude" name="txtLatitude" type="text"  runat="server" onblur="requiredField('txtLatitude')" ClientIDMode="static" >
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"  SetFocusOnError="true" ControlToValidate="txtLatitude" ValidationGroup="btnAddLocation" cssClass="label label-danger"  runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                    </div>

							        <div class="form-group col-md-12 col-lg-12 col-sm-12">
								        <input class="form-control" id="txtLongitude" placeholder="Longitude" name="txtLongitude" type="text"  runat="server" onblur="requiredField('txtLongitude')" ClientIDMode="static">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" SetFocusOnError="true" ControlToValidate="txtLongitude" ValidationGroup="btnAddLocation" cssClass="label label-danger" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                    </div>
                                    
                                    
                       
                                    <div class="form-group col-md-12 col-lg-12 col-sm-12">
                                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" style="resize:none" CssClass="form-control col-lg-12 col-md-12 col-sm-12" placeholder="Description"></asp:TextBox>           
                                    </div>
                                    <div class="form-group col-md-12 col-lg-12 col-sm-12">
                                        <asp:Label ID="Label1" runat="server" Text="Keywords" Font-Bold="True"></asp:Label>
                                    
                                        <hr />
                                        <asp:CheckBoxList ID="ChkAddLocation" runat="server" DataSourceID="SqlDataSource1" DataTextField="keywordname" DataValueField="keywordname" RepeatColumns="3" CssClass="col-lg-12 col-md-12 col-sm-12"></asp:CheckBoxList>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="Data Source=lizz;Initial Catalog=filmshooting;Persist Security Info=True;User ID=dbAdmin1;Password=sih2018" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [keywordname] FROM [scriptkeyworddetails]"></asp:SqlDataSource>
                                    </div>
                                    <div class="form-group col-md-12 col-lg-12 col-sm-12" style="height:4px">
                                    </div>
                                    
                                    <div class="form-group col-md-12 col-lg-12 col-sm-12" style="height:4px">
                                    </div>

                                    <div class="form-group col-md-12 col-lg-12 col-sm-12">
                                        <div class="form-group col-md-4 col-lg-4 col-sm-4" style="margin-top:10px">
                                            Location Pic
                                            </div>
                                        <div class="form-group col-md-8 col-lg-8 col-sm-8">
                                        <%--<ajaxToolkit:AsyncFileUpload ID="FileUploadController" runat="server" CssClass="form-control" />--%>
                                            <asp:FileUpload ID="FileUploadController" runat="server" CssClass="form-control"/>
                                    </div>
                                        </div>

                                    <div class="form-group col-md-12 col-lg-12 col-sm-12">
                                        <div class="panel panel-default">
                                            <div class="panel-heading"> Associated Stakeholder</div>
                                          <div class="panel-body" style="font-family: 'Lucida Sans'; font-weight: 100; font-style: normal; text-transform: capitalize">
                                             <div>
                                                <asp:CheckBoxList ID="cbStackholder" DataValueField="" runat="server" CellSpacing="1" RepeatLayout="Flow">
                                                </asp:CheckBoxList>
                                            </div>
                                          </div>
                                        </div>
                                    </div>
                       
                                    


                                    <asp:Button ID="btnAddLocation" ValidationGroup="btnAddLocation" class="btn btn-primary loginBtn col-md-3 buttonStyle" runat="server" Text="Add" OnClick="btnAddLocation_Click"/>
							         <asp:Button ID="btnCancel" class="btn btn-primary loginBtn col-md-3 buttonStyle" runat="server" Text="Cancel" OnClick="btnCancel_Click"/>

							        </fieldset>
				        </div>
			        </div>
		        </div>
	        </div>
        </ContentTemplate>
     </asp:UpdatePanel>
</asp:Content>

