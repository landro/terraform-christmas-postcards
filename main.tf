resource "local_file" "christmascard" {
  for_each = { for address in csvdecode(file("${path.module}/addresses.csv")) : address.country => address }
  content  = templatefile("${path.module}/card.tmpl", each.value)
  filename = "${path.module}/cards/${each.key}.txt"
}