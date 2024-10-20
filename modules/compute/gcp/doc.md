## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_instance.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [google_compute_image.my_image](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_image) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_image_family"></a> [image\_family](#input\_image\_family) | The image family to use for the instance. | `string` | `"debian-10"` | no |
| <a name="input_image_project"></a> [image\_project](#input\_image\_project) | The project where the image is hosted. | `string` | `"debian-cloud"` | no |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | The type of machine to create. | `string` | `"f1-micro"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the GCP instance. | `string` | n/a | yes |
| <a name="input_network"></a> [network](#input\_network) | The network to attach the instance to. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The GCP project ID. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The GCP region to deploy resources. | `string` | n/a | yes |
| <a name="input_subnetwork"></a> [subnetwork](#input\_subnetwork) | The subnetwork to attach the instance to. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resource. | `map(string)` | `{}` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | The GCP zone to deploy the instance. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | The ID of the GCP instance. |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | The public IP address of the GCP instance. |
