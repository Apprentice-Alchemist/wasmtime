;;! target = "aarch64"
;;! test = "winch"

(module
    (func (result f32)
        (local $foo f32)  
        (local $bar f32)

        (f32.const 1.1)
        (local.set $foo)

        (f32.const 2.2)
        (local.set $bar)

        (local.get $foo)
        (local.get $bar)
        f32.div
    )
)
;; wasm[0]::function[0]:
;;       stp     x29, x30, [sp, #-0x10]!
;;       mov     x29, sp
;;       str     x28, [sp, #-0x10]!
;;       mov     x28, sp
;;       mov     x9, x0
;;       sub     x28, x28, #0x18
;;       mov     sp, x28
;;       stur    x0, [x28, #0x10]
;;       stur    x1, [x28, #8]
;;       mov     x16, #0
;;       stur    x16, [x28]
;;       mov     w16, #0xcccd
;;       movk    w16, #0x3f8c, lsl #16
;;       fmov    s0, w16
;;       stur    s0, [x28, #4]
;;       mov     w16, #0xcccd
;;       movk    w16, #0x400c, lsl #16
;;       fmov    s0, w16
;;       stur    s0, [x28]
;;       ldur    s0, [x28]
;;       ldur    s1, [x28, #4]
;;       fdiv    s1, s1, s0
;;       fmov    s0, s1
;;       add     x28, x28, #0x18
;;       mov     sp, x28
;;       mov     sp, x28
;;       ldr     x28, [sp], #0x10
;;       ldp     x29, x30, [sp], #0x10
;;       ret
