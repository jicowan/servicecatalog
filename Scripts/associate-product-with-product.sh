#!/usr/bin/env bash

PortfolioId="port-gwusoxsdtowti"
ProductId="prod-dugxr6uwm7fhw"

aws servicecatalog associate-product-with-portfolio --product-id $ProductId --portfolio-id $PortfolioId
