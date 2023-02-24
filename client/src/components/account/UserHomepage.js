import Link from '@mui/joy/Link';
import { useState } from "react"

const UserHomepage = ({user, setUser}) => {
    console.log(user.email)
    console.log ("this is setUser in userhomepage" + setUser)

    const [updatedUser, setUpdatedUser] = useState(user)
    console.log(user)
    
    
    const handleChange = (e) => {
        const {name, value} = e.target
        setUpdatedUser({...updatedUser, [name]: value})
        console.log(e)

    }

    const handleSubmit = (e) => {
        e.preventDefault()
        fetch(`/users/${user.id}`, {
            method: "PATCH",
            headers: {
              "Content-Type": "application/json"
            },
            body: JSON.stringify(updatedUser)
          })
          .then((response) => {
            if (response.status === 200) {
                
                response.json()
                .then((updatedUserObj) => {
                    setUser(updatedUserObj.user)
            })
        } else {
            response.json()
                .then((messageObj) => {
                    alert(messageObj.message)
            })
        }
    
    })
}

const handleDelete = (e) => {
    e.preventDefault()
    fetch(`/users/${user.id}`, {method: "DELETE"})
    .then(() => setUser(null))
    
    
  }

  const handleLogout = (e) => {
    fetch(`/logout`, {method: "DELETE"})
    .then(() => setUser(null))
  }
  

    return (
    <>
        <h1>SMPools</h1>
        <div>
           
            <h2> My Account </h2>
            <h3>
            {user.email}
            <br/>
            {user.first_name} 
            </h3>
            <br/>
            
            <Link>Manage Account</Link> <br/>
            
            <form onSubmit={handleSubmit}>
            <input className="user-input" onChange= {handleChange} value= {updatedUser.name} type="text" placeholder="Name" name="name"  required /> <br />
            <input className="user-input" onChange= {handleChange} value= {updatedUser.email} type="text" placeholder="E-Mail" name="email"  required /> <br />
            <button type="submit" >Update</button> <br/>
            <button onClick={handleDelete}>Remove Account</button>
            <br/>
            <button onClick={handleLogout}>Logout</button>
            </form>
        </div>

    </>
    )
}

export default UserHomepage