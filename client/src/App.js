import './App.css';
import Home from "./components/Home"
import { Routes, Route, useLocation } from 'react-router-dom';
import UserSignin from './components/account/UserSignin';
import { useState, useEffect } from 'react'

function App() {
  const location = useLocation()
  const [user, setUser] = useState(null)
  const [message, setMessage] = useState(null)

  useEffect(() => {
    fetch("/me")
    .then(resp => {
      if(resp.status === 200){
        resp.json().then(userData => setUser(userData.user))
      } else {
        resp.json().then(messageData => setUser(messageData.message))
      }
    })
  }, [])

  return (
    
    <div className="App">
      <p>{message}</p>

      <Routes>
        <Route exact path="/usersignin" element={ <UserSignin user={ user } setUser={ setUser } setMessage={setMessage}/> }/>
        <Route exact path="/" element={ <Home /> }/>
      </Routes>
    </div>
  );
}

export default App;
