# 📝 Action Logging and Tracking Smart Contract

## Project Description
This smart contract provides a robust and efficient way to track and log actions on the Aptos blockchain. It allows accounts to maintain a permanent, immutable record of activities with detailed information including the actor, action type, timestamp, and additional details.

## Project Vision
To create a transparent and reliable action tracking system that can be used across different applications on the Aptos blockchain. This system aims to provide accountability and traceability for various operations, making it easier to audit and verify actions taken by different accounts.

## Key Features
- ✨ **Secure Action Logging**: Record actions with detailed metadata
- 🔐 **Account-Based Storage**: Each account maintains its own log storage
- 📊 **Comprehensive Data Structure**: 
  - Actor address
  - Action description
  - Timestamp
  - Detailed information
- 📖 **Easy Retrieval**: Simple functions to access logs
- 🔍 **Query Capabilities**: 
  - Get total number of logs
  - Retrieve specific log entries by index

## Technical Implementation
```move
public entry fun init(account: &signer)
public entry fun log_action(account: &signer, action: string::String, timestamp: u64, details: string::String)
public fun get_logs_length(addr: address): u64
public fun get_log_at(addr: address, idx: u64): ActionLogEntry
```

## Usage Example
1. Initialize logging for an account:
```bash
aptos move run --function-id "default::Eswar_addr::init"
```

2. Log an action:
```bash
aptos move run --function-id "default::Eswar_addr::log_action" \
--args string:"login" u64:1691337600 string:"User login from IP 192.168.1.1"
```

## Future Scope
1. **Enhanced Querying**
   - Search by action type
   - Time-range based queries
   - Filter by specific criteria

2. **Access Control**
   - Role-based logging permissions
   - Delegated logging capabilities
   - Multi-signature requirements for certain actions

3. **Integration Features**
   - Event emission for off-chain tracking
   - Batch logging capabilities
   - Aggregation and analytics functions

4. **Advanced Features**
   - Log categorization
   - Priority levels for actions
   - Automated cleanup policies

## Contract Address
- Devnet: `0xb45e2d57946bf7999eda3d1e4cb49a264e3484344bb8b304162475ce02f07a90`

## 🔧 Development and Testing
1. Clone the repository
2. Update the `Move.toml` with your account address
3. Compile: `aptos move compile`
4. Test: `aptos move test`
5. Deploy: `aptos move publish`

## Security Considerations
- Only account owners can initialize their logging storage
- Logs are immutable once written
- Each account's logs are isolated from others

## License
MIT License

#transaction address
0x9afec44a504d30aa733af31eeb117f308cbc14267076a9cd887b1d2ff6d41abf
#transaction image 
![alt text](<Screenshot 2025-08-06 125431.png>)