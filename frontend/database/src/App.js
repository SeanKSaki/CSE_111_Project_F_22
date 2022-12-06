import './App.css';
import {AgGridReact} from 'ag-grid-react';

import {useState, useEffect, useMemo, useCallback, useRef} from 'react';

import 'ag-grid-community/dist/styles/ag-theme-alpine-dark.css';
import 'ag-grid-community/dist/styles/ag-grid.css'


function App() {
  const gridRef = useRef();
  const [rowData, setRowData] = useState([
    {make: 'Ford', model: 'Focus', price: 40000},
    {make: 'Toyota', model: 'Celica', price: 40000},
    {make: 'BMW', model: '4 Series', price: 40000}
  ]);

  const columnDefs =[
    {field: 'id'},
    {field: 'brand'},
    {field: 'threads'},
    {field: 'cpu_name'},
    {field: 'launch_date'},
    {field: 'lithography'},
    {field: 'base_frequency'},
    {field: 'turbo_frequency'},
    {field: 'cache_size'},
    {field: 'cache_l1'},
    {field: 'cache_l2'},
    {field: 'cache_l3'},
    {field: 'tdp'},
    {field: 'product_line'},
    {field: 'socket'},
    {field: 'memory_type'},
    {field: 'cpu_url'},
    {field: 'vertical_segment'},
    {field: 'max_temp'},
    {field: 'sku'}
  ];

  const defaultColDef = useMemo( ()=> ({
    sortable: true,
    filter: true
  }))

  const onSelectionChanged = useCallback(() => {
    const selectedRows = gridRef.current.api.getSelectedRows();
    document.querySelector('#selectedRows').innerHTML =
      selectedRows.length === 1 ? selectedRows[0].cpu_url : '';
      window.open(selectedRows[0].cpu_url);
  }, []);



  useEffect(() => {
    fetch('http://localhost:8080/database/getDisplay')
    .then(result => result.json())
    .then(rowData => setRowData(rowData))
  }, []);

  return (

    <div>
      <div className="ag-theme-alpine-dark" style ={{height: 900}} >
        <AgGridReact
        ref = {gridRef}
        rowData = {rowData}
        columnDefs = {columnDefs}
        defaultColDef = {defaultColDef}
        animateRows = {true}
        onSelectionChanged = {onSelectionChanged}
        rowSelection={'single'}/>
      </div>
      <div className="example-header">
          Selection:
          <span id="selectedRows"></span>
      </div>
    </div>
  );
}

export default App;
