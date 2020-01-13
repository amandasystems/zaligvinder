class OverviewTable:
    def __init__(self,urls):
        self._urls = urls
    
    def javascript (self):
        tt = '''<script>function addSummaryDataTable (data) {
        var tableRef = document.getElementById("overview_table").getElementsByTagName("tbody")[0];
	var row = tableRef.insertRow ();
	row.insertCell (0).innerHTML = data.Summary.solver;
        row.insertCell (1).innerHTML = data.Summary.satisfied;
        row.insertCell (2).innerHTML = data.Summary["not satisfied"];
        row.insertCell (3).innerHTML = data.Summary.Unknown;
        row.insertCell (4).innerHTML = data.Summary.error;
        row.insertCell (5).innerHTML = data.Summary.timeouted;
        row.insertCell (6).innerHTML = data.Summary.instances;
        row.insertCell (7).innerHTML = data.Summary.time;
        }
        function addSolversToOverViewTable () {'''
        
        return tt + "".join (['JSONGet ("{}",addSummaryDataTable);'.format(url) for url in self._urls])+'}</script>\n' 

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


class RankingTable:
    def __init__(self,url):
        self._url = url
    
    def javascript (self):
        tt = '''
        <script>function addRankingDataTable (data) {
            var tableRef = document.getElementById("ranking_table").getElementsByTagName("tbody")[0];
                for (var i in data){
                    var row = tableRef.insertRow ();
                    row.insertCell (0).innerHTML = '<span class="badge badge-'+String(parseInt(i)+1)+'">'+String(parseInt(i)+1)+'</span>';
                    row.insertCell (1).innerHTML = data[i].solver;
                    row.insertCell (2).innerHTML = data[i].points;
                }
            }
            function addRankingTable () {'''
        
        return tt + "JSONGet (\""+format(self._url)+"\",addRankingDataTable);}</script>\n" 

    def html (self):
        return '''<div class="clr-row"><div class="clr-col"><table class="table" id="ranking_table" >
        <thead>
        <tr>
            <th>#</th>
            <th>Solver</th>
            <th>Points</th>
        </tr>
    </thead>
    <tbody></tbody></table></div></div>'''


class ComparisonTable:
    def __init__(self,urls,activeSolvers,solvers,params):
        self._urls = urls
        self._solvers = solvers
        self._activeSolvers = activeSolvers
        self._inactiveSolvers = list(set(solvers).difference(set(activeSolvers)))
        self._curParams = params
    
    def javascript (self):
        tt = '''<script>function addComparisonDataTable (data) {
        var tableRef = document.getElementById("comparison_table").getElementsByTagName("tbody")[0];
        var row = tableRef.insertRow ();
        var i = Object.keys(data)[0]
        if(data[i]["error"] == 1){
            row.style = "background:#F5DBD9;color:#A32100;padding:5px;"    
        }
        else if(data[i]["unique"] == 1){
            row.style = "background:#DFF0D0;color:#266900;padding:5px;"    
        }
        else if(data[i]["unknown"] == 1){
            row.style = "background:#E1F1F6;color:#004A70;padding:5px;"    
        }
        row.insertCell (0).innerHTML = data[i]["name"];'''
        tableColumn = 1
        for s in self._activeSolvers:
            tt+='''row.insertCell ('''+str(tableColumn)+''').innerHTML = "";
                   row.insertCell ('''+str(tableColumn+1)+''').innerHTML = "<clr-icon shape='"+data[i][\''''+str(s)+'''\']['icon']+"'></clr-icon>";
                   row.insertCell ('''+str(tableColumn+2)+''').innerHTML = data[i]["'''+str(s)+'''"]["time"];
                   row.insertCell ('''+str(tableColumn+3)+''').innerHTML = "---";
                   '''
            tableColumn+=4


        tt+='''}
        function addInstaceToComparisonTable () {
        ''' #function addInstaceToComparisonTable () { JSONGet ("/instances/solvers/1/?solvers=z3seq&solvers=z3str3&solvers=cvc4&solvers=trau",addComparisonDataTable); }</script>'''
        
        return tt + "".join (['JSONGet ("{}",addComparisonDataTable);'.format(url) for url in self._urls])+'}</script>\n' 

    def _activateSolverUrl(self,solver):
        head = ""#"/comparison/"
        url = head + "?bgroup=" + self._curParams["bgroup"] + "&track=" + str(self._curParams["trackid"]) + ''.join("&solvers="+str(s) for s in (self._activeSolvers+[solver]))
        return url

    def _deactivateSolverUrl(self,solver):
        head = ""#"/comparison/"
        url = head + "?bgroup=" + self._curParams["bgroup"] + "&track=" + str(self._curParams["trackid"]) + ''.join("&solvers="+str(s) for s in set(self._activeSolvers).difference(set([solver])))
        return url


    def html (self):
        htmlout= '''

        <div class="clr-row">
    <div class="clr-col-24 clr-col-sm-6">
        <div class="card">
            <div class="card-block">
                <h4 class="card-title">Selected Solvers</h4>
                <p class="card-text">Click a badge add a solver to the comparison.</p><p class="card-text">'''

        for s in self._activeSolvers:
            htmlout+='''<a href="'''+self._deactivateSolverUrl(s)+'''" class="label label-success ng-star-inserted clickable">
                '''+str(s)+''' <clr-icon shape="close"> </clr-icon>
            </a>'''

        for s in self._inactiveSolvers:
            htmlout+='''<a href="'''+str(self._activateSolverUrl(s))+'''" class="label clickable">
                '''+str(s)+'''
            </a>'''
               
        htmlout+='''</p></div>
                </div>
            </div>
        </div>'''

        htmlout+= '''<div class="clr-row"><div class="clr-col">'''

        htmlout+='''<table class="table table-compact table-noborder" id="comparison_table" >
        <thead>'''
        htmlout+="<tr><th></th>"

        for s in self._activeSolvers:
            htmlout+="<th colspan='4'>"+str(s)+"</th>"
            
        htmlout+='''</tr>'''

        htmlout+="<tr><th>Instance</th>"

        for s in self._activeSolvers:
            htmlout+="<th style='width:50px;'></th><th>Result</th><th>Time</th><th>Model</th>"
        htmlout+='''</tr>'''




        htmlout+='''</thead>
    <tbody></tbody></table></div></div>'''
        return htmlout

class Distribution:
    def __init__(self,url):
        self._url = url
        
    def html (self):
        return  '''<div class="clr-row">  
        <div class="clr-col">
        <div class="card card-block" style="min-width:300px">
        <h3 class="card-title">Distribution diagramm</h3>
        <div class="ct-chart" id="distr1"></div>
        </div>
        </div>
        </div>'''

    def javascript (self):
        return '''<script>
        function addDataToChart (data) {
        snames = Object.keys(data);
        
          satislist = [];
          nsatislist = [];
          unklist = [];
          for (var i = 0; i < snames.length; i++) {
            var dd = data[snames[i]];
            satislist.push (dd.satis);
            nsatislist.push (dd.nsatis);
            unklist.push (dd.unk);
          }
          var datadistr1 = { "labels": snames,
        "series": [ 
        { "name": "satisfiable", "data": satislist},
        { "name": "unsatisfiable", "data": nsatislist},
        { "name": "unknown", "data": unklist},
        ]
        };
        console.log(datadistr1)
var optionsdistr1 = { fullWidth: true,chartPadding: {right: 40}, plugins: [Chartist.plugins.legend({})] };
        new Chartist.Bar("#distr1", datadistr1,optionsdistr1);

        }
        
        function setupDistChart() {
          JSONGet ("'''+"{}".format(self._url)+'''",addDataToChart)
        }
          </script>'''


class Pie:
    def __init__(self,url):
        self._url = url

    
    def html (self):
        return  '''<div id="pie-row" class="clr-row"> </div>'''

    def javascript (self):
        return '''<script>
        function addDataToPieChart (data) {
        var mainDiv = document.getElementById ("pie-row");
        
        snames = Object.keys(data);
        for (var i = 0; i < snames.length; i++) {
            console.log (data);
            var dd = data[snames[i]];
            
            var head = document.createElement ("h3");
            head.setAttribute ("class","card-title");
            head.innerHTML = "Pie Chart for " + snames[i];
            var chart = document.createElement ("div")
            chartname = snames[i]+"pie";
            chart.setAttribute ("class","ct-chart");
            chart.setAttribute ("id",chartname);
            
            var card = document.createElement ("div");
            card.setAttribute ("class","card card-block");
            card.setAttribute ("style","min-width:350px");
            card.appendChild ( head);
            card.appendChild ( chart);
            var col = document.createElement ("div");
            col.setAttribute ("class","clr-col");
            col.appendChild (card);
            console.log ("HHH");
            mainDiv.appendChild (col);
        
           var cdata = { "labels": ["sat", "unsat", "unknown"],
"series": [dd.satis, dd.nsatis, dd.unk]};
            var options = { showLabel: false,plugins: [Chartist.plugins.legend()] };
            new Chartist.Pie("#"+chartname, cdata,options);
          
        }
        

        }
        
        function setupPieChart() {
          JSONGet ("'''+"{}".format(self._url)+'''",addDataToPieChart)
        }
          </script>'''
        
    

class Cactus:
    def __init__ (self,title,url,id):
        self._title = title
        self._id = id
        self._url = url

    
    def html (self):
        return  '''<div class="clr-row">  <div class="clr-col">
        <div class="card card-block" style="min-width:300px">
        <h3 class="card-title">''' + self._title + '''</h3>
        <div class="ct-chart" id="'''+self._id+'''">
        </div>
        </div>
        </div>
        </div>'''

    def javascript (self):
        return "<script>function updateCactus{}".format (self._id)+ ''' (data) {
           snames = Object.keys(data);
           var series = []
           for (var i = 0; i < snames.length; i++) {
            var points = [];
            var dd = data[snames[i]];
        
            for (var j = 0; j < dd.length; j++) {
              points.push (dd[j].y);
            }
            series.push ({"name" : snames[i], 
                        "data" : points});
         }
          var cactdata = {"labels" : [], "series" : series}
          var optionscactus = { showPoint: false, fullWidth: true, chartPadding: {right: 40}, height: '200px', showArea: true,axisX: {showGrid: false, showLabel: true}, axisY: {offset: 60,labelInterpolationFnc: function(value) {return value + 'ms';}},plugins: [Chartist.plugins.legend({})] };'''+'''new Chartist.Line("#{}"'''.format(self._id)+''', cactdata,optionscactus);}
          '''+"function setupCactus{} ()".format (self._id)+ '''{
          '''+'''JSONGet ("{}",updateCactus{})'''.format(self._url,self._id)+";}</script>"
          
          
    
