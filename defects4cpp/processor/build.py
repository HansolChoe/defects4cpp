from defects4cpp.processor.core.argparser import BuildParser
from defects4cpp.processor.core.command import SimpleBuildCommand
from defects4cpp.taxonomy import MetaData


class BuildCommandParser(BuildParser):
    def __init__(self):
        super().__init__()
        self.parser.usage = (
            "d++ build --project=[project_name] --no=[number] [checkout directory]"
        )


class BuildCommand(SimpleBuildCommand):
    parser = BuildCommandParser()

    def __init__(self):
        # action: builder
        pass

    def run(self, metadata: MetaData, index: int, buggy=True) -> bool:
        raise RuntimeError("I am called!")

    @property
    def help(self) -> str:
        return "Build local with a build tool from docker"
