<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=utf-8" language="java" import="org.joda.time.LocalDateTime,
org.joda.time.format.DateTimeFormatter,
org.joda.time.format.ISODateTimeFormat,java.net.*,
org.ecocean.grid.*,org.ecocean.movement.*,
java.io.*,java.util.*, java.io.FileInputStream, java.util.Date, java.text.SimpleDateFormat, java.io.File, java.io.FileNotFoundException, org.ecocean.*,org.ecocean.servlet.*,javax.jdo.*, java.lang.StringBuffer, java.util.Vector, java.util.Iterator, java.lang.NumberFormatException"%>

<%
String context="context0";
context=ServletUtilities.getContext(request);
String langCode=ServletUtilities.getLanguageCode(request);
Shepherd myShepherd=new Shepherd(context);

Properties props = new Properties();
Properties surveyProps = new Properties();
 
myShepherd.beginDBTransaction();

props = ShepherdProperties.getProperties("createSurvey.properties", langCode,context);
surveyProps = ShepherdProperties.getProperties("createSurvey.properties", langCode,context);


%>

<jsp:include page="../header.jsp" flush="true" />

<script type="text/javascript">

</script>

<div class="container maincontent">
	<div class="row">
		<div class="col-md-3">
		</div>
	
		<div class="col-md-6">
			<h3><%=props.getProperty("createSurvey") %></h3>
			<label><%=props.getProperty("addSurveyDesc") %></label>
			<hr/>		
				 <div title="<%=props.getProperty("addTag")%>" class="editFormSurvey">
					 <form name="addTag" action="../SurveyCreate" method="post" class="editFormSurvey">
						
						<label><%=props.getProperty("date")%></label>
						<div class="input-group date" data-provide="datepicker">
						    <input name="date" type="text" class="form-control datepicker" id="addSurveyInput0"/>
						    <div class="input-group-addon">
						        <span class="glyphicon glyphicon-th"></span>
						    </div>
						</div>
						
						
						<label><%=props.getProperty("project")%></label>
						<input name="project" type="text" class="form-control" id="addSurveyInput1" />
						
						<label><%=props.getProperty("organization")%></label>
						<input name="organization" type="text" class="form-control" id="addSurveyInput2" />
						
						<label><%=props.getProperty("startTime")%></label>
						<div class="input-group start-clockpicker">
						    <input name="startTime" type="text" class="form-control" value="12:00" id="addTagInput3"/>
						    <span class="input-group-addon">
						        <span class="glyphicon glyphicon-time"></span>
						    </span>
						</div>
						
						<label><%=props.getProperty("endTime")%></label>
						<div class="input-group end-clockpicker">
						    <input name="endTime" type="text" class="form-control" value="12:00" id="addTagInput4"/>
						    <span class="input-group-addon">
						        <span class="glyphicon glyphicon-time"></span>
						    </span>
						</div>
						
						<label><%=props.getProperty("effort")%>:</label>
						<input name="effort" type="text" class="form-control" id="addTagInput5" />
						
						<label><%=props.getProperty("type")%>:</label>
						<input name="type" type="text" class="form-control" id="addTagInput7" />
						
						<label><%=props.getProperty("comments")%>:</label>
						<input name="comments" type="text" class="form-control" id="addTagInput6" />
						
						
						<input name="Create Survey" type="submit" id="addSurveyBtn" value="<%=props.getProperty("submit")%>" class="btn btn-sm editFormBtn" />
				   								
						<input name="Define Survey Track" type="submit" id="addSurveyTrackBtn" value="<%=props.getProperty("defineTrack")%>" class="btn btn-sm editFormBtn" />
				   
				    </form>
				</div>
			<div id="errorSpan"></div>
		
		</div>
		<div class="col-md-12">

		</div>

	</div>
</div>

<input name="time" value="" />
<script type="text/javascript">
    $(document).ready(function(){
        $('.start-clockpicker').clockpicker();
        $('.end-clockpicker').clockpicker();   
        
        $('.datepicker').datepicker({
            format: 'mm/dd/yyyy',
            startDate: '-3d'
        });
        
    });
    
    
</script>

<jsp:include page="../footer.jsp" flush="true" />


