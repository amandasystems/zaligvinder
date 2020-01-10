class OverviewTable:
    def __init__(self):
        pass
    
    def javascript (self):
        return '''<script>function addSummaryDataTable (data) {
        console.log (data)
	var tableRef = document.getElementById("overview_table").getElementsByTagName("tbody")[0];
	var row = tableRef.insertRow ();
	row.insertCell (0).innerHTML = data.Summary.solver;
        row.insertCell (1).innerHTML = data.Summary.satisfied;
        row.insertCell (2).innerHTML = data.Summary["not satisfied"];
        row.insertCell (3).innerHTML = data.Summary.Unknown;
        row.insertCell (4).innerHTML = "--";
        row.insertCell (5).innerHTML = data.Summary.timeouted;
        row.insertCell (6).innerHTML = data.Summary.instances;
        row.insertCell (7).innerHTML = data.Summary.time;
        
        
        }
        </script>
        '''

    def html (self):
        return '''<div class="clr-row"><div class="clr-col"><table class="table" id="overview_table" >
        <thead>
        <tr>
            <th>Tool name</th>
            <th>Declared satisfiable</th>
            <th>Declared unsatisfiable</th>
            <th>Declared unknown</th>
            <th>Error</th>
            <th>Timeout</th>
            <th>Total instances</th>
            <th>Total time</th>
            <!--<th>Total time w/o Timeout</th>-->
        </tr>
    </thead>
    <tbody></tbody></table></div></div>'''
