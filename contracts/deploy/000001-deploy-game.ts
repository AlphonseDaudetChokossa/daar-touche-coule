import 'dotenv/config'
import { DeployFunction } from 'hardhat-deploy/types'

const deployer: DeployFunction = async hre => {
  if (hre.network.config.chainId !== 31337) return
  const { deployer } = await hre.getNamedAccounts()

  const mainadr = await hre.deployments.deploy('Main', { from: deployer, log: true })
  const basicShipAdrr = await hre.deployments.deploy('SimpleShip', { from: deployer, log: true })
  const smartShipAdrr = await hre.deployments.deploy('SmartShip', { from: deployer, log: true })

  console.log(`Main is deployed at adress : ${mainadr.address}`)
  console.log(`SimpleShip is deployed at adress : ${basicShipAdrr.address}`)
  console.log(`SmartShip is deployed at adress : ${smartShipAdrr.address}`)
 
}

export default deployer
