mod black76;

use black76::{CallPut, Black76};
use rustler::NifResult;

#[rustler::nif]
fn price(cp: &str, s: f64, k: f64, t: f64, vol: f64, r: f64) -> NifResult<f64> {
    let callput = match cp {
        "Call" => CallPut::Call,
        "Put" => CallPut::Put,
        _ => panic!("Callput not recognised")
    };

    Ok( Black76::new(callput, s, k, t, vol, r).price() )
}

#[rustler::nif]
fn delta(cp: &str, s: f64, k: f64, t: f64, vol: f64, r: f64) -> NifResult<f64> {
    let callput = match cp {
        "Call" => CallPut::Call,
        "Put" => CallPut::Put,
        _ => panic!("Callput not recognised")
    };

    Ok( Black76::new(callput, s, k, t, vol, r).delta() )
}

rustler::init!("Elixir.NIF", [
    price,
    delta
]);