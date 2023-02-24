import { useState, useEffect } from "react"

const UserHomepage = ({user, setUser}) => {
    console.log(user.email)

    const [updatedUser, setUpdatedUser] = useState(user)
    console.log(updatedUser)
    const [userPools, setUserPools] = useState([])
    console.log(userPools)
    const [newPool, setNewPool] = useState([])
    console.log(newPool)    
    
    const handleUserChange = (e) => {
        console.log(e)
        const {name, value} = e.target
        setUpdatedUser({...updatedUser, [name]: value})
    }

    const handleUserSubmit = (e) => {
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

const handleUserDelete = (e) => {
    e.preventDefault()
    fetch(`/users/${user.id}`, {method: "DELETE"})
    .then(() => setUser(null))
    
    
  }

  const handleUserLogout = (e) => {
    fetch(`/logout`, {method: "DELETE"})
    .then(() => setUser(null))
  }

    const handlePoolSubmit = (e) => {
        e.preventDefault()
        fetch(`/pools`, {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({ 
            address: newPool.address,
            size: newPool.size,
            user_id: user.id 
        }),
        })
        .then((response) => {
            if (response.status === 200) {
            response.json().then((data) => {
                setNewPool([...userPools, data.pool])
            })
            } else {
            response.json().then((messageObj) => {
                alert(messageObj.message)
            })
            }
        })
    }

    const handlePoolChange = (e) => {
        console.log(e.target.value)
    }

  useEffect(() => {
    if (user) {
      fetch(`/users/${user.id}/pools`)
        .then((response) => response.json())
        .then((data) => {
          setUserPools(data);
        });
    }
  }, [user]);

    return (
    <>
        <h1>SMPools</h1>
        <div>
           
            <h2> My Account </h2>
            <h3>
            {user.email}
            <br/>
            {user.name} 
            </h3>
            <br/>
            <h2> My Pools </h2>
            <ul>
                {
                Object.values(userPools).map(pool => (
                <li key={pool.id}>{pool.address}</li>
                ))}
            </ul>
            
            <form onSubmit={handleUserSubmit}>
            <input className="user-input" onChange={handleUserChange} value= {updatedUser.name} type="text" placeholder="Name" name="name"  required /> <br />
            <input className="user-input" onChange={handleUserChange} value= {updatedUser.email} type="text" placeholder="E-Mail" name="email"  required /> <br />
            <button type="submit">Update</button> <br/>
            <button onClick={handleUserDelete}>Remove Account</button>
            <br/>
            <button onClick={handleUserLogout}>Logout</button>
            </form>

            <form onSubmit={handlePoolSubmit}>
            <input type="text" value={newPool.address} onChange={handlePoolChange} />
            <button type="submit">Add Pool</button>
            </form>
        </div>

    </>
    )
}

export default UserHomepage