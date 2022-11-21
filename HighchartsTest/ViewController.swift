//
//  ViewController.swift
//  HighchartsTest
//
//  Created by Henrique Legnaro on 11/11/22.
//

import UIKit
import Highcharts

//FROM: https://www.highcharts.com/demo/ios/line-time-series/brand-light

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let chartView = HIChartView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 400))
        chartView.theme = "brand-light"
        
        let options = HIOptions()
        
        let chart = HIChart()
        chart.type = "area"
        options.chart = chart
        
        let title = HITitle()
        title.text = "Companies Chart"
        title.verticalAlign = "top"
        options.title = title
        
        let subtitle = HISubtitle()
        subtitle.text = "Area Chart"
        options.subtitle = subtitle
        
        
        //MARK: - PlotOptions
        let plotOptions = HIPlotOptions()
        plotOptions.area = HIArea()
        plotOptions.area.fillColor = HIColor(linearGradient: ["x1": 1, "y1": 0, "x2:": 0, "y2": 1],
                                                                          stops: [[0, "rgb(47,126,216)"], [1, "rgba(47,126,216,0)"]])
        options.plotOptions = plotOptions
        
        //MARK: - Label Prefix
        let Companies = HIArea()
        Companies.name = "$"
        
        //MARK: - Click Event Callback
        Companies.point = HIPoint()
        Companies.point.events = HIEvents()
        
        Companies.point.events.click = HIFunction(closure: { (context) in
            print(context?.getProperty("this.name") ?? "")
            print(context?.getProperty("this.y") ?? "")
        }, properties: ["this.name", "this.y"])
    

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
        
        options.series = [Companies]
        chartView.options = options
        
        self.view.addSubview(chartView)
    }
    
}

