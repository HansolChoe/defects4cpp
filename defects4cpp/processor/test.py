from defects4cpp.processor.core.argparser import BuildParser
from defects4cpp.processor.core.command import SimpleBuildCommand


class TestCommandParser(BuildParser):
    def __init__(self):
        super().__init__()
        self.parser.usage = (
            "d++ test --project=[project_name] --no=[number] [checkout directory]"
        )


class TestCommand(SimpleBuildCommand):
    def __init__(self):
        pass

    @property
    def help(self) -> str:
        return "Do test without coverage"
