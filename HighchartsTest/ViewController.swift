//
//  ViewController.swift
//  HighchartsTest
//
//  Created by Henrique Legnaro on 11/11/22.
//

import UIKit
import Highcharts

//FROM: https://www.highcharts.com/demo/ios/pie-donut

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let chartView = HIChartView(frame: view.bounds)
        
        let options = HIOptions()
        
        let chart = HIChart()
        chart.type = "pie"
        options.chart = chart
        
        let title = HITitle()
        title.text = "Amazon:<br> 919.02"
        title.verticalAlign = "middle"
        options.title = title
        
        let subtitle = HISubtitle()
        subtitle.text = "Donut Chart"
        options.subtitle = subtitle
        
        
        //MARK: - Legend
        let plotOptions = HIPlotOptions()
        plotOptions.pie = HIPie()
        plotOptions.pie.showInLegend = true
        options.plotOptions = plotOptions
        
        let legend = HILegend()
        legend.verticalAlign = "middle"
        legend.y = 200
        legend.width = 120
        options.legend = legend
        
        let Companies = HIPie()
        Companies.name = "$"
        Companies.size = "60%"
        
        //MARK: - Click Event Callback
        Companies.point = HIPoint()
        Companies.point.events = HIEvents()
        
        Companies.point.events.click = HIFunction(closure: { (context) in
            print(context?.getProperty("this.name") ?? "")
            print(context?.getProperty("this.y") ?? "")
        }, properties: ["this.name", "this.y"])
        
        //MARK: - Data Labels
        let dataLabelsBrowsers = HIDataLabels()
        dataLabelsBrowsers.formatter = HIFunction(jsFunction: "function () { return this.y > 5 ? this.point.name : null; }")
        dataLabelsBrowsers.color = HIColor(hexValue: "ffffff")
        dataLabelsBrowsers.distance = -30
        Companies.dataLabels = [dataLabelsBrowsers]
    

        //MARK: - Mockup Data
        Companies.data = [[
            "name": "Amazon",
            "y": 919.02,
            "color": "#7cb5ec"
        ], [
            "name": "Disney",
            "y": 583.62,
            "color": "#434348"
        ], [
            "name": "Apple",
            "y": 334.20,
            "color": "#90ed7d"
        ], [
            "name": "Etsy",
            "y": 328.34,
            "color": "#f7a35c"
        ], [
            "name": "Starbucks",
            "y": 87.17,
            "color": "#8085e9"
        ], [
            "name": "Microsoft",
            "y": 72.38,
            "color": "#f15c80"
        ]]
        
        //MARK: - Turns Pie into Donut
        Companies.innerSize = 170
        
        options.series = [Companies]
        chartView.options = options
        
        self.view.addSubview(chartView)
    }
    
}

