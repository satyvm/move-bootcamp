module  basic_address::hw6 {


struct TokenAsset has key{
// add the key ability
   //add value field
   value: u64
}

  


public entry fun create_Asset(account : &signer) {
// create a TokenAsset 
// move the TokenAsset to the account address 
    let a = create();
    move_to<TokenAsset>(account,a)

}


fun create() : TokenAsset {
// return a Token Asset with 0 value
    TokenAsset {
        value: 0
    }
}

}