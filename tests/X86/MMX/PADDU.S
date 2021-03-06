/*
 * Copyright (c) 2018 Trail of Bits, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define PADDU_INPUTS_64 \
    0x1, 0x0, \
    0x0, 0x1, \
    0x0, 0x0, \
    0xFFFF, 0xFFFF, \
    0xFFFFFFFF, 0xFFFFFFF, \
    0x0, 0xFFFFFFFF, \
    0xAAAABBBB, 0xCCCCEEEE, \
    0xF82DAC26, 0x091D41A7, \
    0x5FD4D3D9, 0x39A5f1D8, \
    0x063F0DDF, 0xAA9352B2, \
    0xD4A19DBB, 0x2D81A606, \
    0xBD2A7045, 0x8FC05637, \
    0x75D9B52A, 0x0AA1300B, \
    0x55535FB8, 0x4952FFC7, \
    0x06EA7DD6, 0x2D6EDF79, \
    0x49974EBE, 0xD64D34E8, \
    0x21E9840E, 0x6B56224B, \
    0x5B3631FD, 0xA03337FF, \
    0xEE92c9F3, 0x3B786526

TEST_BEGIN_64(PADDUv128v128_0, 2)
TEST_INPUTS(PADDU_INPUTS_64)
    movq xmm0, ARG1_64
    movq xmm1, ARG2_64
    paddusb xmm0, xmm1
TEST_END_64

TEST_BEGIN_64(PADDUv128v128_1, 2)
TEST_INPUTS(PADDU_INPUTS_64)
    push ARG2_64
    push ARG1_64
    movq xmm0, [rsp]
    push ARG1_64
    push ARG2_64
    movq xmm1, [rsp]
    paddusb xmm0, xmm1
TEST_END_64

TEST_BEGIN_64(PADDUv128v128_2, 2)
TEST_INPUTS(PADDU_INPUTS_64)
    movq xmm1, ARG1_64
    movq xmm2, ARG2_64
    paddusb xmm1, xmm2
    paddusb xmm1, xmm1
TEST_END_64

TEST_BEGIN_64(PADDUv128v128_3, 2)
TEST_INPUTS(PADDU_INPUTS_64)
    movq xmm4, ARG1_64
    movq xmm3, ARG2_64
    push ARG2_64
    push ARG1_64
    movq xmm1, [rsp]
    paddusb xmm1, xmm4
    paddusb xmm3, xmm4
    paddusb xmm1, xmm3
TEST_END_64

TEST_BEGIN_64(PADDUv128v128_4, 2)
TEST_INPUTS(PADDU_INPUTS_64)
    movq xmm7, ARG1_64
    movq xmm1, ARG2_64
    movq xmm5, ARG1_64
    paddusb xmm1, xmm7
    paddusb xmm7, xmm1
    paddusb xmm7, xmm7
    paddusb xmm5, xmm7
    paddusb xmm1, xmm5
TEST_END_64

TEST_BEGIN_64(PADDUv128v128_8, 1)
TEST_INPUTS(0)
    paddusb xmm0, xmm1
    paddusb xmm1, xmm2
    paddusb xmm2, xmm3
    paddusb xmm3, xmm4
    paddusb xmm4, xmm5
    paddusb xmm5, xmm6
    paddusb xmm6, xmm7
    paddusb xmm7, xmm0
TEST_END_64
