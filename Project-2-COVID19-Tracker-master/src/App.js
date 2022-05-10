import React, { useState, useEffect } from 'react';
import {Card, MenuItem, FormControl, Select, CardContent
} from "@material-ui/core";
import numeral from "numeral";
import InfoBox from './InfoBox';
import Map from "./Map";
import './App.css';
import Table from "./Table";
import { sortData, prettyPrintStats } from "./util";
import LineGraph from "./LineGraph";
import "leaflet/dist/leaflet.css";



function App() {
const [countries, setCountries] = useState([]);
const [country, setCountry] = useState("worldwide");
const [countryInfo, setCountryInfo] = useState({})
const [tableData, setTableData] = useState([])
const [mapCenter, setMapCenter] = useState({lat: 34.80746, lng: -40.4796})
const [mapZoom, setMapZoom] = useState(3);
const [mapCountries, setMapCountries] = useState([]);
const [casesType, setCasesType] = useState("cases");

useEffect(() =>{
  fetch('https://disease.sh/v3/covid-19/all')
  .then(response => response.json())
  .then(data => {
    setCountryInfo(data);
  })
})

  //STATE = How to write a variable in REACT
  // USEEFFECT = Runs a piece of code
  // based on a given condition

  useEffect(() => {
    //The code inside here will run once
    //when the component loads and not again after (run once)
    //async -> send a request, wait for it, do something with info

    const getCountriesData = async () => { 
      await fetch ("https://disease.sh/v3/covid-19/countries")
      .then((response) => response.json())
      .then((data) => {
        //Map is-> [item1, item2, item3] gets item1, does some code, then item2. Its like a loop. Returning an object in a shape
        //loops again to item2, does some code, return object in a shape and then go to item3 and so on) Eventually, it will return an array of objects
        const countries = data.map((country) => ({
            name: country.country, //United States, United Kingdom, France
            value: country.countryInfo.iso2 // UK, USA, FR 
          }));
          const sortedData = sortData(data);
          setTableData(sortedData);
          setMapCountries(data);
          setCountries(countries);
      });
    };

      getCountriesData();
  }, [])

//async is for await
  const onCountryChange = async (event) => {
    const countryCode = event.target.value
    setCountry(countryCode);

    const url = countryCode === 'worldwide' ? 'https://disease.sh/v3/covid-19/all' : 
    `https://disease.sh/v3/covid-19/countries/${countryCode}`
    /** Essentially an if statement: if countryCode === worldwide, then: url = all, else: url=countries/${countryCode} note: `` instead of '' for JavaScript code */

    await fetch(url)
    .then(response => response.json())
    .then(data => {
      setCountry(countryCode);

      // All of the data from the country response
      setCountryInfo(data);
      if(countryCode === 'worldwide'){
        setMapCenter([34.80746, -40.4796])
      } else {
        setMapCenter([data.countryInfo.lat, data.countryInfo.long])
      }
      
      setMapZoom(4);
    })
  };

  const onCasesChange = async (event) => {
    const casesCode = event.target.value
    setCasesType(casesCode);
  }

 //the [] refires the code, i.e. [countries] it also runs when you change countries (aka when variable changes)

  return (
    <div className='app'>
      <div className="app__left">
        <div className="app__header"> 
          <h1 >COVID-19 TRACKER</h1>
          <div className="app__SelectForms">
            <div className="app__caseSelectType">
          <FormControl className="app__downdrop">
            <Select varient="outlined" onChange={onCasesChange} value={casesType}>
              <MenuItem value="cases">Cases</MenuItem>
              <MenuItem value="recovered">Recovered</MenuItem>
              <MenuItem value="deaths">Deaths</MenuItem>
            </Select>
          </FormControl>
          </div>
          <FormControl className="app__dropdown">
            <Select variant="outlined" onChange={onCountryChange} value={country}>
              <MenuItem value="worldwide">Worldwide</MenuItem>
                {/*Loop throygh countries and list a drop down*/}
                {countries.map(country => (
                 <MenuItem value={country.value}>{country.name}</MenuItem>
                ))}
            </Select>
          </FormControl>
          </div>

        </div>

        <div className="app__stats">
        <InfoBox
            title="Coronavirus Cases"
            active={casesType === "cases"}
            cases={prettyPrintStats(countryInfo.todayCases)}
            total={numeral(countryInfo.cases).format("0.0a")}
          />
          <InfoBox
            title="Recovered"
            active={casesType === "recovered"}
            cases={prettyPrintStats(countryInfo.todayRecovered)}
            total={numeral(countryInfo.recovered).format("0.0a")}
          />
          <InfoBox
            title="Deaths"
            active={casesType === "deaths"}
            cases={prettyPrintStats(countryInfo.todayDeaths)}
            total={numeral(countryInfo.deaths).format("0.0a")}
          />
        </div>

        {/* Map */}
        <Map
        casesType ={casesType}
        countries = {mapCountries}
        center = {mapCenter}
        zoom = {mapZoom} />

      </div>
      <Card className="app__right">
        <CardContent>
          <h3>Live Case by Country</h3>
          <Table countries={tableData} />
          <h3>Worldwide new cases</h3>
          <LineGraph casesType="cases"/>
          <h3>Worldwide Daily Deaths</h3>
          <LineGraph casesType="deaths"/>
        </CardContent>
        
      </Card>
    </div>
  );
}

export default App;