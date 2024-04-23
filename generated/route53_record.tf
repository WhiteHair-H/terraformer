resource "aws_route53_record" "tfer--Z071299925RUGS0OOY5Y9__2cf7618835deda7cbcd3a3c407d95c30-002E-hyobeom-002E-shop-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "_2cf7618835deda7cbcd3a3c407d95c30.hyobeom.shop"
  records                          = ["_6350411fb836279dcbe5e522faa3e3e2.mhbtsbpdnt.acm-validations.aws."]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--Z071299925RUGS0OOY5Y9_hyobeom-002E-shop.zone_id}"
}

resource "aws_route53_record" "tfer--Z071299925RUGS0OOY5Y9_applicant-002E-hyobeom-002E-shop-002E-_A_" {
  alias {
    evaluate_target_health = "true"
    name                   = "dualstack.weplat-ap2-was-alb-1562968229.ap-northeast-2.elb.amazonaws.com"
    zone_id                = "ZWKZPGTI48KDX"
  }

  multivalue_answer_routing_policy = "false"
  name                             = "applicant.hyobeom.shop"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--Z071299925RUGS0OOY5Y9_hyobeom-002E-shop.zone_id}"
}

resource "aws_route53_record" "tfer--Z071299925RUGS0OOY5Y9_grafana-002E-hyobeom-002E-shop-002E-_A_" {
  alias {
    evaluate_target_health = "true"
    name                   = "dualstack.weplat-ap2-web-alb-1356917930.ap-northeast-2.elb.amazonaws.com"
    zone_id                = "ZWKZPGTI48KDX"
  }

  multivalue_answer_routing_policy = "false"
  name                             = "grafana.hyobeom.shop"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--Z071299925RUGS0OOY5Y9_hyobeom-002E-shop.zone_id}"
}

resource "aws_route53_record" "tfer--Z071299925RUGS0OOY5Y9_hyobeom-002E-shop-002E-_A_" {
  alias {
    evaluate_target_health = "true"
    name                   = "dualstack.weplat-ap2-web-alb-1356917930.ap-northeast-2.elb.amazonaws.com"
    zone_id                = "ZWKZPGTI48KDX"
  }

  multivalue_answer_routing_policy = "false"
  name                             = "hyobeom.shop"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--Z071299925RUGS0OOY5Y9_hyobeom-002E-shop.zone_id}"
}

resource "aws_route53_record" "tfer--Z071299925RUGS0OOY5Y9_hyobeom-002E-shop-002E-_NS_" {
  multivalue_answer_routing_policy = "false"
  name                             = "hyobeom.shop"
  records                          = ["ns-1398.awsdns-46.org.", "ns-1771.awsdns-29.co.uk.", "ns-410.awsdns-51.com.", "ns-518.awsdns-00.net."]
  ttl                              = "60"
  type                             = "NS"
  zone_id                          = "${aws_route53_zone.tfer--Z071299925RUGS0OOY5Y9_hyobeom-002E-shop.zone_id}"
}

resource "aws_route53_record" "tfer--Z071299925RUGS0OOY5Y9_hyobeom-002E-shop-002E-_SOA_" {
  multivalue_answer_routing_policy = "false"
  name                             = "hyobeom.shop"
  records                          = ["ns-518.awsdns-00.net. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
  ttl                              = "900"
  type                             = "SOA"
  zone_id                          = "${aws_route53_zone.tfer--Z071299925RUGS0OOY5Y9_hyobeom-002E-shop.zone_id}"
}

resource "aws_route53_record" "tfer--Z071299925RUGS0OOY5Y9_jobposting-002E-hyobeom-002E-shop-002E-_A_" {
  alias {
    evaluate_target_health = "true"
    name                   = "dualstack.weplat-ap2-was-alb-1562968229.ap-northeast-2.elb.amazonaws.com"
    zone_id                = "ZWKZPGTI48KDX"
  }

  multivalue_answer_routing_policy = "false"
  name                             = "jobposting.hyobeom.shop"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--Z071299925RUGS0OOY5Y9_hyobeom-002E-shop.zone_id}"
}

resource "aws_route53_record" "tfer--Z071299925RUGS0OOY5Y9_zabbix-002E-hyobeom-002E-shop-002E-_A_" {
  alias {
    evaluate_target_health = "true"
    name                   = "dualstack.weplat-ap2-web-alb-1356917930.ap-northeast-2.elb.amazonaws.com"
    zone_id                = "ZWKZPGTI48KDX"
  }

  multivalue_answer_routing_policy = "false"
  name                             = "zabbix.hyobeom.shop"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--Z071299925RUGS0OOY5Y9_hyobeom-002E-shop.zone_id}"
}
