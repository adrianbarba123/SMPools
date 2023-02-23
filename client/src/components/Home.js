// import PoolsContainer from "./PoolsContainer";
import PoolForm from "./PoolForm";
import { useState, useEffect } from "react";


const Home = () => {

    const [pools, setPools] = useState([])

    useEffect(() => {
    const fetchData = async () => {
        try {
        const r = await fetch("/pools")
        const data = await r.json()
        setPools(data)
        } catch (e) {
        alert(e)
        }
    }
    fetchData()
    }, [])

    return(
        <div>
            <PoolForm pools={pools} setPools={setPools} />
        </div>
    )
}

export default Home