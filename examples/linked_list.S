# Linked List (linked_list.S)
.section .text
.global main

# struct list { int data; struct list *next; }
# struct list: [ data: 4 bytes ][ list *next: 4 bytes ]

# list *list_alloc(int data);
list_alloc:
  pushl $8            # %eax = malloc(8);
  call malloc
  addl $4, %esp

  testl %eax, %eax    # if (%eax == NULL)
  jz fatal            #   goto fatal;

  movl 4(%esp), %ecx
  movl %ecx, (%eax)   # %eax->data = data
  movl $0, 4(%eax)    # %eax->next = 0
  ret

  # Dirty error handling
  fatal:
      jmp fatal

# void list_add(list *head, int data);
list_add:
  push %ebp
  mov %esp, %ebp
  subl $4, %esp           # list *n;

  pushl 12(%ebp)          # %eax = list_alloc(data);
  call list_alloc
  addl $4, %esp

  mov %eax, -4(%ebp)      # n = %eax;

  mov 8(%ebp), %eax       # %eax = head

  traverse_add:
    cmpl $0, 4(%eax)      # if (%eax->next == NULL)
    jz at_end_add         #  goto at_end_add;
    movl 4(%eax), %eax    # %eax = %eax->next
    jmp traverse_add      # Loop

  at_end_add:
  movl -4(%ebp), %ecx     # %ecx = n
  movl %ecx, 4(%eax)      # %eax->next = %ecx

  mov %ebp, %esp
  pop %ebp
  ret

# void list_dump(list *head);
list_dump:
    push %ebp
    mov %esp, %ebp

    pushl %ebx              # Save %ebx
    movl 8(%ebp), %ebx      # %ebx = head

    traverse_dump:
        testl %ebx, %ebx    # if (%ebx == NULL)
        jz at_end_dump      #  goto at_end_dump;

        movl (%ebx), %ecx   # %ecx = %ebx->data
        pushl %ecx          # printf("%d\n", %ecx)
        pushl $fmtStr
        call printf
        addl $8, %esp

        movl 4(%ebx), %ebx  # %ebx = %ebx->next
        jmp traverse_dump   # Loop

    at_end_dump:
    pop %ebx                # Restore %ebx
    mov %ebp, %esp
    pop %ebp
    ret



main:
    pushl $86           # %eax = list_alloc(86);
    call list_alloc
    addl $4, %esp
    movl %eax, head     # head = %eax

    pushl $75           # list_add(head, 75);
    pushl head
    call list_add
    addl $8, %esp

    pushl $309          # list_add(head, 309);
    pushl head
    call list_add
    addl $8, %esp

    pushl head          # list_dump(head);
    call list_dump
    addl $4, %esp

    movl $0, %eax       # Return 0
    ret

.section .data
  head:     .long 0
  fmtStr:   .ascii "%d\n\0"
