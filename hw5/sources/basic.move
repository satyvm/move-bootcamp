module basic_address::homework5 {

 struct Asset has drop {
  // add code here
  value: u64,
  flag: u8,
 }

 //add build_asset function
 public entry fun build_asset(value: u64, flag: u8){
    assert!(value>100, 17)
    assert!(flag == 0, 17)
    assert!(flag == 1, 17)
    let a = create(value,flag)
 }


 fun create(value : u64, flag : u8) : Asset {
    Asset {
        flag,
        value
    }
 }
}