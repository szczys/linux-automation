from datetime import date
import os.path

# <Registry>
#   <Software>
#     <SEGGER LogFileJLink="" LogFileJLink_SEGGERRegType="SYS_REG_TYPE_SZ">
#       <J-Link StartMinimized="0x00000001" StartMinimized_SEGGERRegType="SYS_REG_TYPE_DWORD" StayOnTop="0x00000001" StayOnTop_SEGGERRegType="SYS_REG_TYPE_DWORD" LogIsHalted="0x00000001" LogIsHalted_SEGGERRegType="SYS_REG_TYPE_DWORD" LogInternal="0x00000001" LogInternal_SEGGERRegType="SYS_REG_TYPE_DWORD" OverrideConfigFile="0x00000000" OverrideConfigFile_SEGGERRegType="SYS_REG_TYPE_DWORD" OverrideLogFile="0x00000000" OverrideLogFile_SEGGERRegType="SYS_REG_TYPE_DWORD" ConfigFile="" ConfigFile_SEGGERRegType="SYS_REG_TYPE_SZ" LogFile="" LogFile_SEGGERRegType="SYS_REG_TYPE_SZ" NotifyOnSecurityUpdate="0x00000000" NotifyOnSecurityUpdate_SEGGERRegType="SYS_REG_TYPE_DWORD" UpdateNotificationMode="0x00000000" UpdateNotificationMode_SEGGERRegType="SYS_REG_TYPE_DWORD">
#         <DontShowAgain LicenseLPCLink2_DontShowAgainToday="0x07E9040F" LicenseLPCLink2_DontShowAgainToday_SEGGERRegType="SYS_REG_TYPE_DWORD" LicenseMCULink_DontShowAgainToday="0x00000000" LicenseMCULink_DontShowAgainToday_SEGGERRegType="SYS_REG_TYPE_DWORD"/>
#       </J-Link>
#     </SEGGER>
#   </Software>
# </Registry>

# Line where `*_DontShowAgainToday` is found
TARGET_LINE = 4

def patch_for_debugger(kind):
    splitter = f'License{kind}_DontShowAgainToday="'

    registry = os.path.expanduser("~/.config/SEGGER/SEGGER_REG_HKEY_CURRENT_USER.xml")
    lines = open(registry).readlines()

    target_line = lines[TARGET_LINE]
    print(target_line)
    before, rest = target_line.split(splitter)
    prev_date, after = rest.split('"', 1)

    today = date.today()
    def hx(i, n):
        return hex(i)[2:].rjust(n, '0')

    year = hx(today.year, 4).upper()
    month = hx(today.month, 2).upper()
    day = hx(today.day, 2).upper()

    try:
        old_date = date(
            int(prev_date[:6], 16),
            int(prev_date[6:8], 16),
            int(prev_date[8:], 16),
        )
    except ValueError:
        old_date = "N/a"
        # for safety
        if prev_date != "0x00000000":
            return

    new_date = f"0x{year}{month}{day}"
    print(f"bumping date from {prev_date} ({old_date}) -> {new_date} ({today})")

    lines[TARGET_LINE] = before + splitter + new_date + '"' + after

    with open(registry, "w") as fh:
        for line in lines:
            # the original has this
            # fh.write(line[:-1]+ "\r\n")
            fh.write(line)

for kind in ["LPCLink2", "MCULink"]:
    patch_for_debugger(kind)
