output output1 {
  value = local.key1
}

output output2 {
  value = var.test_input1
}


output output_from_dub_module {
  value = module.sub_module.output2
}
