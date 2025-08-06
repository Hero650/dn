module Eswar_addr::Eswar_addr {
    use std::signer;
    use std::vector;
    use std::string;

    /// Struct representing a single action log entry
    struct ActionLogEntry has copy, drop, store {
        actor: address,
        action: string::String,
        timestamp: u64,
        details: string::String,
    }

    /// Resource to store all action logs for an account
    struct ActionLogs has key {
        logs: vector<ActionLogEntry>,
    }

    /// Initialize logging for an account (should be called once by the account owner)
    public entry fun init(account: &signer) {
        assert!(!exists<ActionLogs>(signer::address_of(account)), 1);
        move_to(account, ActionLogs {
            logs: vector::empty<ActionLogEntry>(),
        });
    }

    /// Log an action for the sender
    public entry fun log_action(account: &signer, action: string::String, timestamp: u64, details: string::String) acquires ActionLogs {
        let addr = signer::address_of(account);
        let entry = ActionLogEntry {
            actor: addr,
            action,
            timestamp,
            details,
        };
        let logs_ref = borrow_global_mut<ActionLogs>(addr);
        vector::push_back(&mut logs_ref.logs, entry);
    }

    /// Get the number of logs for an account
    public fun get_logs_length(addr: address): u64 acquires ActionLogs {
        let logs_ref = borrow_global<ActionLogs>(addr);
        vector::length(&logs_ref.logs)
    }

    /// Get a log entry by index for an account
    public fun get_log_at(addr: address, idx: u64): ActionLogEntry acquires ActionLogs {
        let logs_ref = borrow_global<ActionLogs>(addr);
        *vector::borrow(&logs_ref.logs, idx)
    }

}
