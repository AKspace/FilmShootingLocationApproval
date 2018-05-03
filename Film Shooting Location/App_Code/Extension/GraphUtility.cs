using System;
using System.Data;
using System.Windows.Forms.DataVisualization.Charting;

/// <summary>
/// Summary description for GraphUtility
/// </summary>
public class GraphUtility
{
    #region Public Function

    /// <summary>
    /// Sets charttype 
    /// </summary>
    public SeriesChartType ChartType { private get; set; }

    /// <summary>
    /// Sets Dataset  
    /// </summary>
    public DataSet DataSet { private get; set; }
 
    /// <summary>
    /// Sets Chart name
    /// </summary>
    public Chart ChartName { private get; set; }
    
    /// <summary>
    /// Sets ChartTitle
    /// </summary>
    public string ChartTitle { private get; set; }
   
    /// <summary>
    /// Sets Value for x Co-ordinate
    /// </summary>
    public string XValue { private get; set; }

    /// <summary>
    /// Sets Value for x Co-ordinate
    /// </summary>
    public string YValue { private get; set; }

    #endregion

    #region Public Functions
    /// <summary>
    /// Fill chart
    /// </summary>
    /// <param name="graphutility"></param>
    public GraphUtility FillChart()
    {
        GraphUtility graphutility = new GraphUtility();
        //Sets DataSource
        graphutility.ChartName.DataSource = graphutility.DataSet;

        //Sets XValue
        graphutility.ChartName.Series["S1"].XValueMember = graphutility.XValue;

        //Sets Yvalue
        graphutility.ChartName.Series["S1"].YValueMembers = graphutility.YValue;

        //Sets Title
        graphutility.ChartName.Titles.Add(graphutility.ChartTitle);
        
        //Set Chart Type
        graphutility.ChartName.Series["S1"].ChartType = graphutility.ChartType;

        //Returns Graph

        return graphutility;
    }
    #endregion
}