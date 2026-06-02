# Address entry dictionary exercise:

contact_info = {
    "name": "John Doe",
    "address": "123 Main Street",
    "city": "West Chicago",
    "state": "Illinois",
    "zip": "60185"
}

# Print formatted address

print("Formatted address:")
address_output = f"""John Doe 
123 Main Street, 
West Chicago, Illinois 60185"""
print(address_output)

# Remove name key and add full_name dictionary

del contact_info["name"]
full_name = {
    "first name": "John",
    "last name": "Doe"
}

# Update full_name with honorific

full_name.update({"honorific": "Mr."})

# Update contact_info with full_name

contact_info.update({"full_name": full_name})

# Print updated formatted address
print("\nUpdated address with full name:")
updated_address = f"""{contact_info['full_name']['honorific']} {contact_info['full_name']['first name']} {contact_info['full_name']['last name']}
{contact_info['address']}
{contact_info['city']}, {contact_info['state']} {contact_info['zip']}"""
print(updated_address)

# Commit point: Address exercise complete