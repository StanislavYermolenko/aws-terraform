# --- networking/output.tf ---

output "vps_id" {
    value = aws_vpc.mtc_vps.id
}