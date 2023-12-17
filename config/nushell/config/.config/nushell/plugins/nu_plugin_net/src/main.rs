extern crate pnet;
use nu_plugin::{self, EvaluatedCall, LabeledError};
use nu_protocol::{record, Category, PluginSignature, Span, Value};
use pnet::datalink::{self, MacAddr, NetworkInterface};
use pnet::ipnetwork::IpNetwork;

pub struct Plugin;

fn flags_to_nu(span: Span, interface: &NetworkInterface) -> Value {
    Value::record(
        record! {
            "is_up"=> Value::bool(interface.is_up(),span),
            "is_broadcast"=> Value::bool(interface.is_broadcast(),span),
            "is_loopback"=> Value::bool(interface.is_loopback(),span),
            "is_point_to_point"=> Value::bool(interface.is_point_to_point(),span),
            "is_multicast"=> Value::bool(interface.is_multicast(),span)
        },
        span,
    )
}

fn mac_to_nu(span: Span, mac: Option<MacAddr>) -> Value {
    if let Some(mac) = mac {
        Value::string(mac.to_string(), span)
    } else {
        Value::nothing(span)
    }
}

fn ip_to_nu(span: Span, ip: &IpNetwork) -> Value {
    let type_name = match ip {
        IpNetwork::V4(..) => "v4",
        IpNetwork::V6(..) => "v6",
    };
    Value::record(
        record! {
            "type" => Value::string(type_name, span),
            "addr" => Value::string(ip.to_string(), span),
            "prefix" => Value::int(ip.prefix().into(), span)
        },
        span,
    )
}

/// Convert a slice of ipnetworks to nushell values
fn ips_to_nu(span: Span, ips: &[IpNetwork]) -> Value {
    Value::list(ips.iter().map(|ip| ip_to_nu(span, ip)).collect(), span)
}

impl nu_plugin::Plugin for Plugin {
    fn signature(&self) -> Vec<PluginSignature> {
        vec![PluginSignature::build("net")
            .usage("List network interfaces")
            .category(Category::Experimental)]
    }

    fn run(
        &mut self,
        _name: &str,
        call: &EvaluatedCall,
        _input: &Value,
    ) -> Result<Value, LabeledError> {
        Ok(Value::list(
            datalink::interfaces()
                .iter_mut()
                .map(|interface| {
                    Value::record(
                        record!{
                            "name"=>   Value::string(interface.name.clone(), call.head),
                            "description"=>   Value::string(interface.description.clone(), call.head),
                            "if_index"=>   Value::int(interface.index.into(), call.head),
                            "mac"=>  mac_to_nu(call.head, interface.mac),
                            "ips"=> ips_to_nu(call.head, &interface.ips),
                            "flags"=>  flags_to_nu(call.head, interface),
                        },
                        call.head,
                    )
                })
                .collect(),
            call.head,
        ))
    }
}

fn main() {
    nu_plugin::serve_plugin(&mut Plugin {}, nu_plugin::JsonSerializer {})
}
