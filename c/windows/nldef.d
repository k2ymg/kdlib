/** nldef.d

Converted from 'nldef.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.nldef;


import c.windows.windef;
import std.string;


// NL_MAX_METRIC_COMPONENT ((((ULONG) 1) << 31) - 1)

enum {
	IpPrefixOriginOther = 0,
	IpPrefixOriginManual,
	IpPrefixOriginWellKnown,
	IpPrefixOriginDhcp,
	IpPrefixOriginRouterAdvertisement,
	IpPrefixOriginUnchanged = 1 << 4
}
alias int NL_PREFIX_ORIGIN;

enum {
	NlpoOther               = IpPrefixOriginOther,
	NlpoManual              = IpPrefixOriginManual,
	NlpoWellKnown           = IpPrefixOriginWellKnown,
	NlpoDhcp                = IpPrefixOriginDhcp,
	NlpoRouterAdvertisement = IpPrefixOriginRouterAdvertisement,
}

enum {
	NlsoOther = 0,
	NlsoManual,
	NlsoWellKnown,
	NlsoDhcp,
	NlsoLinkLayerAddress,
	NlsoRandom,
	IpSuffixOriginOther = 0,
	IpSuffixOriginManual,
	IpSuffixOriginWellKnown,
	IpSuffixOriginDhcp,
	IpSuffixOriginLinkLayerAddress,
	IpSuffixOriginRandom,
	IpSuffixOriginUnchanged = 1 << 4
}
alias int NL_SUFFIX_ORIGIN;

enum {
	NldsInvalid,
	NldsTentative,
	NldsDuplicate,
	NldsDeprecated,
	NldsPreferred,
	IpDadStateInvalid = 0,
	IpDadStateTentative,
	IpDadStateDuplicate,
	IpDadStateDeprecated,
	IpDadStatePreferred,
}
alias int NL_DAD_STATE;

private
template MAKE_ROUTE_PROTOCOL(string suffix, int value)
{
	/*mixin(std.metastrings.Format!("enum MIB_IPPROTO_%s = %s;", suffix , value));
	mixin(std.metastrings.Format!("enum PROTO_IP_%s = %s;", suffix, value));*/
	mixin(std.string.format("enum MIB_IPPROTO_%s = %s;", suffix , value));
	mixin(std.string.format("enum PROTO_IP_%s = %s;", suffix, value));
}

enum {
	RouteProtocolOther   = 1,
	RouteProtocolLocal   = 2,
	RouteProtocolNetMgmt = 3,
	RouteProtocolIcmp    = 4,
	RouteProtocolEgp     = 5,
	RouteProtocolGgp     = 6,
	RouteProtocolHello   = 7,
	RouteProtocolRip     = 8,
	RouteProtocolIsIs    = 9,
	RouteProtocolEsIs    = 10,
	RouteProtocolCisco   = 11,
	RouteProtocolBbn     = 12,
	RouteProtocolOspf    = 13,
	RouteProtocolBgp     = 14,
}

mixin MAKE_ROUTE_PROTOCOL!("OTHER", 1);
mixin MAKE_ROUTE_PROTOCOL!("LOCAL", 2);
mixin MAKE_ROUTE_PROTOCOL!("NETMGMT", 3);
mixin MAKE_ROUTE_PROTOCOL!("ICMP", 4);
mixin MAKE_ROUTE_PROTOCOL!("EGP", 5);
mixin MAKE_ROUTE_PROTOCOL!("GGP", 6);
mixin MAKE_ROUTE_PROTOCOL!("HELLO", 7);
mixin MAKE_ROUTE_PROTOCOL!("RIP", 8);
mixin MAKE_ROUTE_PROTOCOL!("IS_IS", 9);
mixin MAKE_ROUTE_PROTOCOL!("ES_IS", 10);
mixin MAKE_ROUTE_PROTOCOL!("CISCO", 11);
mixin MAKE_ROUTE_PROTOCOL!("BBN", 12);
mixin MAKE_ROUTE_PROTOCOL!("OSPF", 13);
mixin MAKE_ROUTE_PROTOCOL!("BGP", 14);
mixin MAKE_ROUTE_PROTOCOL!("NT_AUTOSTATIC", 10002);
mixin MAKE_ROUTE_PROTOCOL!("NT_STATIC", 10006);
mixin MAKE_ROUTE_PROTOCOL!("NT_STATIC_NON_DOD", 10007);

alias int NL_ROUTE_PROTOCOL;
alias NL_ROUTE_PROTOCOL* PNL_ROUTE_PROTOCOL;

enum {
	NlatUnspecified,
	NlatUnicast,
	NlatAnycast,
	NlatMulticast,
	NlatBroadcast,
	NlatInvalid
}
alias int NL_ADDRESS_TYPE;
alias NL_ADDRESS_TYPE* PNL_ADDRESS_TYPE;

enum {
	NlroManual,
	NlroWellKnown,
	NlroDHCP,
	NlroRouterAdvertisement,
	Nlro6to4,
}
alias int NL_ROUTE_ORIGIN;
alias NL_ROUTE_ORIGIN* PNL_ROUTE_ORIGIN;

enum {
	NlnsUnreachable,
	NlnsIncomplete,
	NlnsProbe,
	NlnsDelay,
	NlnsStale,
	NlnsReachable,
	NlnsPermanent,
	NlnsMaximum,
}
alias int NL_NEIGHBOR_STATE;
alias NL_NEIGHBOR_STATE* PNL_NEIGHBOR_STATE;

enum {
	LinkLocalAlwaysOff = 0,
	LinkLocalDelayed,
	LinkLocalAlwaysOn,
	LinkLocalUnchanged = -1
}
alias int NL_LINK_LOCAL_ADDRESS_BEHAVIOR;

struct NL_INTERFACE_OFFLOAD_ROD {
	BOOLEAN dummy;
	/*bool NlChecksumSupported;
	bool NlOptionsSupported;
	bool TlDatagramChecksumSupported;
	bool TlStreamChecksumSupported;
	bool TlStreamOptionsSupported;
	bool FastPathCompatible;
	bool TlLargeSendOffloadSupported;
	bool TlGiantSendOffloadSupported;*/
}
static assert(NL_INTERFACE_OFFLOAD_ROD.sizeof == 1);
alias NL_INTERFACE_OFFLOAD_ROD* PNL_INTERFACE_OFFLOAD_ROD;

enum {
	RouterDiscoveryDisabled = 0,
	RouterDiscoveryEnabled,
	RouterDiscoveryDhcp,
	RouterDiscoveryUnchanged = -1
}
alias int NL_ROUTER_DISCOVERY_BEHAVIOR;

enum {
	NlbwDisabled = 0,
	NlbwEnabled,
	NlbwUnchanged = -1
}
alias int NL_BANDWIDTH_FLAG;
alias NL_BANDWIDTH_FLAG* PNL_BANDWIDTH_FLAG;

struct NL_PATH_BANDWIDTH_ROD {
	ULONG64 Bandwidth;
	ULONG64 Instability;
	BOOLEAN BandwidthPeaked;
}
alias NL_PATH_BANDWIDTH_ROD* PNL_PATH_BANDWIDTH_ROD;

enum {
	NetworkCategoryPublic,
	NetworkCategoryPrivate,
	NetworkCategoryDomainAuthenticated,
	NetworkCategoryUnchanged = -1,
	NetworkCategoryUnknown = -1
}
alias int NL_NETWORK_CATEGORY;
alias NL_NETWORK_CATEGORY* PNL_NETWORK_CATEGORY;

enum NET_IF_CURRENT_SESSION = cast(ULONG)-1;
