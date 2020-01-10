import webserver.views.TextView

class BaseView(webserver.views.TextView.TextView):
    def __init__ (self):
        super().__init__()
        
    def header (self,sendto):
        sendto.send_header ('Content-type','text/html')
        sendto.end_headers ()

    def response_code (self,sendto):
        sendto.send_response (200)

    def writeTop (self,sendto):
        top = '''<!DOCTYPE html>
        <html>
        <head>
          <link rel="stylesheet" href="https://unpkg.com/@clr/ui/clr-ui.min.css" />
          <link rel="stylesheet" href="https://unpkg.com/clarity-icons/clarity-icons.min.css">
          <script src="https://unpkg.com/@webcomponents/custom-elements/custom-elements.min.js"></script>
          <script src="https://unpkg.com/clarity-icons/clarity-icons.min.js"></script>

                      <style>.ct-double-octave:after,.ct-golden-section:after,.ct-major-eleventh:after,.ct-major-second:after,.ct-major-seventh:after,.ct-major-sixth:after,.ct-major-tenth:after,.ct-major-third:after,.ct-major-twelfth:after,.ct-minor-second:after,.ct-minor-seventh:after,.ct-minor-sixth:after,.ct-minor-third:after,.ct-octave:after,.ct-perfect-fifth:after,.ct-perfect-fourth:after,.ct-square:after{content:"";clear:both}.ct-label{fill:rgba(0,0,0,.4);color:rgba(0,0,0,.4);font-size:.75rem;line-height:1}.ct-chart-bar .ct-label,.ct-chart-line .ct-label{display:block;display:-webkit-box;display:-moz-box;display:-ms-flexbox;display:-webkit-flex;display:flex}.ct-chart-donut .ct-label,.ct-chart-pie .ct-label{dominant-baseline:central}.ct-label.ct-horizontal.ct-start{-webkit-box-align:flex-end;-webkit-align-items:flex-end;-ms-flex-align:flex-end;align-items:flex-end;-webkit-box-pack:flex-start;-webkit-justify-content:flex-start;-ms-flex-pack:flex-start;justify-content:flex-start;text-align:left;text-anchor:start}.ct-label.ct-horizontal.ct-end{-webkit-box-align:flex-start;-webkit-align-items:flex-start;-ms-flex-align:flex-start;align-items:flex-start;-webkit-box-pack:flex-start;-webkit-justify-content:flex-start;-ms-flex-pack:flex-start;justify-content:flex-start;text-align:left;text-anchor:start}.ct-label.ct-vertical.ct-start{-webkit-box-align:flex-end;-webkit-align-items:flex-end;-ms-flex-align:flex-end;align-items:flex-end;-webkit-box-pack:flex-end;-webkit-justify-content:flex-end;-ms-flex-pack:flex-end;justify-content:flex-end;text-align:right;text-anchor:end}.ct-label.ct-vertical.ct-end{-webkit-box-align:flex-end;-webkit-align-items:flex-end;-ms-flex-align:flex-end;align-items:flex-end;-webkit-box-pack:flex-start;-webkit-justify-content:flex-start;-ms-flex-pack:flex-start;justify-content:flex-start;text-align:left;text-anchor:start}.ct-chart-bar .ct-label.ct-horizontal.ct-start{-webkit-box-align:flex-end;-webkit-align-items:flex-end;-ms-flex-align:flex-end;align-items:flex-end;-webkit-box-pack:center;-webkit-justify-content:center;-ms-flex-pack:center;justify-content:center;text-align:center;text-anchor:start}.ct-chart-bar .ct-label.ct-horizontal.ct-end{-webkit-box-align:flex-start;-webkit-align-items:flex-start;-ms-flex-align:flex-start;align-items:flex-start;-webkit-box-pack:center;-webkit-justify-content:center;-ms-flex-pack:center;justify-content:center;text-align:center;text-anchor:start}.ct-chart-bar.ct-horizontal-bars .ct-label.ct-horizontal.ct-start{-webkit-box-align:flex-end;-webkit-align-items:flex-end;-ms-flex-align:flex-end;align-items:flex-end;-webkit-box-pack:flex-start;-webkit-justify-content:flex-start;-ms-flex-pack:flex-start;justify-content:flex-start;text-align:left;text-anchor:start}.ct-chart-bar.ct-horizontal-bars .ct-label.ct-horizontal.ct-end{-webkit-box-align:flex-start;-webkit-align-items:flex-start;-ms-flex-align:flex-start;align-items:flex-start;-webkit-box-pack:flex-start;-webkit-justify-content:flex-start;-ms-flex-pack:flex-start;justify-content:flex-start;text-align:left;text-anchor:start}.ct-chart-bar.ct-horizontal-bars .ct-label.ct-vertical.ct-start{-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center;-webkit-box-pack:flex-end;-webkit-justify-content:flex-end;-ms-flex-pack:flex-end;justify-content:flex-end;text-align:right;text-anchor:end}.ct-chart-bar.ct-horizontal-bars .ct-label.ct-vertical.ct-end{-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center;-webkit-box-pack:flex-start;-webkit-justify-content:flex-start;-ms-flex-pack:flex-start;justify-content:flex-start;text-align:left;text-anchor:end}.ct-grid{stroke:rgba(0,0,0,.2);stroke-width:1px;stroke-dasharray:2px}.ct-grid-background{fill:none}.ct-point{stroke-width:10px;stroke-linecap:round}.ct-line{fill:none;stroke-width:4px}.ct-area{stroke:none;fill-opacity:.1}.ct-bar{fill:none;stroke-width:10px}.ct-slice-donut{fill:none;stroke-width:60px}.ct-series-a .ct-bar,.ct-series-a .ct-line,.ct-series-a .ct-point,.ct-series-a .ct-slice-donut{stroke:#d70206}.ct-series-a .ct-area,.ct-series-a .ct-slice-donut-solid,.ct-series-a .ct-slice-pie{fill:#d70206}.ct-series-b .ct-bar,.ct-series-b .ct-line,.ct-series-b .ct-point,.ct-series-b .ct-slice-donut{stroke:#f05b4f}.ct-series-b .ct-area,.ct-series-b .ct-slice-donut-solid,.ct-series-b .ct-slice-pie{fill:#f05b4f}.ct-series-c .ct-bar,.ct-series-c .ct-line,.ct-series-c .ct-point,.ct-series-c .ct-slice-donut{stroke:#f4c63d}.ct-series-c .ct-area,.ct-series-c .ct-slice-donut-solid,.ct-series-c .ct-slice-pie{fill:#f4c63d}.ct-series-d .ct-bar,.ct-series-d .ct-line,.ct-series-d .ct-point,.ct-series-d .ct-slice-donut{stroke:#d17905}.ct-series-d .ct-area,.ct-series-d .ct-slice-donut-solid,.ct-series-d .ct-slice-pie{fill:#d17905}.ct-series-e .ct-bar,.ct-series-e .ct-line,.ct-series-e .ct-point,.ct-series-e .ct-slice-donut{stroke:#453d3f}.ct-series-e .ct-area,.ct-series-e .ct-slice-donut-solid,.ct-series-e .ct-slice-pie{fill:#453d3f}.ct-series-f .ct-bar,.ct-series-f .ct-line,.ct-series-f .ct-point,.ct-series-f .ct-slice-donut{stroke:#59922b}.ct-series-f .ct-area,.ct-series-f .ct-slice-donut-solid,.ct-series-f .ct-slice-pie{fill:#59922b}.ct-series-g .ct-bar,.ct-series-g .ct-line,.ct-series-g .ct-point,.ct-series-g .ct-slice-donut{stroke:#0544d3}.ct-series-g .ct-area,.ct-series-g .ct-slice-donut-solid,.ct-series-g .ct-slice-pie{fill:#0544d3}.ct-series-h .ct-bar,.ct-series-h .ct-line,.ct-series-h .ct-point,.ct-series-h .ct-slice-donut{stroke:#6b0392}.ct-series-h .ct-area,.ct-series-h .ct-slice-donut-solid,.ct-series-h .ct-slice-pie{fill:#6b0392}.ct-series-i .ct-bar,.ct-series-i .ct-line,.ct-series-i .ct-point,.ct-series-i .ct-slice-donut{stroke:#f05b4f}.ct-series-i .ct-area,.ct-series-i .ct-slice-donut-solid,.ct-series-i .ct-slice-pie{fill:#f05b4f}.ct-series-j .ct-bar,.ct-series-j .ct-line,.ct-series-j .ct-point,.ct-series-j .ct-slice-donut{stroke:#dda458}.ct-series-j .ct-area,.ct-series-j .ct-slice-donut-solid,.ct-series-j .ct-slice-pie{fill:#dda458}.ct-series-k .ct-bar,.ct-series-k .ct-line,.ct-series-k .ct-point,.ct-series-k .ct-slice-donut{stroke:#eacf7d}.ct-series-k .ct-area,.ct-series-k .ct-slice-donut-solid,.ct-series-k .ct-slice-pie{fill:#eacf7d}.ct-series-l .ct-bar,.ct-series-l .ct-line,.ct-series-l .ct-point,.ct-series-l .ct-slice-donut{stroke:#86797d}.ct-series-l .ct-area,.ct-series-l .ct-slice-donut-solid,.ct-series-l .ct-slice-pie{fill:#86797d}.ct-series-m .ct-bar,.ct-series-m .ct-line,.ct-series-m .ct-point,.ct-series-m .ct-slice-donut{stroke:#b2c326}.ct-series-m .ct-area,.ct-series-m .ct-slice-donut-solid,.ct-series-m .ct-slice-pie{fill:#b2c326}.ct-series-n .ct-bar,.ct-series-n .ct-line,.ct-series-n .ct-point,.ct-series-n .ct-slice-donut{stroke:#6188e2}.ct-series-n .ct-area,.ct-series-n .ct-slice-donut-solid,.ct-series-n .ct-slice-pie{fill:#6188e2}.ct-series-o .ct-bar,.ct-series-o .ct-line,.ct-series-o .ct-point,.ct-series-o .ct-slice-donut{stroke:#a748ca}.ct-series-o .ct-area,.ct-series-o .ct-slice-donut-solid,.ct-series-o .ct-slice-pie{fill:#a748ca}.ct-square{display:block;position:relative;width:100%}.ct-square:before{display:block;float:left;content:"";width:0;height:0;padding-bottom:100%}.ct-square:after{display:table}.ct-square>svg{display:block;position:absolute;top:0;left:0}.ct-minor-second{display:block;position:relative;width:100%}.ct-minor-second:before{display:block;float:left;content:"";width:0;height:0;padding-bottom:93.75%}.ct-minor-second:after{display:table}.ct-minor-second>svg{display:block;position:absolute;top:0;left:0}.ct-major-second{display:block;position:relative;width:100%}.ct-major-second:before{display:block;float:left;content:"";width:0;height:0;padding-bottom:88.8888888889%}.ct-major-second:after{display:table}.ct-major-second>svg{display:block;position:absolute;top:0;left:0}.ct-minor-third{display:block;position:relative;width:100%}.ct-minor-third:before{display:block;float:left;content:"";width:0;height:0;padding-bottom:83.3333333333%}.ct-minor-third:after{display:table}.ct-minor-third>svg{display:block;position:absolute;top:0;left:0}.ct-major-third{display:block;position:relative;width:100%}.ct-major-third:before{display:block;float:left;content:"";width:0;height:0;padding-bottom:80%}.ct-major-third:after{display:table}.ct-major-third>svg{display:block;position:absolute;top:0;left:0}.ct-perfect-fourth{display:block;position:relative;width:100%}.ct-perfect-fourth:before{display:block;float:left;content:"";width:0;height:0;padding-bottom:75%}.ct-perfect-fourth:after{display:table}.ct-perfect-fourth>svg{display:block;position:absolute;top:0;left:0}.ct-perfect-fifth{display:block;position:relative;width:100%}.ct-perfect-fifth:before{display:block;float:left;content:"";width:0;height:0;padding-bottom:66.6666666667%}.ct-perfect-fifth:after{display:table}.ct-perfect-fifth>svg{display:block;position:absolute;top:0;left:0}.ct-minor-sixth{display:block;position:relative;width:100%}.ct-minor-sixth:before{display:block;float:left;content:"";width:0;height:0;padding-bottom:62.5%}.ct-minor-sixth:after{display:table}.ct-minor-sixth>svg{display:block;position:absolute;top:0;left:0}.ct-golden-section{display:block;position:relative;width:100%}.ct-golden-section:before{display:block;float:left;content:"";width:0;height:0;padding-bottom:61.804697157%}.ct-golden-section:after{display:table}.ct-golden-section>svg{display:block;position:absolute;top:0;left:0}.ct-major-sixth{display:block;position:relative;width:100%}.ct-major-sixth:before{display:block;float:left;content:"";width:0;height:0;padding-bottom:60%}.ct-major-sixth:after{display:table}.ct-major-sixth>svg{display:block;position:absolute;top:0;left:0}.ct-minor-seventh{display:block;position:relative;width:100%}.ct-minor-seventh:before{display:block;float:left;content:"";width:0;height:0;padding-bottom:56.25%}.ct-minor-seventh:after{display:table}.ct-minor-seventh>svg{display:block;position:absolute;top:0;left:0}.ct-major-seventh{display:block;position:relative;width:100%}.ct-major-seventh:before{display:block;float:left;content:"";width:0;height:0;padding-bottom:53.3333333333%}.ct-major-seventh:after{display:table}.ct-major-seventh>svg{display:block;position:absolute;top:0;left:0}.ct-octave{display:block;position:relative;width:100%}.ct-octave:before{display:block;float:left;content:"";width:0;height:0;padding-bottom:50%}.ct-octave:after{display:table}.ct-octave>svg{display:block;position:absolute;top:0;left:0}.ct-major-tenth{display:block;position:relative;width:100%}.ct-major-tenth:before{display:block;float:left;content:"";width:0;height:0;padding-bottom:40%}.ct-major-tenth:after{display:table}.ct-major-tenth>svg{display:block;position:absolute;top:0;left:0}.ct-major-eleventh{display:block;position:relative;width:100%}.ct-major-eleventh:before{display:block;float:left;content:"";width:0;height:0;padding-bottom:37.5%}.ct-major-eleventh:after{display:table}.ct-major-eleventh>svg{display:block;position:absolute;top:0;left:0}.ct-major-twelfth{display:block;position:relative;width:100%}.ct-major-twelfth:before{display:block;float:left;content:"";width:0;height:0;padding-bottom:33.3333333333%}.ct-major-twelfth:after{display:table}.ct-major-twelfth>svg{display:block;position:absolute;top:0;left:0}.ct-double-octave{display:block;position:relative;width:100%}.ct-double-octave:before{display:block;float:left;content:"";width:0;height:0;padding-bottom:25%}.ct-double-octave:after{display:table}.ct-double-octave>svg{display:block;position:absolute;top:0;left:0}</style>
        <style>
       .ct-chart {
           position: relative;
       }
       .ct-chart-line, .ct-chart-bar {
           min-height:200px;
       }
       .ct-vertical, .ct-label{
            font-size:10px;
       }
       .ct-legend {
           position: relative;
           z-index: 10;
           list-style: none;
           text-align: center;
       }
       .ct-legend li {
           position: relative;
           padding-left: 23px;
           margin-right: 10px;
           margin-bottom: 3px;
           cursor: pointer;
           display: inline-block;
       }
       .ct-legend li:before {
           width: 12px;
           height: 12px;
           position: absolute;
           left: 0;
           content: '';
           border: 3px solid transparent;
           border-radius: 2px;
       }
       .ct-legend li.inactive:before {
           background: transparent;
       }
       .ct-legend.ct-legend-inside {
           position: absolute;
           top: 0;
           right: 0;
       }
       .ct-legend.ct-legend-inside li{
           display: block;
           margin: 0;
       }
       .ct-legend .ct-series-0:before {
           background-color: hsl(198, 100%, 24%);
           border-color: hsl(198, 100%, 24%);
       }
       .ct-legend .ct-series-1:before {
           background-color: hsl(198, 0%, 27%);
           border-color: hsl(198, 0%, 27%);
       }
       .ct-legend .ct-series-2:before {
           background-color: hsl(282, 43%, 54%);
           border-color: hsl(282, 43%, 54%);
       }
       .ct-legend .ct-series-3:before {
           background-color: hsl(198, 54%, 92%);
           border-color: hsl(198, 54%, 92%);
       }
       .ct-legend .ct-series-4:before {
           background-color: hsl(198, 58%, 78%);
           border-color: hsl(198, 58%, 78%);
       }

        .ct-series-a .ct-point, .ct-series-a .ct-line, .ct-series-a .ct-bar, .ct-series-a .ct-slice-donut {
          stroke: hsl(198, 100%, 24%); }

        .ct-series-a .ct-slice-pie, .ct-series-a .ct-slice-donut-solid, .ct-series-a .ct-area {
          fill: hsl(198, 100%, 24%); }

        .ct-series-b .ct-point, .ct-series-b .ct-line, .ct-series-b .ct-bar, .ct-series-b .ct-slice-donut {
          stroke: hsl(198, 0%, 27%); }

        .ct-series-b .ct-slice-pie, .ct-series-b .ct-slice-donut-solid, .ct-series-b .ct-area {
          fill: hsl(198, 0%, 27%); }

        .ct-series-c .ct-point, .ct-series-c .ct-line, .ct-series-c .ct-bar, .ct-series-c .ct-slice-donut {
          stroke: hsl(282, 43%, 54%); }

        .ct-series-c .ct-slice-pie, .ct-series-c .ct-slice-donut-solid, .ct-series-c .ct-area {
          fill: hsl(282, 43%, 54%); }

        .ct-series-d .ct-point, .ct-series-d .ct-line, .ct-series-d .ct-bar, .ct-series-d .ct-slice-donut {
          stroke: hsl(198, 54%, 92%); }

        .ct-series-d .ct-slice-pie, .ct-series-d .ct-slice-donut-solid, .ct-series-d .ct-area {
          fill: hsl(198, 54%, 92%); }

        .ct-series-e .ct-point, .ct-series-e .ct-line, .ct-series-e .ct-bar, .ct-series-e .ct-slice-donut {
          stroke: hsl(198, 58%, 78%); }

        .ct-series-e .ct-slice-pie, .ct-series-e .ct-slice-donut-solid, .ct-series-e .ct-area {
          fill: hsl(198, 58%, 78%); }

        .ct-series-f .ct-point, .ct-series-f .ct-line, .ct-series-f .ct-bar, .ct-series-f .ct-slice-donut {
          stroke: hsl(198, 0%, 45%); }

        .ct-series-f .ct-slice-pie, .ct-series-f .ct-slice-donut-solid, .ct-series-f .ct-area {
          fill: hsl(198, 0%, 45%); }

        .ct-series-g .ct-point, .ct-series-g .ct-line, .ct-series-g .ct-bar, .ct-series-g .ct-slice-donut {
          stroke: hsl(14, 91%, 55%); }

        .ct-series-g .ct-slice-pie, .ct-series-g .ct-slice-donut-solid, .ct-series-g .ct-area {
          fill: hsl(14, 91%, 55%); }

        .ct-series-h .ct-point, .ct-series-h .ct-line, .ct-series-h .ct-bar, .ct-series-h .ct-slice-donut {
          stroke: hsl(14, 83%, 84%); }

        .ct-series-h .ct-slice-pie, .ct-series-h .ct-slice-donut-solid, .ct-series-h .ct-area {
          fill: hsl(14, 83%, 84%); }

        .ct-series-i .ct-point, .ct-series-i .ct-line, .ct-series-i .ct-bar, .ct-series-i .ct-slice-donut {
          stroke: #f05b4f; }

        .ct-series-i .ct-slice-pie, .ct-series-i .ct-slice-donut-solid, .ct-series-i .ct-area {
          fill: #f05b4f; }

        .ct-series-j .ct-point, .ct-series-j .ct-line, .ct-series-j .ct-bar, .ct-series-j .ct-slice-donut {
          stroke: #dda458; }

        .ct-series-j .ct-slice-pie, .ct-series-j .ct-slice-donut-solid, .ct-series-j .ct-area {
          fill: #dda458; }

        .ct-series-k .ct-point, .ct-series-k .ct-line, .ct-series-k .ct-bar, .ct-series-k .ct-slice-donut {
          stroke: #eacf7d; }

        .ct-series-k .ct-slice-pie, .ct-series-k .ct-slice-donut-solid, .ct-series-k .ct-area {
          fill: #eacf7d; }

        .ct-series-l .ct-point, .ct-series-l .ct-line, .ct-series-l .ct-bar, .ct-series-l .ct-slice-donut {
          stroke: #86797d; }

        .ct-series-l .ct-slice-pie, .ct-series-l .ct-slice-donut-solid, .ct-series-l .ct-area {
          fill: #86797d; }
    </style>
        </head>'''
        sendto.write (bytes(top,"utf8"))

    
    def send_content (self,sendto):
        pass
        
    def message (self,sendto):
        self.writeTop (sendto)
        sendto.write (bytes('''<body onload="getTableData();" >''',"utf8"))
        sendto.write (bytes(f'''<script src="/files/libs/chartist/dist/chartist.min.js"></script>
        <script src="/files/libs/chartist/chartist-plugin-legend.js"></script>
        <script src="files/js/helper.js"></script> 
        <div class="main-container">''',"utf8"))
        top = '''<script>function addSummaryDataTable (data) {
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
        function addSolversToOverViewTable (solvers) {
	var length = solvers.length;
	for (var i = 0; i< length; i++) {''' 
        top2 = 'JSONGet ("/summary/"+solvers[i]+"/{}",addSummaryDataTable)'.format(self._ctrackid)
        top3 = '''
        }
        }
        function getTableData () {
	getSolvers (addSolversToOverViewTable)
        }</script>'''
        sendto.write (bytes(top+top2+top3,"utf8"))
        self.send_content (sendto)
        sendto.write (bytes("</div></body></html>","utf8"))
        

class BenchmarkTrackView(BaseView):
    def __init__(self,
                 benchmarks,
                 tracks,
                 benchmark,
                 trackname,
                 ctrackid
    ):
        self._bmarks = benchmarks
        self._curBenchmark = benchmark
        self._tracks = tracks
        self._ctrack = trackname
        self._ctrackid = ctrackid
        
    def genNavigation (self,sendto):
        sendto.write (bytes('''<header class="header-1">
        <div class="branding">
      </div><div class="header-nav">''','utf8'))
        sendto.write (bytes(
            "\n".join (['''<a href="{}" class="active nav-link nav-text">{}</a>'''.format (tup[1],tup[0]) for tup in self._bmarks ]),
            "utf8"))
        sendto.write (bytes("</div></header>","utf8"))

        sendto.write (bytes ('''<nav class="subnav">
        <ul class="nav">''',"utf8"))
       
        sendto.write (bytes("\n".join (['''<li class="nav-item">
            <a class="nav-link" href="{}">{}</a></li>'''.format(tup[1],tup[0]) for tup in self._tracks ]),"utf8"))
        
        sendto.write(bytes('''</ul></nav>''',"utf8"))

    def genOverviewTable (self,sendto):
        
        sendto.write (bytes('''<div class="clr-row"><div class="clr-col"><table class="table" id="overview_table" >
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
    <tbody>''',"utf8"))
        sendto.write (bytes('''</tbody></table></div></div>''',"utf8"))
        
        
    def send_content (self,sendto):
        self.genNavigation (sendto)
        sendto.write (bytes('''<h1 clrfocusonviewinit="" style="padding-left:25px">Overview for {} on {}</h1>'''.format (self._ctrack,self._curBenchmark),"utf8"))
        sendto.write (bytes('''<div class="content-container"><div class="content-area">''',"utf8"))
        self.genOverviewTable (sendto)
        
        sendto.write (bytes('''</div></div>''',"utf8"))
        
