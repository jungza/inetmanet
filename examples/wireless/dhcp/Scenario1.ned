//
// Copyright (C) 2010 Juan-Carlos Maureira
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

package inet.examples.wireless.dhcp;
import inet.world.ChannelControlExtended;
import inet.nodes.inet.Router;
import inet.nodes.inet.StandardHost;
import inet.nodes.wireless.WirelessAPWithEth;
import inet.nodes.wireless.WirelessHost;

import inet.applications.dhcp.DHCPClient;
import inet.nodes.wireless.WirelessRouter;
//
// TODO auto-generated module
//
network DHCP_Scenario_1
{
    @display("bgb=590,407;bgl=2");
    int numWirelessHosts;
    submodules:
        channelControl: ChannelControlExtended{
            @display("p=64,34");
            pMax = 100mW;
            numChannels = 5;
        }
        router: Router {
            @display("p=241,136");
            routingFile = "router.rt";
        }
        standardHost: StandardHost {
            @display("p=418,134");
            routingFile = "host.rt";
        }
        wirelessHost[numWirelessHosts]: WirelessHost {
            //@display("p=135,333");
            numUdpApps = 1;
            udpAppType = "DHCPClient";
        }

        wirelessRouter: WirelessRouter {
            @display("p=154,207");
            routingFile = "wirelessRouter.rt";
            numUdpApps = 1;
            udpAppType = "DHCPServer";
            mgmtType = default("Ieee80211MgmtAP");
        }
    connections:
        standardHost.ethg++ <--> router.ethg++;
        wirelessRouter.ethg++ <--> router.ethg++;
}
