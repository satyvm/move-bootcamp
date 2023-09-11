
module 0x0::BasicNFT {
    use sui::transfer::{Self};
    use sui::object::{Self, UID};
    use sui::tx_context::{Self,TxContext};

    // add a capability for the admin role

    struct NFT has key {
    // add the NFT fields
        id: UID,
        value: u64
    }

    struct AdminCap has key {
        id : UID
    }

    // add a funtion to initialise the program 
    fun init (ctx : &mut TxContext){
        let adminCap = AdminCap{ id: object::new(ctx)};
        transfer::transfer(adminCap, tx_context::sender(ctx));
    }

    // add a function to create additional admin addresses
    public entry fun create_admincap(
        _ : &AdminCap,
        new_add: address,
        ctx : &mut TxContext
    ){
        let adminCap = AdminCap{ id: object::new(ctx)};
        transfer::transfer(adminCap, new_add);
    }



    // add a function to mint an NFT and transfer it to an address
    public entry fun mint(
        _ : &AdminCap,
        value: u64,
        ctx : &mut TxContext
    ){
        let nft = NFT{
            id: object::new(ctx),
            value: value
        };
        transfer::transfer(nft, tx_context::sender(ctx));
    }

    // add getter functions for the NFT fields
    public fun value(nft: &NFT): &u64{
        &nft.value
    }
    
}