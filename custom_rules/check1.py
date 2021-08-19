from lark import Token
import os

from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckResult, CheckCategories


class CustomTag1(BaseResourceCheck):
    def __init__(self):
        name = "Demo Tag Check: Adds extra enforcement for non production-approved teams."
        id = "CUSTOM_TAG_1"
        supported_resources = ['*']
        # CheckCategories are defined in models/enums.py
        categories = [CheckCategories.BACKUP_AND_RECOVERY]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        """
        Looks for changes not written by production team (example)
        :param conf: terraform_resource configuration
        :return: <CheckResult>
        """
        if 'tags' in conf.keys():
            for key in conf['tags'][0].keys():
                if key == "level":
                    if conf['tags'][0]['level'] != "production":
                        return CheckResult.FAILED
        return CheckResult.PASSED


scanner = CustomTag1()
