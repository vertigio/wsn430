/*
 * Copyright (c) 2005-2006 Arch Rock Corporation
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * - Redistributions of source code must retain the above copyright
 *   notice, this list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright
 *   notice, this list of conditions and the following disclaimer in the
 *   documentation and/or other materials provided with the
 *   distribution.
 * - Neither the name of the Arch Rock Corporation nor the names of
 *   its contributors may be used to endorse or promote products derived
 *   from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE
 * ARCHED ROCK OR ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE
 */

/**
 * @author Jonathan Hui <jhui@archrock.com>
 * @version $Revision: 1.1 $ $Date: 2007/07/04 00:37:16 $
 */

configuration CC1101SpiWireC {

  provides interface Resource[ uint8_t id ];
  provides interface ChipSpiResource;
  provides interface CC1101Fifo as Fifo[ uint8_t id ];
  provides interface CC1101Status as Status[ uint8_t id ];
  provides interface CC1101Register as Reg[ uint8_t id ];
  provides interface CC1101Strobe as Strobe[ uint8_t id ];

}

implementation {

  components CC1101SpiP as SpiP;
  Resource = SpiP;
  Fifo = SpiP;
  Status = SpiP;
  Reg = SpiP;
  Strobe = SpiP;
  ChipSpiResource = SpiP;

  components new StateC() as WorkingStateC;
  SpiP.WorkingState -> WorkingStateC;

  components new HplCC1101SpiC();
  SpiP.SpiResource -> HplCC1101SpiC;
  SpiP.SpiByte -> HplCC1101SpiC;
  SpiP.SpiPacket -> HplCC1101SpiC;

  components LedsC;
  SpiP.Leds -> LedsC;

}
