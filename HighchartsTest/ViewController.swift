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
        title.useHTML = true
        title.text = "<p style='margin: 0px;'> Portfolio Value </p> <p style='margin: 0px;'> $350.10 <p>"
        title.align = "leading"
        title.margin = 10
        title.y = 50
        options.title = title
        
        let subtitle = HISubtitle()
        subtitle.useHTML = true
        subtitle.text = "<p style='color:#34C759; background-color: rgba(52, 199, 89, 0.1); border-radius: 50px; padding: 10px; line-height: 10px;'> ^ $25.10 (6.09%) </p>"
        subtitle.align = "leading"
        options.subtitle = subtitle
        
        
        //MARK: - PlotOptions
        let plotOptions = HIPlotOptions()
        plotOptions.area = HIArea()
        plotOptions.area.lineColor = HIColor(hexValue: "34C759")
        plotOptions.area.fillColor = HIColor(linearGradient: ["x1": 1, "y1": 0, "x2:": 0, "y2": 1],
                                                                          stops: [[0, "rgb(52,199,89, 0.2)"], [1, "rgba(52,199,89, 0)"]])
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

