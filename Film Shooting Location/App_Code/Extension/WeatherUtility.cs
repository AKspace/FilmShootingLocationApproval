using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Net;
using System.Web.Script.Serialization;

/// <summary>
/// Summary description for WeatherUtility
/// </summary>
public class WeatherUtility
{
    public WeatherUtility()
    {
        
    }

    public void GetWeatherInfo()
    {
        string appId = "06a28f5811a329ffb49428d16e601bcb";
        string url = "http://api.openweathermap.org/data/2.5/weather?q=Delhi&units=metric&APPID=25b42f0574c57c619e027b235aec4996";
        // string url = "http://api.openweathermap.org/data/2.5/weather?q=Berlin&APPID=25b42f0574c57c619e027b235aec4996";
        using (WebClient client = new WebClient())
        {
            string json = client.DownloadString(url);
            var s = new JavaScriptSerializer();
            dynamic result = s.DeserializeObject(json);

            //WeatherInfo weatherInfo = (new JavaScriptSerializer()).Deserialize<WeatherInfo>(json);
            //lblCity_Country.Text = Convert.ToString(result["name"]) + "," + Convert.ToString(result["sys"]["country"]);
            string countrypic = Convert.ToString(result["sys"]["country"]);
            //imgCountryFlag.ImageUrl = "http://openweathermap.org/images/flags/" + countrypic.ToLower() + ".png";



            Dictionary<string, object> desc = result["weather"][0];
            //lblDescription.Text = desc["description"].ToString();
            //imgWeatherIcon.ImageUrl = "http://openweathermap.org/img/w/" + Convert.ToString(desc["icon"]) + ".png";


            //lblTempMin.Text = {0}+"°С", Math.Round(weatherInfo.list[0].temp.min, 1));
            //lblTempMin.Text = result["main"]["temp_min"] + "°С";

            //lblTempMax.Text = string.Format("{0}°С", Math.Round(weatherInfo.list[0].temp.max, 1));
            // lblTempMax.Text = Convert.ToString(Math.Round(FtoC(Convert.ToDouble(result["main"]["temp_max"])), 1)) + "°С";

            //lblTempDay.Text = string.Format("{0}°С", Math.Round(weatherInfo.list[0].temp.day, 1));

            //lblTempDay.Text = Convert.ToString(Math.Round(FtoC(Convert.ToDouble(result["main"]["temp"])), 1)) + "°С";

            //lblTempNight.Text = string.Format("{0}°С", Math.Round(weatherInfo.list[0].temp.night, 1));

            //lblTempNight.Text = Convert.ToString(Math.Round(FtoC(Convert.ToDouble(result["main"]["temp"])), 1)) + "°С";

            //lblHumidity.Text = weatherInfo.list[0].humidity.ToString();
            //lblHumidity.Text = Convert.ToString(result["main"]["humidity"]);

            //tblWeather.Visible = true;

        }


    }

    public double FtoC(double F)
    {
        return F;
        //return (F - 273);
    }



public class WeatherInfo
{
    public City city { get; set; }
    public List<List> list { get; set; }
}

public class City
{
    public string name { get; set; }
    public string country { get; set; }
}

public class Temp
{
    public double day { get; set; }
    public double min { get; set; }
    public double max { get; set; }
    public double night { get; set; }
}

public class Weather
{
    public string description { get; set; }
    public string icon { get; set; }
}

public class List
{
    public Temp temp { get; set; }
    public int humidity { get; set; }
    public List<Weather> weather { get; set; }
}

}