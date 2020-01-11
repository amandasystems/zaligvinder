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
        
        return tt + "".join (['JSONGet ("{}",addSummaryDataTable);'.format(url) for url in self._urls])+'}</script>' 

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
          
          
    
